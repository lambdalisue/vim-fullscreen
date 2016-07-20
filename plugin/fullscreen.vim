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

command! FullscreenStart  call fullscreen#start()
command! FullscreenStop   call fullscreen#stop()
command! FullscreenToggle call fullscreen#toggle()

nnoremap <silent> <Plug>(fullscreen-start)  :<C-u>call fullscreen#start()<CR>
nnoremap <silent> <Plug>(fullscreen-stop)   :<C-u>call fullscreen#stop()<CR>
nnoremap <silent> <Plug>(fullscreen-toggle) :<C-u>call fullscreen#toggle()<CR>

if get(g:, 'fullscreen#enable_default_keymap', 1) == 1
  nmap <silent> <C-CR> <Plug>(fullscreen-toggle)
endif

let &cpo = s:save_cpo
unlet! s:save_cpo
"vim: foldlevel=0 sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
