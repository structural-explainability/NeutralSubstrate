# Structural Explainability: Neutral Substrate

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/license/MIT)
![Build Status](https://github.com/structural-explainability/NeutralSubstrate/actions/workflows/ci-lean.yml/badge.svg?branch=main)
[![Check Links](https://github.com/structural-explainability/NeutralSubstrate/actions/workflows/links.yml/badge.svg?branch=main)](https://github.com/structural-explainability/NeutralSubstrate/actions/workflows/links.yml)

> Lean 4 formalization of foundational constraints required for ontological substrates
> intended to support accountability under persistent interpretive disagreement.

## Context

Part of the Structural Explainability framework.

## Scope

This repository formalizes structural constraints on ontological substrates that are intended to remain stable across incompatible interpretations, legal regimes, and analytic frameworks.

It does not define a concrete ontology or protocol.
It establishes conditions that any such system must satisfy at the substrate level.

## Build and Run

```bash
lake update
lake build
lake exe verify
```

## Developer (running pre-commit)

Pre-commit is optional; CI will report exact commands if it fails.

Steps to run pre-commit locally. Install `uv`.

Initialize once:

```shell
uv self update
uvx pre-commit install
uvx pre-commit run --all-files
```

Save progress as needed:

```shell
git add -A
# If pre-commit makes changes, re-run `git add -A` before committing.
git commit -m "update"
git push -u origin main
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
