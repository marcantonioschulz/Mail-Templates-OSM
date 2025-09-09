#!/usr/bin/env bash
set -euo pipefail

VERSION="2025-09-09.4"
BASE_DIR="."
DRY_RUN=0
UPDATE_TITLE=0
VERBOSE=0
DEBUG=0
NO_ICONV=0
SELF_CHECK=0

# Always print script path + version first (POSIX-safe, no 'basename --' / 'cd --')
SCRIPT_PATH="${0}"
case "${SCRIPT_PATH}" in
  /*) ;;                                # absolute, keep
  *) SCRIPT_PATH="$(pwd -P)/${SCRIPT_PATH}" ;;
esac
echo "Script: ${SCRIPT_PATH} (v${VERSION})"

usage() {
  cat <<EOF
Rename mail templates to normalized scheme:
  Interner Termin – 03 Reschedule ... -> INT_03_reschedule_verschoben.html
  Kundentermin – 02 Erinnerung.html   -> KND_02_erinnerung.html
  Intern Kontaktformular.html         -> INT_kontaktformular.html
  Extern ...                          -> EXT_<slug>.html

Options:
  --dry-run        Show actions only
  --update-title   Also rewrite <title> for numbered calendar templates ([INT 03] ...)
  --verbose        More logging
  --debug          Trace execution (set -x)
  --no-iconv       Disable transliteration (debug iconv issues)
  --base-dir DIR   Override BASE_DIR (default: ".")
  --version        Print script version and exit
  --self-check     Find nearby duplicates and print their versions
  -h, --help       Help
EOF
}

pending_base_dir=""
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    --update-title) UPDATE_TITLE=1 ;;
    --verbose) VERBOSE=1 ;;
    --debug) DEBUG=1 ;;
    --no-iconv) NO_ICONV=1 ;;
    --base-dir) pending_base_dir=1 ;;
    --version) echo "$VERSION"; exit 0 ;;
    --self-check) SELF_CHECK=1 ;;
    -h|--help) usage; exit 0 ;;
    *)
      if [[ -n "$pending_base_dir" ]]; then
        BASE_DIR="$arg"; pending_base_dir=""
      else
        echo "Unbekannte Option: $arg"; usage; exit 1
      fi
      ;;
  esac
done
[[ -n "$pending_base_dir" ]] && { echo "--base-dir benötigt einen Wert"; exit 1; }

if [[ "$DEBUG" -eq 1 ]]; then
  PS4='[DEBUG] ${BASH_SOURCE##*/}:${LINENO}: '; set -x
fi

trap 'rc=$?; echo "FEHLER (exit $rc) in Zeile $LINENO: $BASH_COMMAND" >&2' ERR

if [[ "$SELF_CHECK" -eq 1 ]]; then
  echo "Self-check (looking for duplicate scripts near here):"
  # Use already absolute SCRIPT_PATH to compute ROOT robustly
  ROOT="$(cd "$(dirname "$SCRIPT_PATH")"/.. && pwd -P)"
  while IFS= read -r -d '' f; do
    # Use sed to extract version; never fail under set -e/pipefail
    v="$(sed -nE 's/^VERSION="([^"]+)".*/\1/p;q' "$f" || true)"
    echo " - $f  ${v:+(v$v)}"
  done < <(find "$ROOT" -maxdepth 3 -type f -name 'rename_mail_templates*.sh' -print0)
  exit 0
fi

# Detect sed (macOS vs GNU)
if command -v gsed >/dev/null 2>&1; then
  SED_INPLACE=(gsed -i'')
elif sed --version >/dev/null 2>&1; then
  SED_INPLACE=(sed -i'')
else
  SED_INPLACE=(sed -i '')
fi

slugify() {
  local in="$1"
  # Remove zero-width, NBSP and combining marks (robust on macOS/BSD)
  in="$(printf '%s' "$in" | perl -CSDA -Mutf8 -pe 's/[\x{2009}\x{200a}\x{200b}\x{202f}\x{00a0}\x{0300}-\x{036F}]//g' 2>/dev/null || printf '%s' "$in")"
  # Map German umlauts before iconv to avoid quotes
  in="$(printf '%s' "$in" | sed -e 's/ä/ae/g; s/ö/oe/g; s/ü/ue/g; s/Ä/Ae/g; s/Ö/Oe/g; s/Ü/Ue/g; s/ß/ss/g')"

  local translit="$in"
  if [[ "$NO_ICONV" -eq 0 ]]; then
    local tmp
    tmp="$(printf '%s' "$in" | { iconv -c -f UTF-8 -t ASCII//TRANSLIT 2>/dev/null || true; })"
    [[ -n "$tmp" ]] && translit="$tmp"
    [[ "$VERBOSE" -eq 1 ]] && echo "[slugify] iconv aktiv" >&2
  else
    [[ "$VERBOSE" -eq 1 ]] && echo "[slugify] iconv deaktiviert (--no-iconv)" >&2
  fi

  printf '%s' "$translit" \
    | LC_ALL=C tr '[:upper:]' '[:lower:]' \
    | sed -E 's/[^a-z0-9]+/_/g; s/^_+|_+$//g'
}

# Form helpers
is_form_file() {
  local file="$1" base="$2"
  [[ "$file" == *"/Formulare/"* || "$file" == *"/Webseiten Widget/"* || "$base" =~ Formular ]]
}

form_topic_slug() {
  local s="$1"
  # Keep meaningful words, drop only generic noise, normalize separators
  s="$(printf '%s' "$s" \
      | sed -E $'s/[–—-]+/ /g; s/[[:space:]]+/ /g; s/^[[:space:]]+|[[:space:]]+$//g')"
  # Strip leading "Intern" only (keep Kunde/Bewerber for recognition)
  s="$(printf '%s' "$s" | sed -E 's/^Intern(er|e)?[[:space:]]+//I')"
  # Collapse Kontaktformular -> Kontakt
  s="$(printf '%s' "$s" | sed -E 's/Kontakt[[:space:]]*formular\b/Kontakt/I')"
  # Remove trailing generic "Formular"
  s="$(printf '%s' "$s" | sed -E 's/[[:space:]]+Formular\b//I')"
  # Result to slug
  slugify "$s"
}

standard_slug() {
  local prefix="$1" num="$2" raw_slug="$3" v2_flag="$4"
  local base=""
  case "${prefix}_${num}" in
    INT_01) base="bestaetigung_neuer_termin" ;;
    INT_02) base="reminder_beginnt_bald" ;;
    INT_03) base="reschedule_verschoben" ;;
    INT_04) base="storno_abgesagt" ;;
    INT_05) base="lead_kein_termin" ;;
    KND_01) base="bestaetigung" ;;
    KND_02) base="erinnerung" ;;
    KND_03) base="termin_verschoben" ;;
    KND_04) base="termin_abgesagt" ;;
    KND_05) base="termin_fehlt" ;;
    *) base="$raw_slug" ;;
  esac
  [[ "$v2_flag" == "1" ]] && base="${base}_v2"
  printf '%s' "$base"
}

update_title() {
  local file="$1" prefix="$2" num="$3"
  local label="[$prefix $num]"
  if grep -qi '<title>' "$file"; then
    local current cleaned new
    current="$(grep -i '<title>' "$file" | head -1 | sed -E 's/.*<title>(.*)<\/title>.*/\1/i')"
    cleaned="$(printf '%s' "$current" | sed -E 's/^\[[^]]+\][[:space:]]*//')"
    new="${label} ${cleaned}"
    if [[ "$DRY_RUN" -eq 1 ]]; then
      echo "  (Titel) $current -> $new"
    else
      "${SED_INPLACE[@]}" -E "0,/<title>/{s|<title>[^<]*</title>|<title>${new}</title>|I}" "$file"
    fi
  fi
}

echo "Arbeitsverzeichnis: $BASE_DIR"
[[ -d "$BASE_DIR" ]] || { echo "FEHLER: Verzeichnis '$BASE_DIR' existiert nicht." >&2; exit 2; }
cd "$BASE_DIR"

count_total=0
count_processed=0
count_skipped=0
count_normalized=0
count_collisions=0

echo "Start v${VERSION}: DRY_RUN=$DRY_RUN UPDATE_TITLE=$UPDATE_TITLE VERBOSE=$VERBOSE DEBUG=$DEBUG NO_ICONV=$NO_ICONV"

# Iterate recursively
while IFS= read -r -d '' file; do
  ((count_total++))
  [[ "$VERBOSE" -eq 1 ]] && echo "[Scan] $file"
  name="$(basename "$file")"
  dir="$(dirname "$file")"

  # Already normalized?
  if [[ "$name" =~ ^(INT|KND|EXT)_[0-9]{2}_[a-z0-9_]+\.html$ || "$name" =~ ^(INT|KND|EXT)_[a-z0-9_]+\.html$ ]]; then
    ((count_normalized++))
    echo "Skip (ok): $file"
    if [[ "$UPDATE_TITLE" -eq 1 && "$name" =~ ^(INT|KND)_[0-9]{2}_ ]]; then
      prefix="${name:0:3}"; num="${name:4:2}"
      [[ "$DRY_RUN" -eq 1 ]] && echo "  (Titel-Check) $file"
      update_title "$file" "$prefix" "$num"
    fi
    continue
  fi

  base="${name%.html}"

  # Prefix detection
  prefix=""
  if [[ "$base" =~ ^Interner[[:space:]]+Termin ]]; then
    prefix="INT"
  elif [[ "$base" =~ ^Kundentermin ]]; then
    prefix="KND"
  elif [[ "$base" =~ ^Intern[[:space:]] ]]; then
    prefix="INT"
  else
    if grep -qiE 'Interner Hinweis|Internes' "$file" 2>/dev/null; then
      prefix="INT"
    else
      prefix="EXT"
    fi
  fi

  newname=""

  # Forms and Widgets: group under FORM_<topic>
  if is_form_file "$file" "$base"; then
    topic="$(form_topic_slug "$base")"; topic="${topic:-template}"
    newname="${prefix}_FORM_${topic}.html"
  elif [[ "$prefix" == "INT" || "$prefix" == "KND" ]]; then
    # Calendar logic (numbered)
    if num_raw="$(grep -oE '[0-9]{1,2}' <<<"$base" | head -1)"; then
      num="$(printf '%02d' "$num_raw")"
      desc_part="$(sed -E "s/^.*${num_raw}[[:space:]:–-]*//" <<<"$base")"
      v2_flag=0; [[ "$desc_part" =~ [Vv]2 ]] && v2_flag=1
      raw_slug="$(slugify "$desc_part")"; raw_slug="${raw_slug:-template}"
      final_slug="$(standard_slug "$prefix" "$num" "$raw_slug" "$v2_flag")"
      newname="${prefix}_${num}_${final_slug}.html"
    else
      desc_clean="$(sed -E 's/^(Interner[[:space:]]+Termin|Kundentermin|Intern|Extern)[[:space:]:–-]*//' <<<"$base")"
      # nur getrenntes Wort " Formular" entfernen, nicht "Kontaktformular"
      desc_clean="$(sed -E 's/[[:space:]]+Formular$//' <<<"$desc_clean")"
      final_slug="$(slugify "$desc_clean")"; final_slug="${final_slug:-template}"
      newname="${prefix}_${final_slug}.html"
    fi
  else
    desc_clean="$(sed -E 's/^(Extern)[[:space:]:–-]*//' <<<"$base")"
    # nur getrenntes Wort " Formular" entfernen
    desc_clean="$(sed -E 's/[[:space:]]+Formular$//' <<<"$desc_clean")"
    final_slug="$(slugify "$desc_clean")"; final_slug="${final_slug:-template}"
    newname="${prefix}_${final_slug}.html"
  fi

  target="$dir/$newname"
  if [[ -e "$target" ]]; then
    ((count_collisions++))
    echo "Kollision: $target existiert – überspringe $file"
    continue
  fi

  ((count_processed++))
  echo "Rename: $file -> $target"
  if [[ "$DRY_RUN" -eq 0 ]]; then
    mv "$file" "$target"
    if [[ "$UPDATE_TITLE" -eq 1 && "$newname" =~ ^(INT|KND)_[0-9]{2}_ ]]; then
      num="${newname:4:2}"
      update_title "$target" "$prefix" "$num"
    fi
  fi
done < <(find . -type f -name '*.html' -print0)

echo "Fertig."
echo "Zusammenfassung:"
echo "  Gesamt Dateien:     $count_total"
echo "  Bereits normiert:   $count_normalized"
echo "  Umbenannt:          $count_processed"
echo "  Übersprungen (kein Match): $count_skipped"
echo "  Kollisionen:        $count_collisions"
[[ "$VERBOSE" -eq 1 ]] && echo "Beendet $(date '+%Y-%m-%d %H:%M:%S')"
