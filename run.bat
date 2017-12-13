@ECHO OFF

REM Network parameters
SET DATADIR=%~dp0data
SET NETWORKID=9869

REM Initialize data with genesis block
%~dp0/bin/geth-windows-amd64.exe --datadir "%DATADIR%" init "genesis.json"

REM Run node
%~dp0/bin/geth-windows-amd64.exe --datadir "%DATADIR%" --networkid "%NETWORKID%" ^
--bootnodes "enode://e76d45675a61439e9a1649f56631bc0f2689bb7e95aecbf40e700d53f311ef75ac559cbcdfb9f00cb5652395c2478ea01239d233fc38a63d152ef8ed546778d3@88.159.207.186:30303" ^
--rpc --rpccorsdomain "http://localhost:8000" ^
--ws --wsport 8546 --wsorigins "*" --wsapi "eth,web3,net" ^
--txpool.pricelimit 0 --gasprice 0 ^
--minerthreads 1 --etherbase "0x66974E872deaf3B9eF4a2EAa3689c8Fd00bC70FE" ^
console
