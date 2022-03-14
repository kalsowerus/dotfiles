call plug#begin()
Plug 'doums/darcula'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

syntax on
colorscheme darcula
set background=dark
hi Normal guibg=NONE ctermbg=NONE
set number
set title

set mouse=a

set autoindent
set expandtab
set shiftround
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

