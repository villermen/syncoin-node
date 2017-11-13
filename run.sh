#!/bin/bash

# Move to script directory
cd "$(dirname $0)"

# Network parameters
DATADIR="data/"
NETWORKID=89230491236498

# Initialize data with genesis block
if [ ! -d "$DATADIR" ]; then
    ./bin/geth --datadir "$DATADIR" init "genesis.json"
    INITIALIZATION_ERROR=$?
else
    INITIALIZATION_ERROR=0
fi

if [ "$INITIALIZATION_ERROR" -ne 0 ]; then
    echo "Initialization failed. Console not started!"
    exit 1
else
    ./bin/geth --datadir "$DATADIR" --networkid "$NETWORKID" --bootnodes "enode://e76d45675a61439e9a1649f56631bc0f2689bb7e95aecbf40e700d53f311ef75ac559cbcdfb9f00cb5652395c2478ea01239d233fc38a63d152ef8ed546778d3@88.159.207.186:30303" --rpc --rpccorsdomain "http://localhost:8000" console
fi

exit 0
