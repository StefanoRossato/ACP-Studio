#!/bin/bash

echo "================================="
echo " ACP Studio - Clean Runtime"
echo "================================="
echo

REAPER_DIR="$HOME/Library/Application Support/REAPER"

SCRIPTS_DIR="$REAPER_DIR/Scripts/ACP Studio"
EFFECTS_DIR="$REAPER_DIR/Effects/ACP Studio"

remove_dir() {

    local dir="$1"

    if [ -d "$dir" ]; then

        rm -rf "$dir"

        echo "[ OK ] Removed:"
        echo "       $dir"

    else

        echo "[SKIP] Not found:"
        echo "       $dir"

    fi

}

remove_dir "$SCRIPTS_DIR"
remove_dir "$EFFECTS_DIR"

echo
echo "Runtime cleanup completed."

exit 0