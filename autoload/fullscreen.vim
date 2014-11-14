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
  call system(g:fullscreen#wmctrl_exec . " -ir " . v:windowid .
        \ " -b " . a:mod . ",fullscreen")
endfunction

function! fullscreen#start()
  if g:fullscreen#start_callback_pre != 0
    eval(g:fullscreen#start_callback_pre)
  endif
  let g:fullscreen#status = 1
  if has('gui_macvim')
    set fullscreen
  elseif executable(g:fullscreen#wmctrl_exec)
    call s:wmctrl('add')
  else
    call fullscreen#emulator#start()
  endif
  if g:fullscreen#start_callback_post != 0
    eval(g:fullscreen#start_callback_post)
  endif
endfunction

function! fullscreen#stop()
  if g:fullscreen#stop_callback_pre != 0
    eval(g:fullscreen#stop_callback_pre)
  endif
  let g:fullscreen#status = 0
  if has('gui_macvim')
    set nofullscreen
  elseif executable(g:fullscreen#wmctrl_exec)
    call s:wmctrl('remove')
  else
    call fullscreen#emulator#stop()
  endif
  if g:fullscreen#stop_callback_post != 0
    eval(g:fullscreen#stop_callback_post)
  endif
endfunction

function! fullscreen#toggle()
  if g:fullscreen#toggle_callback_pre != 0
    eval(g:fullscreen#toggle_callback_pre)
  endif
  let g:fullscreen#status = get(g:, 'fullscreen#status', 0)
  if g:fullscreen#status == 0
    call fullscreen#start()
  else
    call fullscreen#stop()
  endif
  if g:fullscreen#toggle_callback_post != 0
    eval(g:fullscreen#toggle_callback_post)
  endif
endfunction

"==============================================================================
" Configuration

let s:settings = {
      \   'wmctrl_exec': '"wmctrl"',
      \   'auto_config_fuoptions': 1,
      \   'start_callback_pre': 0,
      \   'start_callback_post': 0,
      \   'stop_callback_pre': 0,
      \   'stop_callback_post': 0,
      \   'toggle_callback_pre': 0,
      \   'toggle_callback_post': 0,
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
  if g:fullscreen#auto_config_fuoptions == 1 && has('gui_macvim')
    set fuoptions=maxvert,maxhorz
  endif
endfunction

call s:init()

let &cpo = s:save_cpo
unlet! s:save_cpo
"vim: foldlevel=0 sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
