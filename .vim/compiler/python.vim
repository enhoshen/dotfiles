" Vim compiler file
" Compiler: Simply compile with python	

let current_compiler = "python"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=python\ %\ $*

" Trace back error
" 1. match whatever starting with blanks as continual message
" 2. match error start with substring File, line;
"    notice that to match comma "\\," should be used
" 3. postive lookahead (\@=, but in erroformat %\\ for the
"    meta symbol \ should be used, resulting in %\\@=) for
"    one blank or start of string as error message
CompilerSet efm=
    \%C\ %.%#,
    \%E%[\ ]%#File\ \"%f\"\\,\ line\ %l%.%#,
    \%Z%[%^\ ]%\\@=%m
