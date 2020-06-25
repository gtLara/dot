call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'
Plug 'terryma/vim-multiple-cursors'

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

map CM :! pdflatex %<CR>
map S :! zathura $(echo % \| sed "s/tex$/pdf/g") & disown<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap -- <Esc>/<++><Enter>"_c4l
inoremap ;m <++>

" Latex snippets

augroup latex
    autocmd!
    autocmd VimEnter *.tex set spell spelllang=pt_br
    autocmd Filetype tex inoremap $ $$<left>
    autocmd Filetype tex inoremap ;env \begin{-<Esc>o<++><CR><BS>\end{-<Esc>vh
    autocmd Filetype tex inoremap ;doc \begin{document}<CR><++><CR>\end{document}
    autocmd Filetype tex inoremap ;fig \begin{figure}<CR>\centering<CR>\includegraphics{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR><BS>\end{figure}
    autocmd Filetype tex inoremap ;p \usepackage{}<left>
augroup end

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:jedi#completions_command = "<C-Space>"
let g:jedi#popup_on_dot = 0
let python_highlight_all=1
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

set t_Co=256
