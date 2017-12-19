#!/bin/bash

# Move to directory of script
cd "$(dirname $0)"

# Network parameters
DATADIR=data/
NETWORKID=9869

# Parse arguments
MINE_ARGUMENT=""
while [ "$1" != "" ]; do
    case $1 in
      "--mine")
        MINE_ARGUMENT="--mine"
        ;;
    esac
    shift
done

# Decide binary based on architecture
ARCHITECTURE="$(arch)"
if [[ $ARCHITECTURE == *"aarch64"* ]]; then
    BINARY=geth-arm64
elif [[ $ARCHITECTURE == *"x86_64"* ]]; then
    BINARY=geth-win64
else
    BINARY=geth-amd64
fi

# Initialize data with genesis block
if [ ! -d "$DATADIR" ]; then
    bin/$BINARY --datadir "$DATADIR" init "genesis.json"

    if [ $? != 0 ]; then
        echo "Failed to initialize data directory!"
        exit 1
    fi
fi

# Run node
bin/$BINARY --datadir "$DATADIR" --networkid "$NETWORKID" \
--bootnodes "enode://e76d45675a61439e9a1649f56631bc0f2689bb7e95aecbf40e700d53f311ef75ac559cbcdfb9f00cb5652395c2478ea01239d233fc38a63d152ef8ed546778d3@88.159.207.186:30303" \
--rpc --rpccorsdomain "http://localhost:8000" \
--ws --wsport 8546 --wsorigins "*" --wsapi "eth,web3,net" \
--txpool.pricelimit 0 --gasprice 0 \
--minerthreads 1 --etherbase "0x66974E872deaf3B9eF4a2EAa3689c8Fd00bC70FE" \
$MINE_ARGUMENT \
console
