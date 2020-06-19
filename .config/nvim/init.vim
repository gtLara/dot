call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'

call plug#end()

syntax on
set nocompatible
set encoding=utf-8
set noerrorbells
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set number relativenumber
set smartindent
set nowrap
set smartcase
set noshowmode
set nobackup
set undodir=$HOME/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" map I :! pdflatex %<CR>
" map S :! zathura $(echo % \| sed "s/tex$/pdf")<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap <Space><Space> <Esc>/<++><Enter>"_c4l

" Latex snippets

autocmd Filetype tex inoremap ;

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:jedi#completions_command = "<C-Space>"
let g:jedi#popup_on_dot = 0
let g:tex_flavor = 'latex'
let python_highlight_all=1

set t_Co=256
