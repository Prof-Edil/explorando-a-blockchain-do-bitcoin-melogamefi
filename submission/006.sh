# Which tx in block 257,343 spends the coinbase output of block 256,128?
#!/bin/bash

# Obtém o hash do bloco 256,128
BLOCK_HASH_256128=$(bitcoin-cli getblockhash 256128)

# Obtém a transação coinbase do bloco 256,128
COINBASE_TXID=$(bitcoin-cli getblock $BLOCK_HASH_256128 | jq -r '.tx[0]')

# Obtém o hash do bloco 257,343
BLOCK_HASH_257343=$(bitcoin-cli getblockhash 257343)


SPENT_TX=$(bitcoin-cli getblock $BLOCK_HASH_257343 true | jq -r --arg TXID "$COINBASE_TXID" '.tx[] | select(.vin[].txid == $TXID) | .txid')

echo "$SPENT_TX"
