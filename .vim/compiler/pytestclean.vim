" Vim compiler file
" Compiler: Compile python test file with pytest, with irrelevant
"     messages ignored

let current_compiler = "pytest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pytest\ %

" ERROR file
CompilerSet efm=
    \%EERROR\ %f,

" pytest assertion error
CompilerSet efm+=
    \%EE%m,
    \%C%\\s%#,
    \%Z%f:%l:%.%#,

CompilerSet efm+=
    \%-G%.%#,

