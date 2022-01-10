#!/bin/bash

# usage : ./scripts/reset.sh

# This script will reset the Debian image

qemu-img create -o backing_file=image.qcow2,backing_fmt=qcow2 -f qcow2 ./image/artifacts/overlay.qcow2