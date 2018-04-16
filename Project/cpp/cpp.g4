grammar cpp;

/*Basic concepts*/
translationunit
:
	'#include <iostream>' declarationseq? EOF
;


/*Expressions*/
idexpression
:
	Identifier
;

postfixexpression
:
  literal
  | idexpression
	| postfixexpression '(' (idexpression | literal) ')'
	| simpletypespecifier '(' expressionlist ')'
;

expressionlist
:
	additiveexpression
;

additiveexpression
:
  literal
  | idexpression
	| (idexpression | literal) '*' (idexpression | literal)
	| (idexpression | literal) '/' (idexpression | literal)
	| (idexpression | literal) '+' (idexpression | literal)
	| (idexpression | literal) '-' (idexpression | literal)
;

relationalexpression
:
	 idexpression '<' literal
	| idexpression '>' literal
;

assignmentexpression
:
  literal
	| idexpression
	| postfixexpression
	| additiveexpression
	| relationalexpression
;

statement
:
	simpledeclaration
	| attributespecifierseq? selectionstatement
	| attributespecifierseq? jumpstatement

;

statementseq
:
	( simpletypespecifier | selectionstatement | simpledeclaration | jumpstatement )
	| statementseq ( simpletypespecifier | selectionstatement | simpledeclaration | jumpstatement )
;

selectionstatement
:
	If '(' condition ')' statement
	| If '(' condition ')' statement Else statement
	| Switch '(' condition ')' statement
;

condition
:
	relationalexpression
	| attributespecifierseq? declspecifierseq declarator '=' initializerclause
	| attributespecifierseq? declspecifierseq declarator bracedinitlist
;

jumpstatement
:
	Break ';'
	| Continue ';'
	| Return (literal | idexpression)? ';'
	| Return additiveexpression? ';'
	| Return bracedinitlist ';'
;

declarationseq
:
	functiondefinition
	| declarationseq functiondefinition
;

simpledeclaration
:
  simpletypespecifier
	| declspecifierseq? initdeclarator initdeclarator? ';'?
	| attributespecifierseq declspecifierseq? initdeclaratorlist ';'
;

declspecifier
:
	simpletypespecifier

;

declspecifierseq
:
  simpletypespecifier
	| declspecifier attributespecifierseq?
	| declspecifier declspecifierseq
;


simpletypespecifier
:
	 Identifier
	| Char
	| Char16
	| Char32
	| Wchar
	| Bool
	| Short
	| Int
	| Long
	| Signed
	| Unsigned
	| Float
	| Double
	| Void
	| Auto
;

originalnamespacename
:
	Identifier
;

attributespecifierseq
:
	attributespecifier
	| attributespecifierseq attributespecifier
;

attributespecifier
:
	'[' '[' attributespecifier ']' ']'
;

/*Declarators*/
initdeclaratorlist
:
	initdeclarator
	| initdeclaratorlist ',' initdeclarator
;

initdeclarator
:
	simpletypespecifier? declarator initializer?
;

declarator
:
  idexpression
  | idexpression parametersandqualifiers
	| noptrdeclarator
	| ptrdeclarator
	| noptrdeclarator parametersandqualifiers
;

ptrdeclarator
:
	noptrdeclarator
	| ptroperator ptrdeclarator
;

noptrdeclarator
:
literal
  | idexpression
	| noptrdeclarator parametersandqualifiers
	| idexpression '[' idexpression? ']' attributespecifierseq?
	| '(' ptrdeclarator ')'
;

parametersandqualifiers
:
	'(' parameterdeclarationlist? ')'
;


ptroperator
:
	'*' attributespecifierseq?
	| '&' attributespecifierseq?
	| '&&' attributespecifierseq?
	|  '*' attributespecifierseq?
;

ptrabstractdeclarator
:
	noptrabstractdeclarator
	| ptroperator ptrabstractdeclarator?
;

noptrabstractdeclarator
:
	noptrabstractdeclarator parametersandqualifiers
	| parametersandqualifiers
	| '(' ptrabstractdeclarator ')'
;

noptrabstractpackdeclarator
:
	noptrabstractpackdeclarator parametersandqualifiers
	| '...'
;

parameterdeclarationclause
:
	parameterdeclarationlist? '...'?
	| parameterdeclarationlist ',' '...'
;

parameterdeclarationlist
:
	parameterdeclaration
	| parameterdeclarationlist ',' parameterdeclaration
;

parameterdeclaration
:
	attributespecifierseq? simpletypespecifier declarator
	| attributespecifierseq? declspecifierseq declarator '=' initializerclause
	| attributespecifierseq? declspecifierseq
	| attributespecifierseq? declspecifierseq '='
	initializerclause
;

functiondefinition
:
	 simpletypespecifier? declarator functionbody
;

functionbody
:
	ctorinitializer? '{' statementseq? '}'
	| '=' Default ';'
	| '=' Delete ';'
;

initializer
:
	braceorequalinitializer
;

braceorequalinitializer
:
   idexpression? '=' (additiveexpression | postfixexpression | idexpression | literal)
	| bracedinitlist
;

initializerclause
:
	assignmentexpression
	| bracedinitlist
;

initializerlist
:
	initializerclause '...'?
	| initializerlist ',' initializerclause '...'?
;

bracedinitlist
:
	'{' initializerlist ','? '}'
	| '{' '}'
;

/*Classes*/

classordecltype
:
	 Identifier
;

ctorinitializer
:
	':'
;

MultiLineMacro
:
    '#' (~[\n]*? '\\' '\r'? '\n')+ ~[\n]+ -> channel(HIDDEN)
;

Directive
:
    '#' ~[\n]* -> channel(HIDDEN)
;


Else
:
	'else'
;

Enum
:
	'enum'
;
Float
:
	'float'
;

For
:
	'for'
;

If
:
	'if'
;

Inline
:
	'inline'
;

Int
:
	'int'
;

Long
:
	'long'
;

New
:
	'new'
;


Operator
:
	'operator'
;

Return
:
	'return'
;

Short
:
	'short'
;

Signed
:
	'signed'
;


Static
:
	'static'
;

Static_assert
:
	'static_assert'
;

Static_cast
:
	'static_cast'
;

Switch
:
	'switch'
;

Unsigned
:
	'unsigned'
;

Void
:
	'void'
;

Wchar
:
	'wchar_t'
;

Plus
:
	'+'
;

Minus
:
	'-'
;

Star
:
	'*'
;

Div
:
	'/'
;

Mod
:
	'%'
;

Caret
:
	'^'
;

And
:
	'&'
;

Or
:
	'|'
;

Tilde
:
	'~'
;

Not
:
	'!'
;

Assign
:
	'='
;

Less
:
	'<'
;

Greater
:
	'>'
;

MinusAssign
:
	'-='
;

StarAssign
:
	'*='
;

DivAssign
:
	'/='
;

ModAssign
:
	'%='
;

XorAssign
:
	'^='
;

AndAssign
:
	'&='
;

OrAssign
:
	'|='
;

LeftShift
:
	'<<'
;

rightShift
:
//'>>'
	Greater Greater
;

LeftShiftAssign
:
	'<<='
;

rightShiftAssign
:
//'>>='
	Greater Greater Assign
;

Equal
:
	'=='
;

theoperator
:
	New
	| Delete
	| New '[' ']'
	| Delete '[' ']'
	| '+'
	| '-'
	| '*'
	| '/'
	| '%'
	| '^'
	| '&'
	| '|'
	| '~'
	| '!'
	| '='
	| '<'
	| '>'
	| '+='
	| '-='
	| '*='
	| '/='
	| '%='
	| '^='
	| '&='
	| '|='
	| '<<'
	| rightShift
	| rightShiftAssign
	| '<<='
	| '=='
	| '!='
	| '<='
	| '>='
	| '&&'
	| '||'
	| '++'
	| '--'
	| ','
	| '->*'
	| '->'
	| '(' ')'
	| '[' ']'
;

/*Lexer*/
fragment
Hexquad
:
	HEXADECIMALDIGIT HEXADECIMALDIGIT HEXADECIMALDIGIT HEXADECIMALDIGIT
;

fragment
Universalcharactername
:
	'\\u' Hexquad
	| '\\U' Hexquad Hexquad
;

Identifier
:
/*
	Identifiernondigit
	| Identifier Identifiernondigit
	| Identifier DIGIT
	*/
	Identifiernondigit
	(
		Identifiernondigit
		| DIGIT
	)*
;

fragment
Identifiernondigit
:
	NONDIGIT
	| Universalcharactername
	/* other implementation defined characters*/
;

fragment
NONDIGIT
:
	[a-zA-Z_]
;

fragment
DIGIT
:
	[0-9]
;

literal
:
	Integerliteral
	| Characterliteral
	| Floatingliteral
	| Stringliteral
;

Integerliteral
:
	Decimalliteral Integersuffix?
	| Octalliteral Integersuffix?
	| Hexadecimalliteral Integersuffix?
	| Binaryliteral Integersuffix?
;

Decimalliteral
:
	NONZERODIGIT
	(
		'\''? DIGIT
	)*
;

Octalliteral
:
	'0'
	(
		'\''? OCTALDIGIT
	)*
;

Hexadecimalliteral
:
	(
		'0x'
		| '0X'
	) HEXADECIMALDIGIT
	(
		'\''? HEXADECIMALDIGIT
	)*
;

Binaryliteral
:
	(
		'0b'
		| '0B'
	) BINARYDIGIT
	(
		'\''? BINARYDIGIT
	)*
;

fragment
NONZERODIGIT
:
	[1-9]
;

fragment
OCTALDIGIT
:
	[0-7]
;

fragment
HEXADECIMALDIGIT
:
	[0-9a-fA-F]
;

fragment
BINARYDIGIT
:
	[01]
;

Integersuffix
:
	Unsignedsuffix Longsuffix?
	| Unsignedsuffix Longlongsuffix?
	| Longsuffix Unsignedsuffix?
	| Longlongsuffix Unsignedsuffix?
;

fragment
Unsignedsuffix
:
	[uU]
;

fragment
Longsuffix
:
	[lL]
;

fragment
Longlongsuffix
:
	'll'
	| 'LL'
;

Characterliteral
:
	'\'' Cchar+ '\''
	| 'u' '\'' Cchar+ '\''
	| 'U' '\'' Cchar+ '\''
	| 'L' '\'' Cchar+ '\''
;

fragment
Cchar
:
	~['\\\r\n]
	| Universalcharactername
;

fragment
Hexadecimalescapesequence
:
	'\\x' HEXADECIMALDIGIT+
;

Floatingliteral
:
	Fractionalconstant Exponentpart? Floatingsuffix?
	| Digitsequence Exponentpart Floatingsuffix?
;

fragment
Fractionalconstant
:
	Digitsequence? '.' Digitsequence
	| Digitsequence '.'
;

fragment
Exponentpart
:
	'e' SIGN? Digitsequence
	| 'E' SIGN? Digitsequence
;

fragment
SIGN
:
	[+-]
;

fragment
Digitsequence
:
	DIGIT
	(
		'\''? DIGIT
	)*
;

fragment
Floatingsuffix
:
	[flFL]
;

Stringliteral
:
	Encodingprefix? '"' Schar* '"'
	| Encodingprefix? 'R' Rawstring
;

fragment
Encodingprefix
:
	'u8'
	| 'u'
	| 'U'
	| 'L'
;

fragment
Schar
:
	~["\\\r\n]
	| Universalcharactername
;

fragment
Rawstring /* '"' dcharsequence? '(' rcharsequence? ')' dcharsequence? '"' */
:
	'"' .*? '(' .*? ')' .*? '"'
;

fragment
Udsuffix
:
	Identifier
;

Whitespace
:
	[ \t]+ -> skip
;
Newline
:
	(
		'\r' '\n'?
		| '\n'
	) -> skip
;
