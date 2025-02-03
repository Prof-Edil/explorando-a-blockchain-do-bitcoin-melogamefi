# How many new outputs were created by block 123,456?
#!/bin/bash

block_hash="0000000000002917ed80650c6174aac8dfc46f5fe36480aaef682ff6cd83c3ca"
txs=$(bitcoin-cli getblock $block_hash | jq -r '.tx[]')
output_count=0

for tx in $txs; do
    count=$(bitcoin-cli getrawtransaction $tx true | jq '.vout | length')
    output_count=$((output_count + count))
done

echo "$output_count"
