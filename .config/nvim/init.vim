call plug#begin('~/local/share/nvim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'davidhalter/jedi-vim'
Plug 'lervag/vimtex'
Plug 'matze/vim-tex-fold'
Plug 'terryma/vim-multiple-cursors'
Plug 'nathanaelkane/vim-indent-guides'

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

" Remaps
vnoremap Y "+Y
noremap ;j :tabprev<CR>
noremap ;k :tabnext<CR>
inoremap ;" ""<left>
inoremap ;' ''<left>
inoremap ;( ()<left>
inoremap ;[ []<left>
inoremap ;{ {}<left>
inoremap ;{<CR> {<CR>}<ESC>O
inoremap ;{;<CR> {<CR>};<ESC>O
inoremap -- <Esc>/<++><Enter>"_c4l
inoremap ;m <++>

" Macros

autocmd VimLeave * !sed -i 's/[ \t]*$//' %

" Não tá funcionando :((

augroup py
    autocmd!
    autocmd Filetype py map == :!python %<CR>
augroup end

" Latex stuff

augroup latex
    autocmd!
    autocmd VimEnter *.tex set spell spelllang=pt_br
    autocmd VimEnter *.tex set spellfile=$HOME/.config/nvim/spell/pt.utf-8.add
    autocmd Filetype tex map CM :! pdflatex %<CR>
    autocmd Filetype tex map BB :! bibtex $(echo % \| sed "s/.tex$//g") <CR>
    autocmd Filetype tex map S :! zathura $(echo % \| sed "s/tex$/pdf/g") & disown<CR>
    autocmd Filetype tex inoremap $ $$<left>
    autocmd Filetype tex inoremap ;env \begin{-<Esc>o<++><CR><BS>\end{-<Esc>vh
    autocmd Filetype tex inoremap ;doc \begin{document}<CR><++><CR>\end{document}
    autocmd Filetype tex inoremap ;fig \begin{figure}<CR>\centering<CR>\includegraphics{<++>}<CR>\caption{<++>}<CR>\label{fig:<++>}<CR><BS>\end{figure}
    autocmd Filetype tex inoremap ;p \usepackage{}<left>
    autocmd Filetype tex inoremap ;eq \begin{equation}\label{<++>}<CR><++><CR>\end{equation}
    autocmd Filetype tex inoremap ;frac \frac{<++>}{<++>}
    autocmd Filetype tex inoremap ] \
    autocmd Filetype tex inoremap ;s \section{}<left>
    autocmd Filetype tex inoremap ;ss \subsection{}<left>
    autocmd Filetype tex inoremap ;sss \subsubsection{}<left>
    autocmd Filetype tex inoremap ;i \emph{}<left>
    autocmd Filetype tex inoremap ;b \textbf{}<left>
    autocmd Filetype tex inoremap ;r \ref{}<left>
    autocmd Filetype tex inoremap ;c \cite{}<left>
    autocmd Filetype tex vnoremap ;vr \color{red}<Esc>}kA\color{black}

    " Above is a hacky way to delay personalized keymapping
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
let g:vimtex_compiler_progname = 'pdflatex'
let g:vimtex_view_method = 'zathura'

set t_Co=256
