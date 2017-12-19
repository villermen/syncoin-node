# SynCoin node

## The node software

`run.sh` will initialize and run a SynCoin node interactively.
If the `--mine` argument is supplied, it will start to mine without interactivity.
The miner will mine to a predefined address by default.
You can change this by editing the script (for now).

The node will detect and run on the following platforms:
- Linux x64
- Arch Linux x64 ARM
- Windows x64 through MinGW or MSYS2 (or git-bash)

## Mining on a Raspberry Pi

The releases section contains a customized image of Amarni's [pi64](https://github.com/bamarni/pi64) operating system.
You can install it on a Raspberry Pi 3 using [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/), [Rufus](https://rufus.akeo.ie/) or a similar tool.

The image runs a `syncoind` service at startup that will pull in the latest changes from this repository and then starts mining.
Alternatively, the service can be interacted with using systemd commands like `sudo systemctl stop syncoind`, `sudo systemctl start syncoind` and `sudo journalctl --follow --unit syncoind`.