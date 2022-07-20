call plug#begin('~/.vim/plugged')
"Plug 'tidalcycles/vim-tidal'
"Plug 'luisjure/csound-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'cespare/vim-toml'
"Plug 'simonhicks/foxdot.vim'
Plug 'errorport/errordot.vim'
call plug#end()

" line number
:set number
:set numberwidth=3

" text wrapping
:set wrap
" shift round
:set sr

" soft tab
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set noexpandtab

:colorscheme ron

" search highlight
:set hlsearch
:hi Search		cterm=NONE ctermfg=black ctermbg=green
:hi CursorLine	cterm=NONE ctermfg=black ctermbg=yellow
:hi CursorColumn	cterm=NONE ctermfg=black ctermbg=darkblue
:hi CursorLineNR	cterm=NONE ctermfg=yellow ctermbg=magenta
:hi ModeHl ctermbg=black ctermfg=yellow cterm=NONE
:hi FileHl ctermbg=black ctermfg=darkgrey cterm=NONE
:set cursorline

" ruler highlight
:set colorcolumn=120
:highlight ColorColumn ctermbg=yellow ctermfg=black

" brackets
:hi MatchParen	cterm=bold ctermfg=yellow ctermbg=magenta
:set shm=a

" highlight unwanted whitespaces
:hi ExtraWhitespace ctermbg=darkblue guibg=darkblue
:match ExtraWhiteSpace /\s\+ \|\s\+$/
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

:set listchars=eol:•,tab:·\ ,trail:\ ,extends:>,precedes:<
:hi eol ctermbg=black ctermfg=darkgray
:hi SpecialKey ctermbg=black ctermfg=darkgray
:hi NonText ctermbg=black ctermfg=darkgray

function GetMode ()
    if mode() == 'n'
        :hi StatusLine ctermbg=black ctermfg=darkgrey
        :hi ModeHl ctermbg=black ctermfg=magenta
        :hi LineNr ctermfg=yellow
        return " · "
    endif
    if mode() == 'i'
        :hi StatusLine ctermbg=green ctermfg=black
        :hi LineNr ctermfg=green
        :hi ModeHl ctermbg=green ctermfg=black
        return "INS"
    endif
    if mode() == 'R'
        :hi StatusLine ctermbg=red ctermfg=black
        :hi LineNr ctermfg=red
        :hi ModeHl ctermbg=red ctermfg=black
        return "RPL"
    endif
    if mode() == 'v'
        :hi StatusLine ctermbg=blue ctermfg=black
        :hi LineNr ctermfg=blue
        :hi ModeHl ctermbg=blue ctermfg=black
        return "VIS"
    endif
    if mode() == 'V'
        :hi StatusLine ctermbg=blue ctermfg=black
        :hi LineNr ctermfg=blue
        :hi ModeHl ctermbg=blue ctermfg=black
        return "VIS"
    endif
    if mode() == '^V'
        :hi StatusLine ctermbg=blue ctermfg=black
        :hi LineNr ctermfg=blue
        :hi ModeHl ctermbg=blue ctermfg=black
        return "BLV"
    endif
    if mode() == 'c'
        :hi StatusLine ctermfg=darkgrey ctermbg=black
        :hi ModeHl ctermbg=black ctermfg=darkgrey
        return "CON"
    endif

    return mode()
endfunction

:hi StatusLine ctermbg=black ctermfg=darkgray cterm=NONE
:hi ModeHl ctermbg=black ctermfg=yellow cterm=NONE
:set laststatus=2
:set statusline=%#ModeHl#\ %{GetMode()}\ %*%#FileHl#\ %t\ %y\ %M\ %*%=\│\ \ %4l:%4c\ \│\ %P\ 
:set noshowmode

au BufEnter,BufWinEnter,BufNewFile,BufRead *.sc,*.scd set filetype=supercollider
au Filetype supercollider packadd scvim

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

let g:sclang_executable_path = "/usr/bin/sclang"
let g:python_executable_path = "/usr/bin/python3"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
	set pastetoggle=<Esc>[201~
	set paste
	return ""
endfunction

:set pastetoggle=<F12>

:set list
