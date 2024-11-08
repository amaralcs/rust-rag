#!/bin/bash

BOOK_DIR="./book/"
PDF_DIR="./pdf/"

if [ ! -d "$PDF_DIR" ]; then
    mkdir "$PDF_DIR"
fi

files=$(find "$BOOK_DIR" -type f -name "*.html")

count=0
for file in $files; do
    if ((count % 50 == 0)); then
        echo "Processed $count ..."
    fi

    count=$((count + 1))
    filename=$(basename "$file" .html)
    

    # pandoc -s -o "$PDF_DIR$filename".pdf "$file"
    pandoc --from html --to plain --output "$PDF_DIR$filename".txt "$file"

done