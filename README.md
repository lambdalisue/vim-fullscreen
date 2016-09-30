vim-fullscreen
==================
![Version 1.2.1](https://img.shields.io/badge/version-1.2.1-yellow.svg?style=flat-square)
![Support Vim 7.4 or above](https://img.shields.io/badge/support-Vim%207.4%20or%20above-yellowgreen.svg?style=flat-square)
[![MIT License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)](LICENSE)
[![Doc](https://img.shields.io/badge/doc-%3Ah%20vim--fullscreen-orange.svg?style=flat-square)](doc/vim-fullscreen.txt) 

*vim-fullscreen* is a plugin which help users to toggle a fullscreen mode on
GVim or MacVim.

Requirements
---------------

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
vim-fullscreen works as an emulator mode which assign 999 to `columns` and `lines`.


Install
----------
Use your favorite Vim plugin manager such as [junegunn/vim-plug] or [Shougo/dein.vim] like:

```vim
" Plug.vim
Plug 'lambdalisue/vim-fullscreen'

" dein.vim
call dein#add('lambdalisue/vim-fullscreen')

" dein.vim (lazy)
call dein#add('lambdalisue/vim-fullscreen', {
      \ 'on_cmd': [
      \   'FullscreenStart',
      \   'FullscreenStop',
      \   'FullscreenToggle',
      \ ],
      \})
```

Or copy contents of the repository into your runtimepath manually.

[junegunn/vim-plug]: https://github.com/junegunn/vim-plug
[Shougo/dein.vim]: https://github.com/Shougo/dein.vim


Usage
----------
Hit `Ctrl + Return` to toggle a fullscreen mode (in default mapping).
Or execute `:FullscreenToggle` command.


Tips
----------

### With neovim-qt

vim-fullscreen can toggle [neovim-qt](https://github.com/equalsraf/neovim-qt) with the following configuration.

```vim
" In ginit.vim
let g:fullscreen#start_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 1)"
let g:fullscreen#stop_command = "call rpcnotify(0, 'Gui', 'WindowFullScreen', 0)"
```

Documents
----------
See `:help vim-fullscreen`


License
-------------------------------------------------------------------------------
The MIT License (MIT)

Copyright (c) 2014-2016 Alisue, hashnote.net

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
