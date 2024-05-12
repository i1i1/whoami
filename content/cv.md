+++
title = "Ivan Rybin"
date = 2024-05-09
+++

## Senior Rust developer

Hey, I am a software engineer with five years of experience in blockchain and
backend development. My main interests in computer sciences are functional programming,
formal methods and verification. Also I am keen on low level system development
like OS/kernel development.

I have some interest in Philosophy. I have many hobbies including smart-home, sports,
3d-printing and cooking (sometimes).

Here is a list of tags relevant to me:

<!-- TODO: make propper html tags -->
`Rust` `Substrate` `Ethereum` `Blockchain` `DevOps` `CI` `CD` `Nix` `NixOS` `Python` `Linux` `C` `Emacs`


---

## Experience

### [Lumio](https://lumio.io/) @ [pontem.network](pontem.network) -- Senior Rust developer

*02/2024 - now*

At Lumio, I was working on Optimistic rollup on Ethereum which supported both Move VM and EVM.
My main responsibility is developing rollup node which is fork of [a16z's Magi][magi] rollup
node.

I was working on various deployments and CI/CD of the whole project using Nix and NixOs.
It involved hosting our [attic][attic] cache server

### [Subspace](https://subspace.network) -- Protocol Engineer

*01/2022 - 07/2023*

I was working on subspace farmer (which is like a miner, but for Proof of Storage blockchains). That involved:
- Implementation of subspace farmer protocol
- Various profiling and optimizations of implementation, database, and architecture

Also I've been working with different parts of substrate stack:
- Heavily optimized substrate telemetry (we hit the scaling limit of it, as we had up to 30k nodes on the testnet)
- Contributed to [parity db](https://github.com/paritytech/parity-db)

Also, I implemented [subspace-sdk](https://github.com/subspace/subspace-pulsar-sdk) from ground up, which wrapped
subspace substrate node and subspace farmer in rust library.

### [Soramitsu](https://soramitsu.co.jp) -- Rust developer

*02/2021 - 10/2021*

At Soramitsu, I was working on [Hyperledger Iroha 2](https://hyperledger.github.io/iroha-2-docs/) blockchain. It involved:
- Writing iroha peer
- Creating python client library
- DevOps-ing, by writing CI/CD pipelines
- Researching related blockchains and their implementations

### [Intropy](https://intropy-tech.ru) -- Middle/Senior Developer

*11/2019 - 02/2021*

I was working on project called SmartScales, which involved making food recognition in grocery stores on microcontrollers.

That involved:
* Rewriting python microservices to Rust monolith using actix-web
* Writing recognition libraries and their bindings for Rust
* Doing MlOps (optimizing and deploying models)
* CI/CD and implementing some of the observability practices

My previous work history before is available upon request.

---

### Education

*09/2018 - 03/2022* -- unfinished Bachelors in CS at [Innopolis University](https://innopolis.university/).

[magi]: https://github.com/a16z/magi
[attic]: https://github.com/zhaofengli/attic
