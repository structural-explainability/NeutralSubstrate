# Mapping: Paper to Lean Formalization

This document maps definitions and theorems from the paper to their Lean formalization.

**Paper**: "The Ontological Neutrality Theorem:
Why Neutral Ontological Substrates Must Be Pre-Causal and Pre-Normative" (Case, 2025)

**Formalization**:

- `NeutralSubstrate/NeutralSubstrate/*.lean`


## Domain Scope

This formalization applies to ontological substrates optimized for:

- **Stability under disagreement**: The substrate must remain unchanged when extended by incompatible interpretive frameworks
- **Persistent interpretive pluralism**: Legal, political, and analytic disagreement is treated as durable, not resolvable
- **Accountability across jurisdictions**: Entities must remain referable across frameworks that disagree about causation, obligation, or evaluation

The results do **not** apply to substrates optimized for:

- Expressiveness or modeling convenience within a single interpretive community
- Negotiated semantics where stakeholders can agree on shared meaning
- Domains where causal or normative consensus is achievable

Readers who reject the stability-under-disagreement goal may prefer alternative approaches.
Such positions do not contradict these results; they are outside the scope of the problem addressed.

---

## Definitions

| Paper Section | Paper Term              | Lean Definition             |
| ------------- | ----------------------- | --------------------------- |
| Section 2.1   | Primitive Kind          | `inductive PrimitiveKind`   |
| Section 2.1   | Primitive               | `structure Primitive`       |
| Section 2.2   | Ontology                | `abbrev Ontology`           |
| Section 2.3   | Framework               | `structure Framework`       |
| Section 2.3   | Admissible Framework    | `def Admissible`            |
| Section 3.1   | Extension Inconsistency | `def extensionInconsistent` |
| Section 3.2   | Extension Stability     | `def ExtensionStable`       |
| Section 3.2   | Neutrality              | `def Neutral`               |

## Axioms

| Paper Claim                                                       | Lean Axiom                            |
| ----------------------------------------------------------------- | ------------------------------------- |
| Causal/normative primitives are framework-dependent (Section 4.2) | `axiom framework_relativity`          |
| Neutral primitives are undisputed (Section 4.3)                   | `axiom neutral_primitives_undisputed` |

## Theorems

| Paper Result                 | Lean Theorem                                 |
| ---------------------------- | -------------------------------------------- |
| Theorem 1 (Only If)          | `theorem not_neutral_if_causal_or_normative` |
| Theorem 2 (If)               | `theorem neutral_if_only_neutral`            |
| Main Theorem (Biconditional) | `theorem ontological_neutrality_theorem`     |

## Verification

To verify the formalization (and optionally, run it):

```bash
lake update
lake build
lake exe verify
```

All theorems compile without `sorry`, confirming the proofs are complete.

## Notes

- The formalization uses `List Primitive` for computability; the paper uses set notation (equivalent for finite collections).
- `Admissible` is defined as `True` (all consistent frameworks are admissible); a richer model could add domain-specific constraints
- Helper theorems (`any_true_implies_exists`, `any_false_implies_none`) are technical machinery not in the paper
