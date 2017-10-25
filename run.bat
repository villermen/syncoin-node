REM Whatever, Batch sucks

@ECHO OFF

SET DATADIR=%~dp0data/
SET NETWORKID=89230491236498

%~dp0bin/geth.exe --datadir "%DATADIR%" init "genesis.json"
%~dp0bin/geth.exe --datadir "%DATADIR%" --networkid "%NETWORKID%" --bootnodes "enode://0585547e6c553e54dc9740dbc5b5827c87d3e5e3f640de32ae2f56902b4dc5a663210b6e4971bfdabb781a857440d6afa7ca9339d8bdced61ae425a5d58f5bd7@88.159.207.186:30303" --rpc --rpccorsdomain "http://localhost:8000" console
