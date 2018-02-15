syntax keyword typescriptConstructor           contained constructor
  \ nextgroup=@typescriptCallSignature
  \ skipwhite skipempty

syntax keyword typescriptMethodAccessor        contained get set

syntax cluster memberNextGroup contains=typescriptMemberOptionality,typescriptTypeAnnotation,@typescriptCallSignature

syntax match typescriptMember /\K\k*/
  \ nextgroup=@memberNextGroup
  \ contained skipwhite

syntax cluster typescriptPropertyMemberDeclaration contains=
  \ typescriptClassStatic,
  \ typescriptAccessibilityModifier,
  \ typescriptMethodAccessor,
  \ @typescriptMembers
  " \ typescriptMemberVariableDeclaration

syntax match typescriptMemberOptionality /?\|!/ contained
  \ nextgroup=typescriptTypeAnnotation,@typescriptCallSignature
  \ skipwhite skipempty

syntax cluster typescriptMembers contains=typescriptMember,typescriptStringMember,typescriptComputedMember

syntax keyword typescriptClassStatic static
  \ nextgroup=@typescriptMembers
  \ skipwhite contained

syntax keyword typescriptAccessibilityModifier public private protected readonly contained

syntax region  typescriptStringMember   contained
  \ start=/\z(["']\)/  skip=/\\\\\|\\\z1\|\\\n/  end=/\z1/
  \ nextgroup=@memberNextGroup
  \ skipwhite skipempty

syntax region  typescriptComputedMember   contained matchgroup=typescriptProperty
  \ start=/\[/rs=s+1 end=/]/
  \ contains=@typescriptValue
  \ nextgroup=@memberNextGroup
  \ skipwhite skipempty