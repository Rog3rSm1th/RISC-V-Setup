#!/bin/bash

# Usage : ./scripts/compile.sh

# This script will compile the ./src/program.s file for a RISC-V architecture. 
# An executable binary will be generated in the shared folder ./share

ASSEMBLY_DIR="$(dirname $0)/../src"
SHARE_DIR="$(dirname $0)/../share"

riscv64-linux-gnu-as -march=rv64imac -o ${SHARE_DIR}/program.o ${ASSEMBLY_DIR}/program.s
riscv64-linux-gnu-ld -o ${SHARE_DIR}/program ${SHARE_DIR}/program.o
rm ${SHARE_DIR}/program.o
chmod +x ${SHARE_DIR}/program