#!/bin/bash

# Mod cloner script for BG2EE
# Clones GitHub repos to get source code for WeiDU installation

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo -e "${RED}Error: jq is required but not installed.${NC}"
    echo "Install with: brew install jq"
    exit 1
fi

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
JSON_FILE="$SCRIPT_DIR/mod_downloads.json"

# Default download folder
MODS_FOLDER="${1:-$SCRIPT_DIR/mods}"

# Create mods folder if it doesn't exist
mkdir -p "$MODS_FOLDER"

echo -e "${GREEN}Cloning mods to: $MODS_FOLDER${NC}"
echo ""

# Read JSON and process each mod
mods_count=$(jq '.mods | length' "$JSON_FILE")
manual_mods=()

for ((i=0; i<$mods_count; i++)); do
    name=$(jq -r ".mods[$i].name" "$JSON_FILE")
    github=$(jq -r ".mods[$i].github" "$JSON_FILE")
    tp2=$(jq -r ".mods[$i].tp2" "$JSON_FILE")
    url=$(jq -r ".mods[$i].url" "$JSON_FILE")

    echo -e "${YELLOW}Processing: $name${NC}"

    if [ "$github" != "null" ]; then
        # GitHub mod - clone the repo
        repo_url="https://github.com/$github.git"
        target_dir="$MODS_FOLDER/$tp2"

        if [ -d "$target_dir" ]; then
            echo -e "  ${GREEN}✓ Already cloned: $target_dir${NC}"
        else
            echo "  Cloning from: $github"
            if git clone "$repo_url" "$target_dir" 2>&1 | grep -q "empty"; then
                echo -e "  ${RED}Warning: Repository might be empty${NC}"
            fi
            echo -e "  ${GREEN}✓ Cloned to: $target_dir${NC}"
        fi
    else
        # Non-GitHub mod - needs manual download
        echo -e "  ${YELLOW}Manual download required${NC}"
        manual_mods+=("$name - $url")
    fi

    echo ""
done

echo -e "${GREEN}Clone complete!${NC}"
echo ""

# Show manual downloads if any
if [ ${#manual_mods[@]} -gt 0 ]; then
    echo -e "${YELLOW}The following mods require manual download:${NC}"
    for mod in "${manual_mods[@]}"; do
        echo "  • $mod"
    done
    echo ""
fi

# Summary
echo -e "${GREEN}Mod folders created in: $MODS_FOLDER${NC}"
echo "You can now copy these folders to your BG2EE installation directory."
