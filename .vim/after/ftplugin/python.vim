setlocal makeprg=pytest\ %

" ERROR file
setlocal efm=
    \%EERROR\ %f,

" pytest assertion error
setlocal efm+=
    \%EE%m,
    \%C%\\s%#,
    \%Z%f:%l:%.%#,

" Import error
setlocal efm+=
    \%E%>%f:%l:%.%#,
    \%C%[\ ]%#import%.%#,
    \%ZE%m,

" %-G will ignore everything matched after
" %.%# is actually regex: .*
" TODO it breaks import error parsing
"setlocal efm+=
"    \%-G%.%#,
