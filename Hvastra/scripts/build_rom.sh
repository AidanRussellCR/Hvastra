#!/bin/bash
set -e

mkdir -p build

ca65 ../runtime/src/main.asm -o build/main.o
ca65 ../runtime/src/core/ppu.asm -o build/ppu.o
ca65 ../runtime/src/core/interrupts.asm -o build/interrupts.o
ca65 ../runtime/src/header.asm -o build/header.o
ca65 ../runtime/src/vectors.asm -o build/vectors.o

ld65 \
    -C ../runtime/cfg/lorom.cfg \
    -o build/hvastra.sfc \
    build/main.o \
    build/ppu.o \
    build/interrupts.o \
    build/header.o \
    build/vectors.o

echo "Built: build/hvastra.sfc"
