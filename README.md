This github repository follows the article I [posted on my blog](http://rog3rsm1th.github.io/posts/set-up-risc-v-developpement-environment/) where I explain how I set up a RISC-V development environment on my machine for the purpose of developing RISC-V assembler programs and analysis of RISC-V linux malwares.

# Installation 

```bash
./script/install.sh
```

The default credentials for the Debian image are `debian:debian` and `root:root`.

To mount the shared folder, run this script on the guest machine :

```bash
SHARED_FOLDER="/mnt/share"

#  Create shared folder
mkdir ${SHARED_FOLDER}
mount -t 9p -o trans=virtio,version=9p2000.L hostshare ${SHARED_FOLDER}
```

# Run the setup

```bash
$ ~ ./scripts/run.sh
```

# Program in RISC-V assembler

If you want to program directly in RISC-V assembler, modify the file `/src/program.s`

To compile your code, run this script on the host machine : 
```
$ ~ ./ script/run/sh
```

You now have an executable binary on your guest machine that you can run: 

```
debian@debian:/mnt/share# ./program
```