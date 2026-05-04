#!/bin/bash
set -e

ROM="build/hvastra.sfc"

# This script was made with snes9x in mind
if ! command -v snes9x >/dev/null 2>&1; then
    echo "Error: snes9x was not found."
    exit 1
fi

if [ ! -f "$ROM" ]; then
    echo "Error: ROM not found: $ROM"
    echo "Run ./scripts/build_rom.sh first."
    exit 1
fi

snes9x -lorom -ntsc "$ROM"
