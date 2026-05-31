# Structural Explainability: Neutral Substrate

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
![Build Status](https://github.com/structural-explainability/NeutralSubstrate/actions/workflows/ci-lean.yml/badge.svg?branch=main)
[![Check Links](https://github.com/structural-explainability/NeutralSubstrate/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/NeutralSubstrate/actions/workflows/links.yml)

> Superseded Lean 4 formalization of neutral-substrate constraints for
> accountability-oriented systems under persistent interpretive disagreement.

## Status

This repository is superseded by the active `se-theory-*` and formal-contract repositories.

Active development has moved to:

- [`se-theory-neutral-substrate`](https://github.com/structural-explainability/se-theory-neutral-substrate)
- [`se-formal-contract`](https://github.com/structural-explainability/se-formal-contract)

This repository is retained for provenance, earlier implementation history,
and compatibility with prior references. It may receive maintenance updates for
tooling, build hygiene, metadata, or release alignment, but it is no longer the
active theory source.

## Scope

This repository provides an earlier Lean 4 formalization of structural
constraints on ontological substrates intended to remain stable across
incompatible interpretations, legal regimes, and analytic frameworks.

It does not define a concrete ontology or protocol. It establishes substrate-level
conditions that such systems must satisfy to avoid embedding interpretation,
authority, causality, or judgment into the structural core.

## Current Replacement Path

Use the active repositories for current work:

| Need | Use |
| ---- | --- |
| Active neutral-substrate theory | [`se-theory-neutral-substrate`](https://github.com/structural-explainability/se-theory-neutral-substrate) |
| Machine-readable formal contract exports | [`se-formal-contract`](https://github.com/structural-explainability/se-formal-contract) |

## Build and Run

```shell
lake update
lake build
lake exe verify
```

## Optional Markdown Lint

```shell
npx markdownlint-cli2 --fix
```

## Documentation

- [Paper to Lean Mapping](./docs/MAPPING.md)
- [Lean 4 Quick Reference](./docs/LEAN.md)

## Annotations

[ANNOTATIONS.md](./ANNOTATIONS.md)

## Citation

[CITATION.cff](./CITATION.cff)

## License

[MIT](./LICENSE)
