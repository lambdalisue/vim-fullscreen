"==============================================================================
" fullscreen emulator
"
" Emulate fullscreen mode without wmctrl.
"
" Ref:      https://github.com/lambdalisue/vim-fullscreen/issues/3
" Author:   Alsiue <lambdalisue@hashnote.net>
" License:  MIT license
"==============================================================================
let s:save_cpo = &cpo
set cpo&vim

"==============================================================================
" Functions

function! fullscreen#emulator#start()
  if g:fullscreen#emulator#auto_config_guioptions == 1
    let s:go_temp = &guioptions
    set guioptions+=C
    set guioptions-=m
    set guioptions-=T
  endif
  if has('win32') || has('win64')
    " maximize the window size (Alt Space x)
    simalt ~x
  endif

  " store the current lines and columns
  let [s:lines_save, s:columns_save] = [&lines, &columns]

  " emulate the fullscreen 
  " Note:
  "   This strategy does not work correctly on dual monitor.
  "   However, this is a just emulator thus I think in that case users
  "   should user wmctrl or so on.
  set columns=999
  set lines=999
endfunction

function! fullscreen#emulator#stop()
  if g:fullscreen#emulator#auto_config_guioptions == 1
    set guioptions-=C
    if exists('s:go_temp')
      if s:go_temp =~# 'm'
        set guioptions+=m
      endif
      if s:go_temp =~# 'T'
        set guioptions+=T
      endif
    endif
  endif
  if has('win32') || has('win64')
    " revert the window size (Alt Space r)
    simalt ~r
  endif
  " restore the lines and columns
  let [&lines, &columns] = [s:lines_save, s:columns_save]
endfunction


"==============================================================================
" Configuration

let s:settings = {
      \   'auto_config_guioptions': 1,
      \ }

"==============================================================================
" Initialization
"
function! s:init()
  for [key, val] in items(s:settings)
    if !exists('g:fullscreen#emulator#' . key)
      exe 'let g:fullscreen#emulator#' . key . ' = ' . val
    endif
  endfor
endfunction

call s:init()

let &cpo = s:save_cpo
unlet! s:save_cpo
"vim: foldlevel=0 sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
