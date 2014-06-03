vim-fullscreen:
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
        \ 'gui': 1,
        \ 'build': {
        \   'unix': 'sudo apt-get install wmctrl'
        \ },
        \ 'autoload': {
        \   'commands': [
        \     'FullscreenStart',
        \     'FullscreenStop',
        \     'FullscreenToggle',
        \   ],
        \   'mappings': '<Plug>(fullscreen-',
        \ }}

nmap <C-CR> <Plug>(fullscreen-toggle)
```

To enable this plugin on GVim, you also need to install
[wmctrl](http://tomas.styblo.name/wmctrl/) with

```sh
$ sudo apt-get install wmctrl     # Ubuntu/Debian
$ sudo yum install wmctrl         # CentOS
```

And you might need to configure fullscreen option (`fuoptions`) on MacVim like

```vim
if has('gui_macvim')
  set fuoptions=maxvert,maxhorz
endif
```

Usage
----------
Hit <C-CR> (Ctrl + Return) to toggle a fullscreen mode.
Or execute `:FullscreenToggle` command.

Documents
----------
See `:help vim-fullscreen`
