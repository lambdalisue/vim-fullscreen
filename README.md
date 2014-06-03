vim-fullscreen
==================
*vim-fullscreen* is a plugin which help users to toggle a fullscreen mode on
GVim or MacVim.

Install
----------
I recommend you to use some vim plugin manager such as neobundle.vim.
With [neobundle.vim](https://github.com/Shougo/neobundle.vim), it is quite
simple

```vim
NeoBundle 'lambdalisue/vim-fullscreen'
```

Or if you prefer neobundle's 'lazy loading' then

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

nmap <C-CR> <Plug>(fullscreen-toggle)
```

Usage
----------
Hit <C-CR> (Ctrl + Return) to toggle a fullscreen mode.
Or execute `:FullscreenToggle` command.

Documents
----------
See `:help vim-fullscreen`
