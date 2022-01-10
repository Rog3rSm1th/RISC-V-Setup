#!/bin/bash

# usage : ./script/run.sh

# This script emulates a RISC-V machine 
# with a shared folder with the host machine.

qemu-system-riscv64 \
    -machine virt \
    -cpu rv64 \
    -m 1G \
    -device virtio-blk-device,drive=hd \
    -drive file=./image/artifacts/overlay.qcow2,if=none,id=hd \
    -device virtio-net-device,netdev=net \
    -netdev user,id=net,hostfwd=tcp::2222-:22 \
    -bios /usr/lib/riscv64-linux-gnu/opensbi/generic/fw_jump.elf \
    -kernel /usr/lib/u-boot/qemu-riscv64_smode/uboot.elf \
    -object rng-random,filename=/dev/urandom,id=rng \
    -device virtio-rng-device,rng=rng \
    -append "root=LABEL=rootfs console=ttyS0" \
    -nographic \
    -fsdev local,security_model=passthrough,id=fsdev0,path=./share \
    -device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare