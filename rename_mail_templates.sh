#!/usr/bin/env bash
set -euo pipefail

VERSION="2025-09-09.3"
# ...existing code...

slugify() {
  # ...existing code...
}

# Form helpers
is_form_file() {
  local file="$1" base="$2"
  [[ "$file" == *"/Formulare/"* || "$file" == *"/Webseiten Widget/"* || "$base" =~ Formular ]]
}

form_topic_slug() {
  local s="$1"
  s="$(printf '%s' "$s" \
      | sed -E $'s/[–—-]+/ /g; s/[[:space:]]+/ /g; s/^[[:space:]]+|[[:space:]]+$//g')"
  s="$(printf '%s' "$s" | sed -E 's/^Intern(er|e)?[[:space:]]+//I')"
  s="$(printf '%s' "$s" | sed -E 's/Kontakt[[:space:]]*formular\b/Kontakt/I')"
  s="$(printf '%s' "$s" | sed -E 's/[[:space:]]+Formular\b//I')"
  slugify "$s"
}

standard_slug() {
  # ...existing code...
}

update_title() {
  # ...existing code...
}

echo "Arbeitsverzeichnis: $BASE_DIR"
# ...existing code...

echo "Start v${VERSION}: DRY_RUN=$DRY_RUN UPDATE_TITLE=$UPDATE_TITLE VERBOSE=$VERBOSE DEBUG=$DEBUG NO_ICONV=$NO_ICONV"

while IFS= read -r -d '' file; do
  # ...existing code...
  base="${name%.html}"

  # Prefix bestimmen
  # ...existing code...

  newname=""
  # FORM-Gruppierung
  if is_form_file "$file" "$base"; then
    topic="$(form_topic_slug "$base")"; topic="${topic:-template}"
    newname="${prefix}_FORM_${topic}.html"
  elif [[ "$prefix" == "INT" || "$prefix" == "KND" ]]; then
    # ...existing numbered logic...
  else
    # ...existing EXT generic logic...
  fi

  # ...existing code...
done < <(find . -type f -name '*.html' -print0)

# ...existing code...
