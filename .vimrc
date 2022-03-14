call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'
call plug#end()

autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

syntax on
let g:lightline={'colorscheme':'one'}
colorscheme one
set background=dark
hi Normal guibg=NONE ctermbg=NONE
set number
set title
set laststatus=2
set noshowmode

set mouse=a

set autoindent
set expandtab
set shiftround
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

