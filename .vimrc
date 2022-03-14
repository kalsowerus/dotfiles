call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'rakr/vim-one'
Plug 'ycm-core/YouCompleteMe'
Plug 'frazrepo/vim-rainbow'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
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
hi SignColumn guibg=NONE ctermbg=NONE
set number
set title
set laststatus=2
set noshowmode
let g:rainbow_active=1
set updatetime=100

set mouse=a

set autoindent
set expandtab
set shiftround
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

nnoremap <C-f> :Files<CR>

