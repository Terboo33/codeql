// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.decl.Decl
import codeql.swift.elements.Element

module Generated {
  class IterableDeclContext extends Synth::TIterableDeclContext, Element {
    Decl getImmediateMember(int index) {
      result =
        Synth::convertDeclFromRaw(Synth::convertIterableDeclContextToRaw(this)
              .(Raw::IterableDeclContext)
              .getMember(index))
    }

    final Decl getMember(int index) { result = getImmediateMember(index).resolve() }

    final Decl getAMember() { result = getMember(_) }

    final int getNumberOfMembers() { result = count(getAMember()) }
  }
}
