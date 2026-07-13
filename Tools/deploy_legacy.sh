#!/bin/bash
echo "ERROR: This script is obsolete."
exit 1
#----------------------------------------------------------------------
# ACP Studio
#
# Component : INF-001.3
# Tool      : deploy.sh
# Purpose   : Deploy ACP Studio runtime to REAPER
#----------------------------------------------------------------------



set -e

#----------------------------------------------------------------------
# Header
#----------------------------------------------------------------------

echo "================================="
echo " ACP Studio - Deploy"
echo "================================="
echo

#----------------------------------------------------------------------
# Paths
#----------------------------------------------------------------------

TOOLS_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$TOOLS_DIR/.." && pwd)"

REAPER_DIR="$HOME/Library/Application Support/REAPER"

SCRIPTS_DIR="$REAPER_DIR/Scripts/ACP Studio"
EFFECTS_DIR="$REAPER_DIR/Effects/ACP Studio"

#----------------------------------------------------------------------
# Runtime Components
#----------------------------------------------------------------------

SCRIPT_COMPONENTS=(
    "ACP_Main.lua"
    "Core"
    "Tests"
)

#----------------------------------------------------------------------
# Step 1 - Verify Repository
#----------------------------------------------------------------------

echo "Step 1/5 - Verifying repository..."
echo

"$TOOLS_DIR/verify.sh"

#----------------------------------------------------------------------
# Step 2 - Clean Runtime
#----------------------------------------------------------------------

echo
echo "Step 2/5 - Cleaning runtime..."
echo

"$TOOLS_DIR/clean.sh"

#----------------------------------------------------------------------
# Step 3 - Create Runtime Directories
#----------------------------------------------------------------------

echo
echo "Step 3/5 - Creating runtime directories..."
echo

mkdir -p "$SCRIPTS_DIR"
mkdir -p "$EFFECTS_DIR"

echo "[ OK ] Created:"
echo "       $SCRIPTS_DIR"

echo "[ OK ] Created:"
echo "       $EFFECTS_DIR"

#----------------------------------------------------------------------
# Step 4 - Deploy Lua Runtime
#----------------------------------------------------------------------

echo
echo "Step 4/5 - Deploying Lua runtime..."
echo

for component in "${SCRIPT_COMPONENTS[@]}"
do

    SOURCE="$ROOT_DIR/$component"

    if [ ! -e "$SOURCE" ]; then

        echo "[FAIL] Missing:"
        echo "       $SOURCE"
        exit 1

    fi

    cp -R "$SOURCE" "$SCRIPTS_DIR"

    echo "[ OK ] Deployed:"
    echo "       $component"

done

#----------------------------------------------------------------------
# Step 5 - Deploy JSFX
#----------------------------------------------------------------------

echo
echo "Step 5/5 - Deploying JSFX..."
echo

if [ ! -d "$ROOT_DIR/JSFX" ]; then

    echo "[FAIL] Missing:"
    echo "       $ROOT_DIR/JSFX"
    exit 1

fi

cp -R "$ROOT_DIR/JSFX/." "$EFFECTS_DIR"

echo "[ OK ] Deployed:"
echo "       JSFX"

#----------------------------------------------------------------------
# Completed
#----------------------------------------------------------------------

echo
echo "================================="
echo " Deployment completed."
echo "================================="

exit 0