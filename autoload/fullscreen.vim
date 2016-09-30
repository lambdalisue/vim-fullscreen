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

function! s:wmctrl(mod) abort
  call system(printf(
        \ '%s -r :ACTIVE: -b %s,fullscreen',
        \ g:fullscreen#wmctrl_exec,
        \ a:mod
        \ ))
  redraw!
endfunction

function! fullscreen#start() abort
  if exists('g:fullscreen#start_callback_pre')
    execute g:fullscreen#start_callback_pre
  endif
  let g:fullscreen#status = 1
  if exists('g:fullscreen#start_command')
    execute g:fullscreen#start_command
  elseif has('gui_macvim')
    set fullscreen
  elseif executable(g:fullscreen#wmctrl_exec)
    call s:wmctrl('add')
  else
    call fullscreen#emulator#start()
  endif
  if exists('g:fullscreen#start_callback_post')
    execute g:fullscreen#start_callback_post
  endif
endfunction

function! fullscreen#stop() abort
  if exists('g:fullscreen#stop_callback_pre')
    execute g:fullscreen#stop_callback_pre
  endif
  let g:fullscreen#status = 0
  if exists('g:fullscreen#stop_command')
    execute g:fullscreen#stop_command
  elseif has('gui_macvim')
    set nofullscreen
  elseif executable(g:fullscreen#wmctrl_exec)
    call s:wmctrl('remove')
  else
    call fullscreen#emulator#stop()
  endif
  if exists('g:fullscreen#stop_callback_post')
    execute g:fullscreen#stop_callback_post
  endif
endfunction

function! fullscreen#toggle() abort
  if exists('g:fullscreen#toggle_callback_pre')
    execute g:fullscreen#toggle_callback_pre
  endif
  let g:fullscreen#status = get(g:, 'fullscreen#status', 0)
  if g:fullscreen#status == 0
    call fullscreen#start()
  else
    call fullscreen#stop()
  endif
  if exists('g:fullscreen#toggle_callback_post')
    execute g:fullscreen#toggle_callback_post
  endif
endfunction

"==============================================================================
" Configuration

let s:settings = {
      \   'wmctrl_exec': '"wmctrl"',
      \   'auto_config_fuoptions': 1,
      \ }

"==============================================================================
" Initialization
"
function! s:init() abort
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
