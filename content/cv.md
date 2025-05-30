+++
title = "Ivan Rybin"
date = 2024-05-09
+++

## Ivan Rybin

Hello! I’m a software engineer with a solid five-year background in blockchain and backend development.
I’m deeply interested in functional programming, formal methods, and verification, and I have a soft
spot for low-level system development like OS/kernel development.

Beyond my technical pursuits, I enjoy exploring philosophy and engaging in hobbies like smart-home
projects, sports, 3D printing, and occasionally cooking.

Here is a list of tags relevant to me:

`Rust` `Reth` `Substrate` `Ethereum` `Blockchain` `DevOps` `CI` `CD` `Nix` `NixOS` `Python` `Linux` `C` `Emacs`

______________________________________________________________________

## Experience

### [Rise Labs](https://www.riselabs.xyz/) -- Senior Rust Developer

*10/2024 - 04/2025*

At Rise, I was part of the team developing Based Gigagas Ethereum L2 with Parallel EVM and preconfirmations. I was working on various parts of
the node stack:

- Benchmarking and optimizing Rise Reth node
- Enabling eip-7702 on Reth node
- Implementing various optimizations to OP stack ([1](https://github.com/ethereum-optimism/optimism/pull/13139))
- Implementing [Golang library for Luban's preconf gateway](https://github.com/risechain/luban-api)
- Integrating preconfs with Luban into OP stack
- Integrating Celestia into Rise OP stack fork
- Various improvements into [PEVM](https://github.com/risechain/pevm)

### [Lumio](https://lumio.io/) @ [pontem.network](http://pontem.network) -- Senior Rust Developer

*02/2024 - 09/2024*

At Lumio, We initially were working on an Optimistic Rollup on Ethereum that supports both
Move VM and EVM. My main role was to develop a rollup node, which started as a fork of
[a16z's Magi][magi] rollup node.

Right now our project is to build Optimistic Rollup on Solana which supports both EBPF and Move VMs.

I also handle various deployments and CI/CD processes for the project using Nix and
NixOS, including setting up our [attic] cache server.

### [Autonomous (ex Subspace)](https://www.autonomys.xyz) -- Protocol Engineer

*01/2022 - 07/2023*

At Subspace, I was part of the team developing the Subspace farmer, a component similar
to a miner but for Proof of Storage blockchains. My work involved:

- Implementing the Subspace farmer protocol.
- Profiling and optimizing the performance of the implementation, database, and architecture.

I also worked on different parts of the Substrate stack:

- Optimizing [Substrate telemetry](https://github.com/subspace/substrate-telemetry/) to handle up to 30k nodes on the testnet.
- Contributing to [parity db](https://github.com/paritytech/parity-db).

Additionally, I developed the [subspace-sdk](https://github.com/subspace/subspace-pulsar-sdk) from the ground up, integrating the Subspace substrate node and farmer into a Rust library.

### [Soramitsu](https://soramitsu.co.jp) -- Rust Developer

*02/2021 - 10/2021*

At Soramitsu, my focus was on developing the [Hyperledger Iroha 2][iroha2] blockchain. My responsibilities included:

- Working on all the parts of the blockchain node starting from consensus and smart contract VM ending with networing
- Creating a Python client library
- Managing DevOps, including crafting CI/CD pipelines.
- Researching various blockchain technologies and their implementations.

### [Intropy](https://intropy-tech.ru) -- Middle/Senior Developer

*11/2019 - 02/2021*

I worked on the SmartScales project, aimed at automating food recognition in grocery
stores using microcontrollers. My role included:

- Transitioning Python microservices to a Rust-based monolith using actix-web.
- Developing recognition libraries and their Rust bindings.
- Handling MLOps, including model optimization and deployment.
- Implementing CI/CD and observability practices.

My earlier work history is available upon request.

______________________________________________________________________

### Education

*09/2018 - 03/2022* -- Unfinished Bachelor’s in Computer Science at [Innopolis University](https://innopolis.university/).

[attic]: https://github.com/zhaofengli/attic
[iroha2]: https://hyperledger.github.io/iroha-2-docs/
[magi]: https://github.com/a16z/magi
