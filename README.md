vim-fullscreen
==================
*vim-fullscreen* is a plugin which help users to toggle a fullscreen mode on
GVim or MacVim.

Install
----------
I recommend you to use some vim plugin manager such as
[neobundle.vim](https://github.com/Shougo/neobundle.vim).
With neobundle.vim, the installation is quite simple

```vim
NeoBundle 'lambdalisue/vim-fullscreen'
```

Or if you prefer neobundle's 'lazy loading' then

```vim
NeoBundleLazy 'lambdalisue/vim-fullscreen', {
        \ 'gui': 1,
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

### MacVim requirements
vim-fullscreen is ready to use.

### X11 requirements
vim-fullscreen use 
[wmctrl](http://tomas.styblo.name/wmctrl/) to enable fullscreen.
Thus you should use the software with:

```sh
$ sudo apt-get install wmctrl     # Ubuntu/Debian
$ sudo yum install wmctrl         # CentOS
```
### Windows requirements
vim-fullscreen is ready to use but Windows user need to use vim-fullscreen's
fullscreen emulator.
The emulator is not perfect but do not complain about it or give me a pull
request :-)

Usage
----------
Hit Ctrl + Return to toggle a fullscreen mode.
Or execute `:FullscreenToggle` command.

Documents
----------
See `:help vim-fullscreen`
