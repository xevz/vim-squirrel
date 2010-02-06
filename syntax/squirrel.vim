" Squirrel syntax file

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Keywords
syn keyword squirrelKeywords break case catch clone continue default delegate delete else for foreach if in local null resume return switch this throw try typeof while parent yield constructor vargc vargv intanceof
syn keyword squirrelBuiltins array seterrorhandler setdebughook enabledebuginfo getroottable assert print compilestring collectgarbage type getstackinfos newthread
syn keyword squirrelIO dofile fopen loadfile stderr stdin stdout
syn keyword squirrelBlob blob castf2i casti2f swap2 swap4 swapfloat
syn keyword squirrelMath abs acos asin atan atan2 ceil cos exp fabs floor log log10 pow rand sin sqrt srand tan PI RAND_MAX
syn keyword squirrelSystem clock date getenv remove rename system time
syn keyword squirrelString format regexp
syn keyword squirrelStructure class extends
syn keyword squirrelBooleans true false

" Function keyword
syn keyword squirrelFCkeyword function

" Strings
syn region squirrelString start=+"+ skip=+\\"+ end=+"+ oneline contains=squirrelEscape
syn region squirrelString start=+@"+ skip=+\\"+ end=+"+ oneline
syn region squirrelString start=+@" + skip=+\\"+ end=+ "+ contains=squirrelEscape

" Comments
syn region squirrelComment start="/\*" end="\*/"
syn match squirrelComment "//.\{-}\(?>\|$\)\@="

" Numbers
syn match squirrelNumber "-\=\<\d\+\>"
syn match squirrelNumber "\<0x\x\{1,8}\>"
syn match squirrelNumber "'.\{1}'"
syn match squirrelFloat  "\(-\=\<\d+\|-\=\)\.\(e\|E\)\{,1}-\{,1}\d\+\>"

" Escape characters
syn match squirrelEscape +\\[abfnrtv'"\\]+ contained
syn match squirrelEscape "\\\o\{1,3}" contained
syn match squirrelEscape "\\x\x\{2}" contained
syn match squirrelEscape "\(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match squirrelEscape "\\$"  

" Operators
syn match squirrelOperators "[-=+%^&|*!~?:]"
syn match squirrelOperators "[-+*/%^&|]="
syn match squirrelOperators "/[^*/]"me=e-1
syn match squirrelOperators "\$"
syn match squirrelOperators "&&\|||"
syn match squirrelRelations "[!=<>]="
syn match squirrelRelations "[<>]"

" Blocks
syn match squirrelParent "[({[\]})]"

syn match squirrelFunction "[a-zA-Z_]+[a-zA-Z0-9_]*" contained

if version >= 508
	command -nargs=+ HiLink hi link <args>
else
	command -nargs=+ HiLink hi def link <args>
endif

HiLink squirrelKeywords Keyword
HiLink squirrelBuiltins Function
HiLink squirrelIO Function
HiLink squirrelBlob Function
HiLink squirrelMath Function
HiLink squirrelSystem Keyword
HiLink squirrelString Keyword
HiLink squirrelStructure Structure
HiLink squirrelBooleans Boolean
HiLink squirrelFCkeyword Define
HiLink squirrelFunction Function
HiLink squirrelString String
HiLink squirrelComment Comment
HiLink squirrelNumber Number
HiLink squirrelFloat Float
HiLink squirrelEscape Special
HiLink squirrelOperators Operator
HiLink squirrelRelations Operator
HiLink squirrelParent Delimiter

delcommand HiLink

let b:current_syntax = "squirrel"

