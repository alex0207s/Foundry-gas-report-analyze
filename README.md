## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

### Common command

```shell
$ # To load the variables in the .env file
source .env
```

```shell
# send a transaction
$ forge script script/Example.s.sol:Example --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
```

#### return a check sum address

```shell
cast to-check-sum-address
```

### Gas profile command

#### forge snapshot

```shell
forge snapshot --force
```

#### cast estimate

```shell
cast estimate <target contract> <calldata> -r $SEPOLIA_RPC_URL -f <from adderss>
```

#### forge test

```shell
// Test in local
forge test --match-contract ExampleTest -vvvvv

// Test with the select fork
forge test --match-contract ExampleOnChainTest -vvvvv
```

#### Analyze a on-chain transaction

```shell
cast run <TX_HASH> -t -r $SEPOLA_RUC_URL
```
