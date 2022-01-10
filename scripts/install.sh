#!/bin/bash

# usage : ./script/install.sh

mkdir image
wget https://gitlab.com/api/v4/projects/giomasce%2Fdqib/jobs/artifacts/master/download?job=convert_riscv64-virt -O ./image/debian-rv64.zip
unzip ./image/debian-rv64.zip -d ./image/