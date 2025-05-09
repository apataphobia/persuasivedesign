#!/bin/bash

# Define new Jekyll front matter
new_front_matter="---
layout: default
---"

# Target folders
folders=("psychology" "neuroscience")

for folder in "${folders[@]}"; do
  for file in "$folder"/*.html; do
    echo "Converting $file..."

    # Extract from the first <h1> tag onward (i.e., the content)
    content=$(awk '/<h1>/{found=1} found' "$file")

    # Write new layout + trimmed content
    {
      echo "$new_front_matter"
      echo
      echo "$content"
    } > "$file"
  done
done

echo "✅ Done converting all HTML files."
