#!/bin/bash

BOOK_DIR="./book/"
TXT_DIR="./txt/"

if [ ! -d "$TXT_DIR" ]; then
    mkdir "$TXT_DIR"
fi

files=$(find "$BOOK_DIR" -type f -name "*.html" | grep -E "ch[0-9]{2}")

count=0
for file in $files; do
    filename=$(basename "$file" .html)
    
    # Remove the sidebar content based on its HTML structure
    sed '/<nav id="sidebar" class="sidebar" aria-label="Table of contents">/,/<\/nav>/d' "$file" | \
        sed '/<div id="menu-bar" class="menu-bar sticky">/,/<\/div>/d' | \
        pandoc --no-highlight --from html --to plain --output "$TXT_DIR$filename".txt -
        
    if ((count % 50 == 0)); then
        echo "Processed $count ..."
    fi
    count=$((count + 1))

done