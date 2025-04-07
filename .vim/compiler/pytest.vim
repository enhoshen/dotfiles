" Vim compiler file
" Compiler: Compile python test file with pytest

let current_compiler = "pytest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=pytest\ -Wi:DeprecationWarning\ -vv\ --tb=short\ \$*

" ERROR file
CompilerSet efm=
    \%EERROR\ %f,

" pytest assertion error
CompilerSet efm+=
    \%EE%m,
    \%C%\\s%#,
    \%Z%f:%l:%.%#,

" from https://github.com/phelipetls/dotfiles/blob/master/.config/nvim/compiler/pytest.vim
" read https://phelipetls.github.io/posts/vim-errorformat-for-pytest/
CompilerSet efm=
      \%EE\ \ \ \ \ File\ \"%f\"\\,\ line\ %l,
      \%CE\ \ \ %p^,
      \%ZE\ \ \ %[%^\ ]%\\@=%m,
" fixture error
CompilerSet efm+=
      \%Afile\ %f\\,\ line\ %l,
      \%+ZE\ %mnot\ found,
      \%CE\ %.%#,
      \%-G_%\\+\ ERROR%.%#\ _%\\+,
      \%A_%\\+\ %o\ _%\\+,
" assertion error
CompilerSet efm+=
      \%C%f:%l:\ in\ %o,
      \%ZE\ %\\{3}%m,
" import error
CompilerSet efm+=
      \%EImportError%.%#\'%f\'\.,
      \%C%.%#,
" all passed
CompilerSet efm+=
      \%+G%[=]%\\+\ %*\\d\ passed%.%#,
      \%-G%[%^E]%.%#,
      \%-G


function! FixColumnNumber()
  if b:current_compiler !=? 'pytest'
    return
  endif

  let qflist = getqflist()
  for i in qflist
    let i.col = i.col + 1
  endfor
  call setqflist(qflist)
endfunction

"function s:Debugpy()
"command -nargs=* Debug :call s:Debugpy()
"  " this immediately ends, doesn't work, refer to :help !cmd
"  " >>> Backgrounded ("&") commands must not write to stdout
"  "     or stderr, the streams are closed immediately.
"  !debugpy --wait-for-client --listen 5678 -m pytest % &
"endfunction

augroup FixPytestQuickFix
  au!
  autocmd QuickFixCmdPost <buffer> call FixColumnNumber()
augroup END
