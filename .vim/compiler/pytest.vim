" Vim compiler file
" Compiler: Compile python test file with pytest

let current_compiler = "pytest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pytest\ -Wi:DeprecationWarning\ %

" ERROR file
CompilerSet efm=
    \%EERROR\ %f,

" pytest assertion error
CompilerSet efm+=
    \%EE%m,
    \%C%\\s%#,
    \%Z%f:%l:%.%#,
