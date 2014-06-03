vim-fullscreen
==================
*vim-fullscreen* is a plugin which help users to toggle a fullscreen mode on
GVim or MacVim.

Install
----------
With neobundle.vim, use the following settings

```vim
NeoBundleLazy 'lambdalisue/vim-fullscreen', {
        \ 'autoload': {
        \   'commands': [
        \     'FullscreenStart',
        \     'FullscreenStop',
        \     'FullscreenToggle',
        \   ],
        \   'mappgins': '<Plug>(fullscreen-',
        \   'build': {
        \     'unix': 'sudo apt-get install wmctrl',    " Ubuntu/Debian
        \   }}
```

Usage
----------
Hit <A-CR> (Alt + Return) to toggle a fullscreen mode.
You can disable this default keymap with
|g:fullscreen#enable_default_keymaps|.

Documents
----------
See `:help vim-fullscreen`
