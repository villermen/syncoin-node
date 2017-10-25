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
    ./bin/geth --datadir "$DATADIR" --networkid "$NETWORKID" --bootnodes "enode://0585547e6c553e54dc9740dbc5b5827c87d3e5e3f640de32ae2f56902b4dc5a663210b6e4971bfdabb781a857440d6afa7ca9339d8bdced61ae425a5d58f5bd7@88.159.207.186:30303" --rpc --rpccorsdomain "http://localhost:8000" console
fi

exit 0
