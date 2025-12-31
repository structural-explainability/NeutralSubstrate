import NeutralSubstrate.Core
import NeutralSubstrate.Spec

/-!
Neutral Substrate (NS) conformance: identifier-to-theorem trace surface.
-/

namespace StructuralExplainability.NeutralSubstrate.Conformance

open StructuralExplainability
open StructuralExplainability.NeutralSubstrate.Spec

structure ConformanceEvidence where
  neutrality_no_causal_or_normative :
    ∀ S : Ontology, Req_NS_NEUTRALITY_NO_CAUSAL_OR_NORMATIVE S ↔ Neutral S

  extension_stability_is_neutrality :
    ∀ S : Ontology, Req_NS_NEUTRALITY_EXTENSION_STABILITY S ↔ Neutral S

end StructuralExplainability.NeutralSubstrate.Conformance
