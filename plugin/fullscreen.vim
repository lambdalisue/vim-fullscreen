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

command! FullscreenStart call fullscreen#start()
command! FullscreenStop call fullscreen#stop()
command! FullscreenToggle call fullscreen#toggle()

nnoremap <Plug>(fullscreen-start) :call fullscreen#start()<CR>
nnoremap <Plug>(fullscreen-stop) :call fullscreen#stop()<CR>
nnoremap <Plug>(fullscreen-toggle) :call fullscreen#toggle()<CR>

if get(g:, 'fullscreen#enable_default_keymap', 1) == 1
  nmap <silent> <A-CR> <Plug>(fullscreen-toggle)
endif

let &cpo = s:save_cpo
unlet! s:save_cpo
"vim: foldlevel=0 sts=2 sw=2 smarttab et ai textwidth=0 fdm=marker
