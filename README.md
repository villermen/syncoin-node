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

See the instructions within the [pi64](pi64) directory of this repository to set up mining with a RPi.
