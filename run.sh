#!/bin/bash

# Move to directory of script
cd "$(dirname $0)"

# Network parameters
DATADIR=data/
NETWORKID=986912

# Parse arguments
GETH_ARGS="console"
while [ "$1" != "" ]; do
    case $1 in
      "--mine")
        GETH_ARGS="--mine"
        ;;
	  "--daemon")
	    GETH_ARGS=""
		;;
    esac
    shift
done

# Decide binary based on architecture
UNAME="$(uname -a)"
UNAME=${UNAME,,}
if [[ $UNAME == *"aarch64"* ]]; then
    BINARY=geth-arm64
elif [[ $UNAME == *"msys"* ]]; then
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
--bootnodes "enode://e76d45675a61439e9a1649f56631bc0f2689bb7e95aecbf40e700d53f311ef75ac559cbcdfb9f00cb5652395c2478ea01239d233fc38a63d152ef8ed546778d3@88.159.207.186:30303,enode://09b6a770e642a987696a8cbc2764d54122f6f4ce660fd74e22836854782e6f878b5691b391ea42f1008cc017287a6abf7bf135e282b5d8198894e01ddd437802@141.138.196.235:30303" \
--rpc --rpccorsdomain "http://localhost:8000" \
--ws --wsport 8546 --wsorigins "*" --wsapi "eth,web3,net" \
--gasprice 0 --minerthreads 1 --etherbase "0x66974E872deaf3B9eF4a2EAa3689c8Fd00bC70FE" \
$GETH_ARGS
