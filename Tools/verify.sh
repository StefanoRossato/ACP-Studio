#!/bin/bash

echo "================================="
echo " ACP Studio - Verify Repository"
echo "================================="
echo

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

ERRORS=0

check() {

    if [ -e "$ROOT/$1" ]; then

        echo "[ OK ] $1"

    else

        echo "[FAIL] $1"
        ERRORS=$((ERRORS+1))

    fi

}
check "Tools"
check "ACP_Main.lua"
check "Core"
check "Documentation"
check "JSFX"
check "Tests"
check "README.md"
check "CHANGELOG.md"

echo

if [ "$ERRORS" -eq 0 ]; then

    echo "Repository verification PASSED."
    exit 0

else

    echo "Repository verification FAILED."
    exit 1

fi