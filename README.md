## Smartly Dressed Addresses

Smartly Dressed Addresses, or "SmaDra", is a smart contract collecting zk-claims (such as `human` or `adult`) for addresses. Each claim is backed by a zk-certificate that is cryptographically verified on-chain. The claims are  known to be true, under certain assumptions, without revealing anything about the address owner.

It's called "Smartly Dressed Addresses" since it kind of dresses addresses with zk-claims, making the address more attractive to work with.

SmaDra is not a ready-for-production complete system, but rather a PoC showing how to build such a component for other systems.

## Build
Smadra is built with [Foundry](https://github.com/foundry-rs/foundry).

To build it run
```
forge compile
```

## Test
There are no tests yet for Smadra, but there is a deployment script that tests the basic functionality. The script uses an example ZK verifier contract which was built by the Noir program located [noir/verify_certificates_for_address](https://github.com/HastilyConceivedCreatures/smadra/tree/main/noir/verify_certificates_for_address). 

To run the script you first need to launch [anvil](https://book.getfoundry.sh/reference/anvil/). Then do:
```
forge script script/onchainClaimSystem.s.sol:VerifyClaimScript --fork-url http://localhost:8545 --broadcast
```
