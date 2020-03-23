call plug#begin('~/.vim/plugged')
Plug 'tidalcycles/vim-tidal'
Plug 'luisjure/csound-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

" line number
:set number
:set numberwidth=3

" text wrapping	
:set wrap
" shift round
:set sr

" soft tab
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set expandtab

:colorscheme ron

" search highlight
:set hlsearch
:hi Search      cterm=NONE ctermfg=black ctermbg=green
:hi CursorLine  cterm=NONE ctermfg=black ctermbg=yellow
:set cursorline

" ruler highlight
:set colorcolumn=100
:highlight ColorColumn ctermbg=yellow

" brackets
:hi MatchParen  cterm=bold ctermfg=black ctermbg=blue
:set shm=a

au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
au Filetype supercollider packadd scvim

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


