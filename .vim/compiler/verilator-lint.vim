" Vim compiler file
" Compiler: Compile with verilator

let current_compiler = "verilator-lint"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=verilator\ --lint-only\ \$*\ >/tmp/make.txt

" Trace back error
CompilerSet efm=
