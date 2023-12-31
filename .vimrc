let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'

call plug#end()

syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set termguicolors
set splitbelow
set wrap
set hlsearch
set ignorecase
set showmatch
set encoding=utf-8
set nobackup
set nowritebackup
set noshowmode
set updatetime=300
set signcolumn=yes
colorscheme monokai
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

let g:lightline = {
  \ 'colorscheme': 'molokai',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'filetype' ] ],
  \   'right': [ [ 'lineinfo', 'modified' ] ]
  \ },
  \ 'inactive': {
  \   'left': [ [ 'mode' ] ],
  \   'right': [ [ 'lineinfo' ] ]
  \ },
  \ }

let g:NERDTreeWinSize = 25

let g:mapleader = " "
nnoremap <leader>t :term<CR>
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nnoremap <C-f>m :NERDTreeToggle<CR>                 
nnoremap <C-o> :w!<CR>
nnoremap <C-x> :q!<CR>
