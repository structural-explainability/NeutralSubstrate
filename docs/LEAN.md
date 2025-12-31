# Lean 4 Quick Reference

This document explains Lean 4 syntax and terminology used in the formalization.

---

## Tactics

Tactics are commands used inside `by` blocks to construct proofs.

| Tactic | Meaning |
|--------|---------|
| `exfalso` | "From falsehood, anything." Switch goal to proving `False`. Used when deriving a contradiction. |
| `simp` | Simplify using known lemmas and definitions. Automatic rewriting. |
| `rfl` | "Reflexivity." Proves `x = x` or definitionally equal terms. |
| `exact` | Provide the exact term that proves the goal. |
| `apply` | Apply a function/theorem to the goal, creating subgoals for its arguments. |
| `intro` | Introduce a hypothesis or variable into context. |
| `have` | Create a new intermediate fact with a local proof. |
| `cases` | Split on constructors of an inductive type. |
| `match` | Pattern match on a value. |
| `induction` | Prove by induction on a structure (e.g., list). |
| `unfold` | Expand a definition in the goal. |
| `contradiction` | Find two hypotheses that contradict each other. |
| `native_decide` | Use Lean's compiler to compute a decidable proposition. |
| `constructor` | Split a goal like `P ∧ Q` or `P ↔ Q` into subgoals. |
| `obtain` | Destruct an existential or conjunction into named parts. |
| `rw` | Rewrite using an equality hypothesis. |

---

## Symbols

| Symbol | Name | Meaning |
|--------|------|---------|
| `∀` | forall | "For all" universal quantifier |
| `∃` | exists | "There exists" existential quantifier |
| `→` | arrow | Function type or implication |
| `↔` | iff | "If and only if" biconditional |
| `¬` | not | Negation (defined as `P → False`) |
| `∧` | and | Conjunction |
| `∨` | or | Disjunction |
| `∈` | mem | Set/list membership |
| `≠` | ne | Not equal |
| `⟨x, y⟩` | anonymous constructor | Build a structure or existential witness |
| `·` | focus dot | Focus on a single goal in tactic mode |

---

## Keywords

| Keyword | Meaning |
|---------|---------|
| `axiom` | Unproven assertion accepted as true. |
| `theorem` | Proven statement (main results). |
| `lemma` | Synonym for theorem (not a keyword in Lean 4; use `theorem`). |
| `def` | Definition of a function or value. |
| `structure` | Record type with named fields. |
| `inductive` | Type defined by its constructors. |
| `abbrev` | Type alias (transparent to Lean). |
| `Prop` | The type of propositions (logical statements). |
| `Bool` | Computational boolean (`true`/`false`). |
| `Type` | The type of types. |
| `where` | Introduce fields or constructors after a declaration. |
| `deriving` | Automatically generate instances (e.g., `DecidableEq`). |

---

## Proof Terms

| Term | Meaning |
|------|---------|
| `Or.inl` | Left injection into a disjunction (`P ∨ Q` from `P`). |
| `Or.inr` | Right injection into a disjunction (`P ∨ Q` from `Q`). |
| `List.Mem.head` | Proof that head is in the list. |
| `List.Mem.tail` | Proof that element in tail is in the list. |
| `False` | The empty proposition (no proof exists). |
| `True` | The trivial proposition (always provable). |
| `And.intro` | Build a conjunction from two proofs. |
| `Iff.intro` | Build a biconditional from two implications. |

---

## Latin/Logic Terms

| Term | Origin | Meaning |
|------|--------|---------|
| `exfalso` | Latin: "ex falso quodlibet" | From falsehood, anything follows. |
| `rfl` | "reflexivity" | Something equals itself. |
| `mp` | "modus ponens" | Forward direction of iff (`P ↔ Q` gives `P → Q`). |
| `mpr` | "modus ponens reverse" | Backward direction of iff (`P ↔ Q` gives `Q → P`). |

---

## Comment Syntax

| Syntax | Name | Purpose |
|--------|------|---------|
| `-- text` | Line comment | Notes for humans; ignored by Lean. |
| `/-- text -/` | Doc comment | Attached to next definition; appears in hover/docs. |
| `/-! text -/` | Module doc | Describes file/section; not attached to anything. |

---

## Typing Symbols in VS Code

Type backslash + shortcut, then space:

| Type | Get |
|------|-----|
| `\to` | `→` |
| `\iff` | `↔` |
| `\not` | `¬` |
| `\and` | `∧` |
| `\or` | `∨` |
| `\all` | `∀` |
| `\ex` | `∃` |
| `\in` | `∈` |
| `\ne` | `≠` |
| `\<` | `⟨` |
| `\>` | `⟩` |

---

## Build Commands

| Command | Purpose |
|---------|---------|
| `lake clean` | Remove build artifacts. |
| `lake build` | Compile the project. |
| `lake exe verify` | Run verification executable. |

---

## Further Reading

- [Theorem Proving in Lean 4](https://leanprover.github.io/theorem_proving_in_lean4/)
- [Functional Programming in Lean](https://leanprover.github.io/functional_programming_in_lean/)
- [Mathlib Documentation](https://leanprover-community.github.io/mathlib4_docs/)
