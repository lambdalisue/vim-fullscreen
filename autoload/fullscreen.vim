"==============================================================================
" vim-fullscreen
"
" Use GVim/MacVim in fullscreen mode
"
" Author:   Alsiue <lambdalisue@hashnote.net>
" License:  MIT license
"==============================================================================
let s:save_cpo = &cpo
set cpo&vim

function! s:wmctrl(mod)
  if !executable('wmctrl')
    echoerr "'wmctrl' is required to enable fullscreen feature. "
    echoerr "Install 'wmctrl' and try again."
  else
    call system("wmctrl -ir " . v:windowid . " -b " . a:mod . ",fullscreen")
  endif
endfunction

function! fullscreen#start()
  let g:fullscreen#status = 1
  if has('gui_macvim')
    set fullscreen
  else
    call s:wmctrl('add')
  endif
endfunction

function! fullscreen#stop()
  let g:fullscreen#status = 0
  if has('gui_macvim')
    set nofullscreen
  else
    call s:wmctrl('remove')
  endif
endfunction

function! fullscreen#toggle()
  let g:fullscreen#status = get(g:, 'fullscreen#status', 0)
  if g:fullscreen#status == 0
    call fullscreen#start()
  else
    call fullscreen#stop()
  endif
endfunction

let &cpo = s:save_cpo
unlet! s:save_cpo
"vim: foldlevel=0 sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
