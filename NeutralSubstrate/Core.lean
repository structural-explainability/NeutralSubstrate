/-!
# The Ontological Neutrality Theorem

This module formalizes the main result from Case (2025):
an ontology is neutral iff it contains no causal or normative primitives.

## Paper

"The Ontological Neutrality Theorem: Why Neutral Ontological Substrates
Must Be Pre-Causal and Pre-Normative" (Case, 2025)

## Domain Scope

This formalization applies to substrates optimized for stability under
durable interpretive disagreement. The results do not apply to substrates
optimized for expressiveness within a single interpretive community or
where semantic consensus is achievable.

## Structure

- Part 1: Primitives and Ontologies (basic definitions)
- Part 2: Frameworks and Admissibility (interpretive stances)
- Part 3: Extension and Consistency (when conflicts arise)
- Part 4: Neutrality Definition (the core property)
- Part 5: Axioms (domain assumptions Lean cannot verify)
- Part 6: Helper Lemmas (technical machinery)
- Part 7: Main Theorems (the results)
- Part 8: Verification (confirmation and examples)

## Main Result

`ontological_neutrality_theorem`:
  ∀ S : Ontology, Neutral S ↔ containsCausalOrNormative S = false
-/

namespace StructuralExplainability

-- ==========================================================================
-- PART 1: PRIMITIVES AND ONTOLOGIES
-- ==========================================================================

/-!
## Part 1: Primitives and Ontologies

A primitive is the basic unit of ontological commitment.
An ontology is a collection of primitives.
-/

/-- Primitives come in three kinds. This is a modeling choice:
    every primitive is classifiable as exactly one of these.

    - `causal`: asserts causal relations (e.g., "A caused B")
    - `normative`: asserts normative conclusions (e.g., "X was obligated")
    - `neutral`: asserts only existence/identity (e.g., "entity E exists")

    The trichotomy is exhaustive for this domain. -/
inductive PrimitiveKind where
  | causal
  | normative
  | neutral
  deriving DecidableEq, Repr

/-- A primitive has a kind and an identifier.

    - `kind`: classifies the primitive as causal, normative, or neutral
    - `id`: placeholder identifier; a richer model could have structured content

    `DecidableEq` enables computational equality checks.
    `Repr` enables printing for debugging. -/
structure Primitive where
  kind : PrimitiveKind
  id : String
  deriving DecidableEq, Repr

/-- An ontology is a list of primitives.

    `List` is used rather than `Set` for computability:
    - List: finite, ordered, enables `#eval` and `native_decide`
    - Set: potentially infinite, requires logical reasoning only

    The two are equivalent for finite collections. -/
abbrev Ontology := List Primitive

/-- Does an ontology contain any causal or normative primitive?

    Returns `true` if any primitive has `kind ≠ neutral`.
    This is the key property for analysis. -/
def containsCausalOrNormative (S : Ontology) : Bool :=
  S.any fun p => p.kind != PrimitiveKind.neutral


-- ==========================================================================
-- PART 2: FRAMEWORKS AND ADMISSIBILITY
-- ==========================================================================

/-!
## Part 2: Frameworks and Admissibility

A framework represents an interpretive stance: a legal system,
a causal model, a normative theory. Frameworks can affirm or deny
primitives. Admissible frameworks are internally consistent but
may disagree with each other.
-/

/-- A framework assigns truth values to primitives.

    - `affirms`: primitives the framework asserts as true
    - `denies`: primitives the framework asserts as false
    - `consistent`: cannot both affirm and deny the same primitive

    A framework may be silent on a primitive (neither affirms nor denies). -/
structure Framework where
  affirms : Primitive → Bool
  denies : Primitive → Bool
  consistent : ∀ p, ¬(affirms p = true ∧ denies p = true)

/-- A framework is admissible if it represents a legitimate interpretive stance.

    For this formalization, all consistent frameworks are admissible.
    A richer model might add domain-specific admissibility conditions
    (e.g., recognized legal jurisdiction, established causal methodology). -/
def Admissible (_ : Framework) : Prop := True


-- ==========================================================================
-- PART 3: EXTENSION AND CONSISTENCY
-- ==========================================================================

/-!
## Part 3: Extension and Consistency

When a framework extends a substrate, it layers interpretive commitments
atop the substrate's assertions. Inconsistency arises if the framework
denies something the substrate asserts.
-/

/-- Extension is inconsistent when the framework denies a primitive
    that the substrate contains.

    This models the conflict that arises when an interpretive framework
    contradicts the substrate's commitments. -/
def extensionInconsistent (S : Ontology) (F : Framework) : Prop :=
  ∃ p, p ∈ S ∧ F.denies p = true


-- ==========================================================================
-- PART 4: NEUTRALITY DEFINITION
-- ==========================================================================

/-!
## Part 4: Neutrality Definition

Neutrality means the substrate remains consistent when extended by
ANY admissible framework. This is the paper's core definition.
A neutral substrate can serve as common ground across disagreeing
interpretive communities.
-/

/-- Extension Stability: no admissible framework causes inconsistency.

    For all admissible frameworks F, extending S with F produces no contradiction.
    This captures the requirement that the substrate survives disagreement. -/
def ExtensionStable (S : Ontology) : Prop :=
  ∀ F : Framework, Admissible F → ¬extensionInconsistent S F

/-- Neutrality is extension stability.

    An ontology is neutral iff it can be extended by any admissible
    framework without revision or contradiction.

    (The paper also includes INC; this simplified model focuses on EXT.) -/
def Neutral (S : Ontology) : Prop := ExtensionStable S


-- ==========================================================================
-- PART 5: AXIOMS (DOMAIN ASSUMPTIONS)
-- ==========================================================================

/-!
## Part 5: Axioms (Domain Assumptions)

These are empirical claims that Lean cannot verify. They encode the
domain-specific facts that make the theorem applicable.

**Requirements:**
- These axioms must hold in the modeled domain for the theorem to apply.
- These axioms are necessary to bound the theorem; removing either invalidates it.
- Axiom validity is a domain question, not a logical question.
-/

/-- **AXIOM 1: Framework Relativity**

    Causal and normative primitives are framework-dependent.
    For any non-neutral primitive, there exists an admissible framework that denies it.

    This encodes the paper's claim that causal and normative conclusions
    are inherently contested across interpretive frameworks. Examples:
    - "A caused B" may be denied by frameworks using different causal models
    - "X was obligated" may be denied by frameworks in different jurisdictions

    The theorem's applicability depends on this axiom being true in the domain.
    In domains where causal/normative consensus exists, this axiom fails
    and the theorem does not apply. -/
axiom framework_relativity :
  ∀ p : Primitive, p.kind ≠ PrimitiveKind.neutral →
  ∃ F : Framework, Admissible F ∧ F.denies p = true

/-- **AXIOM 2: Neutral Primitives Undisputed**

    Neutral primitives are not denied by any admissible framework.
    Pure existence/identity claims are framework-invariant.

    This encodes the dual claim: while frameworks disagree about causation
    and obligation, they do not disagree about whether entities exist
    (given fixed identity criteria).

    The theorem's applicability depends on this axiom being true in the domain.
    In domains where identity itself is contested, this axiom fails
    and the theorem does not apply. The paper notes this scope limitation. -/
axiom neutral_primitives_undisputed :
  ∀ p : Primitive, p.kind = PrimitiveKind.neutral →
  ∀ F : Framework, Admissible F → F.denies p = false


-- ==========================================================================
-- PART 6: HELPER LEMMAS
-- ==========================================================================

/-!
## Part 6: Helper Lemmas

Technical machinery to work with `List.any`. These lemmas connect
boolean computation to logical propositions. They are not part of
the paper's argument but are needed for the formalization.
-/

/-- If `List.any` returns true, there exists a witness satisfying the predicate.

    **Proof:** By induction on the list structure.
    - nil case: contradiction (empty list cannot satisfy any)
    - cons case: either head satisfies, or witness exists in tail -/
theorem any_true_implies_exists {α : Type} (l : List α) (pred : α → Bool) :
    l.any pred = true → ∃ x, x ∈ l ∧ pred x = true := by
  intro h
  induction l with
  | nil => simp [List.any] at h
  | cons head tail ih =>
    simp only [List.any, Bool.or_eq_true] at h
    match h with
    | Or.inl h_head =>
      exact ⟨head, List.Mem.head tail, h_head⟩
    | Or.inr h_tail =>
      have ⟨x, hx_mem, hx_pred⟩ := ih h_tail
      exact ⟨x, List.Mem.tail head hx_mem, hx_pred⟩

/-- If `List.any` returns false, no element satisfies the predicate.

    **Proof:** By induction on the list structure.
    - nil case: vacuously true (no elements to check)
    - cons case: head doesn't satisfy, and tail has no satisfying element -/
theorem any_false_implies_none {α : Type} (l : List α) (pred : α → Bool) :
    l.any pred = false → ∀ x, x ∈ l → pred x = false := by
  intro h x hx
  induction l with
  | nil => cases hx
  | cons head tail ih =>
    simp only [List.any, Bool.or_eq_false_iff] at h
    cases hx with
    | head => exact h.1
    | tail _ hx_tail => exact ih h.2 hx_tail


-- ==========================================================================
-- PART 7: MAIN THEOREMS
-- ==========================================================================

/-!
## Part 7: Main Theorems

The core results establishing the biconditional. Each theorem includes
a proof strategy for readability.
-/

/-- **THEOREM 1 (Only If Direction):**
    If an ontology contains causal or normative primitives, it is not neutral.

    **Proof strategy:**
    1. Introduce S, h_contains, and h_neutral (assuming neutrality for contradiction)
    2. Use `any_true_implies_exists` to extract witness primitive p from S
    3. Match to destructure p, hp_in_S, hp_kind
    4. Prove p.kind ≠ neutral from hp_kind using simp
    5. Apply `framework_relativity` to get framework F that denies p
    6. Apply h_neutral to F to get h_no_inconsist (no inconsistency claim)
    7. Apply h_no_inconsist to show inconsistency must not exist
    8. Provide the witness ⟨p, hp_in_S, hF_denies⟩ showing inconsistency does exist
    9. Contradiction completes the proof -/
theorem not_neutral_if_causal_or_normative :
    ∀ S : Ontology, containsCausalOrNormative S = true → ¬Neutral S := by
  intro S h_contains
  intro h_neutral
  have h_exists := any_true_implies_exists S _ h_contains
  match h_exists with
  | ⟨p, hp_in_S, hp_kind⟩ =>
    have hp_not_neutral : p.kind ≠ PrimitiveKind.neutral := by
      intro h_eq
      simp [h_eq] at hp_kind
    have ⟨F, hF_adm, hF_denies⟩ := framework_relativity p hp_not_neutral
    have h_no_inconsist := h_neutral F hF_adm
    apply h_no_inconsist
    exact ⟨p, hp_in_S, hF_denies⟩

/-- **THEOREM 2 (If Direction):**
    If an ontology contains only neutral primitives, it is neutral.

    **Proof strategy:**
    1. Introduce S and hypothesis h_only_neutral
    2. Unfold Neutral and ExtensionStable to expose the goal structure
    3. Take any admissible framework F
    4. Introduce the existential ⟨p, hp_in_S, hF_denies⟩ (assuming inconsistency for contradiction)
    5. Use `any_false_implies_none` to show p must be neutral
    6. Apply `neutral_primitives_undisputed` to show F doesn't deny p
    7. Contradiction between hF_denies (true) and h_not_denied (false) -/
theorem neutral_if_only_neutral :
    ∀ S : Ontology, containsCausalOrNormative S = false → Neutral S := by
  intro S h_only_neutral
  unfold Neutral ExtensionStable extensionInconsistent
  intro F hF_adm
  intro ⟨p, hp_in_S, hF_denies⟩
  have h_all_neutral := any_false_implies_none S _ h_only_neutral
  have hp_neutral_kind : (p.kind != PrimitiveKind.neutral) = false := h_all_neutral p hp_in_S
  simp at hp_neutral_kind
  have h_not_denied := neutral_primitives_undisputed p hp_neutral_kind F hF_adm
  rw [h_not_denied] at hF_denies
  contradiction

/-- **MAIN THEOREM (Biconditional):**
    An ontology is neutral if and only if it contains no causal or normative primitives.

    This is the Ontological Neutrality Theorem from the paper.
    It establishes that neutrality and the absence of causal/normative
    primitives are equivalent, given the domain axioms.

    **Proof strategy:**
    1. Split the iff into two directions using constructor
    2. Forward (mp): Assume Neutral S, case split on containsCausalOrNormative S
       - If true: derive contradiction via `not_neutral_if_causal_or_normative`
       - If false: that's what we need to prove (rfl)
    3. Backward (mpr): Apply `neutral_if_only_neutral` directly -/
theorem ontological_neutrality_theorem :
    ∀ S : Ontology, Neutral S ↔ containsCausalOrNormative S = false := by
  intro S
  constructor
  · -- Forward: Neutral S → containsCausalOrNormative S = false
    intro h_neutral
    cases h_eq : containsCausalOrNormative S with
    | true =>
      exfalso
      exact not_neutral_if_causal_or_normative S h_eq h_neutral
    | false => rfl
  · -- Backward: containsCausalOrNormative S = false → Neutral S
    intro h_false
    exact neutral_if_only_neutral S h_false


-- ==========================================================================
-- PART 8: VERIFICATION
-- ==========================================================================

/-!
## Part 8: Verification

Confirmation that theorems have expected types and examples compile.
These statements produce no runtime effect; they verify the formalization.
-/

-- Type signatures of the main theorems
#check not_neutral_if_causal_or_normative
  -- ∀ (S : Ontology), containsCausalOrNormative S = true → ¬Neutral S
#check neutral_if_only_neutral
  -- ∀ (S : Ontology), containsCausalOrNormative S = false → Neutral S
#check ontological_neutrality_theorem
  -- ∀ (S : Ontology), Neutral S ↔ containsCausalOrNormative S = false

/-- Example: an empty ontology is neutral (contains no primitives at all). -/
example : Neutral [] := by
  apply neutral_if_only_neutral
  rfl

/-- Example: an ontology with only neutral primitives is neutral. -/
example : Neutral [⟨PrimitiveKind.neutral, "entity_A"⟩, ⟨PrimitiveKind.neutral, "entity_B"⟩] := by
  apply neutral_if_only_neutral
  native_decide

/-- Example: an ontology with a causal primitive is NOT neutral. -/
example : ¬Neutral [⟨PrimitiveKind.causal, "A_caused_B"⟩] := by
  apply not_neutral_if_causal_or_normative
  native_decide

/-- Example: an ontology with a normative primitive is NOT neutral. -/
example : ¬Neutral [⟨PrimitiveKind.normative, "X_obligated_to_Y"⟩] := by
  apply not_neutral_if_causal_or_normative
  native_decide

/-- Example: mixing neutral and causal primitives is NOT neutral. -/
example : ¬Neutral [⟨PrimitiveKind.neutral, "entity_E"⟩, ⟨PrimitiveKind.causal, "A_caused_B"⟩] := by
  apply not_neutral_if_causal_or_normative
  native_decide

end StructuralExplainability
