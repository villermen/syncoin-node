# pi64 SynCoin miner

You can download the latest image of pi64 from [Amarni's repository](https://github.com/bamarni/pi64).
You can install it on a Raspberry Pi 3 using [Win32DiskImager](https://sourceforge.net/projects/win32diskimager/), [Rufus](https://rufus.akeo.ie/) or a similar tool.

Place `install-miner.sh` on the boot partition of the pi64 installation.
Log in through SSH and execute the script as root.
It will set up, install and configure a SynCoin miner to run on boot of the system through systemd.

The service will pull in the latest changes from this repository and then starts mining.
The service can be interacted with using systemd commands like `sudo systemctl stop syncoind`, `sudo systemctl start syncoind` and `sudo journalctl --follow --unit syncoind`.


