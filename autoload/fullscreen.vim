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
  call system(g:fullscreen#wmctrl_exec . "wmctrl -ir " . v:windowid .
        \ " -b " . a:mod . ",fullscreen")
endfunction

function! fullscreen#start()
  let g:fullscreen#status = 1
  if has('gui_macvim')
    set fullscreen
  elseif executable(g:fullscreen#wmctrl_exec)
    call s:wmctrl('add')
  elseif g:fullscreen#enable_emulator
    call fullscreen#emulator#start()
  else
    echoerr "'wmctrl' is required to enable fullscreen feature. "
    echoerr "Install 'wmctrl' or enable an emulator with:"
    echoerr "    let g:fullscreen#enable_emulator = 1"
  endif
  if g:fullscreen#start_callback != 0
    eval(g:fullscreen#start_callback)
  endif
endfunction

function! fullscreen#stop()
  let g:fullscreen#status = 0
  if has('gui_macvim')
    set nofullscreen
  elseif executable(g:fullscreen#wmctrl_exec)
    call s:wmctrl('remove')
  elseif g:fullscreen#enable_emulator
    call fullscreen#emulator#stop()
  else
    echoerr "'wmctrl' is required to enable fullscreen feature. "
    echoerr "Install 'wmctrl' or enable an emulator with:"
    echoerr "    let g:fullscreen#enable_emulator = 1"
  endif
  if g:fullscreen#stop_callback != 0
    eval(g:fullscreen#stop_callback)
  endif
endfunction

function! fullscreen#toggle()
  let g:fullscreen#status = get(g:, 'fullscreen#status', 0)
  if g:fullscreen#status == 0
    call fullscreen#start()
  else
    call fullscreen#stop()
  endif
  if g:fullscreen#toggle_callback != 0
    eval(g:fullscreen#toggle_callback)
  endif
endfunction

"==============================================================================
" Configuration

let s:settings = {
      \   'wmctrl_exec': '"wmctrl"',
      \   'enable_emulator': 1,
      \   'start_callback': 0,
      \   'stop_callback': 0,
      \   'toggle_callback': 0,
      \ }

"==============================================================================
" Initialization
"
function! s:init()
  for [key, val] in items(s:settings)
    if !exists('g:fullscreen#' . key)
      exe 'let g:fullscreen#' . key . ' = ' . val
    endif
  endfor
endfunction

call s:init()

let &cpo = s:save_cpo
unlet! s:save_cpo
"vim: foldlevel=0 sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
