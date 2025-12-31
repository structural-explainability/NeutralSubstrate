import NeutralSubstrate.Core

/-!
Neutral Substrate (NS) spec surface: identifiers and requirement shapes.
-/

namespace StructuralExplainability.NeutralSubstrate.Spec


def NS_NEUTRALITY_NO_CAUSAL_OR_NORMATIVE : String :=
  "NS.NEUTRALITY.NO_CAUSAL_OR_NORMATIVE"

def NS_NEUTRALITY_EXTENSION_STABILITY : String :=
  "NS.NEUTRALITY.EXTENSION_STABILITY"

/-- REQ: NS.NEUTRALITY.NO_CAUSAL_OR_NORMATIVE -/
def Req_NS_NEUTRALITY_NO_CAUSAL_OR_NORMATIVE (S : StructuralExplainability.Ontology) : Prop :=
  StructuralExplainability.containsCausalOrNormative S = false

/-- REQ: NS.NEUTRALITY.EXTENSION_STABILITY -/
def Req_NS_NEUTRALITY_EXTENSION_STABILITY (S : StructuralExplainability.Ontology) : Prop :=
  StructuralExplainability.ExtensionStable S

end StructuralExplainability.NeutralSubstrate.Spec
