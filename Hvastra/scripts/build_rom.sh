#!/bin/bash
set -e

mkdir -p build

# Core
ca65 ../runtime/src/main.asm -o build/main.o
ca65 ../runtime/src/core/ppu.asm -o build/ppu.o
ca65 ../runtime/src/core/interrupts.asm -o build/interrupts.o

# Data
ca65 ../runtime/data/palette.asm -o build/palette.o
ca65 ../runtime/data/tiles.asm -o build/tiles.o
ca65 ../runtime/data/tilemap.asm -o build/tilemap.o
ca65 ../runtime/data/collision.asm -o build/collision_data.o
ca65 ../runtime/src/map/collision.asm -o build/collision.o

# System
ca65 ../runtime/src/header.asm -o build/header.o
ca65 ../runtime/src/vectors.asm -o build/vectors.o

# Player
ca65 ../runtime/src/core/input.asm -o build/input.o
ca65 ../runtime/src/map/player.asm -o build/player.o

ld65 \
    -C ../runtime/cfg/lorom.cfg \
    -o build/hvastra.sfc \
    build/main.o \
    build/ppu.o \
    build/interrupts.o \
    build/palette.o \
    build/tiles.o \
    build/tilemap.o \
    build/collision_data.o \
    build/collision.o \
    build/header.o \
    build/vectors.o \
    build/input.o \
    build/player.o

echo "Built: build/hvastra.sfc"
