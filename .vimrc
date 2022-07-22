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
:set expandtab

:colorscheme ron

" search highlight
:set hlsearch
:hi Search          cterm=NONE ctermfg=black ctermbg=green
:hi CursorLine      cterm=NONE ctermfg=black ctermbg=yellow
:hi CursorColumn    cterm=NONE ctermfg=black ctermbg=darkblue
:hi CursorLineNR    cterm=NONE ctermfg=yellow ctermbg=magenta
:hi ModeHl          ctermbg=black ctermfg=darkgrey cterm=NONE
:hi FileHl          ctermbg=black ctermfg=cyan cterm=bold
:set cursorline

" ruler highlight
:set colorcolumn=120
:highlight ColorColumn ctermbg=yellow ctermfg=black

" brackets
:hi MatchParen      cterm=bold ctermfg=yellow ctermbg=magenta
:set shm=a

" highlight unwanted whitespaces
:hi ExtraWhitespace ctermbg=red guibg=red
":match ExtraWhiteSpace /\s\+ \|\s\+$/
:match ExtraWhiteSpace /\s\+$/
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

:set listchars=eol:•,tab:·\ ,trail:\ ,extends:>,precedes:<
:hi eol ctermbg=black ctermfg=darkgray
:hi SpecialKey ctermbg=black ctermfg=darkgray
:hi NonText ctermbg=black ctermfg=darkgray

function GetMode ()
    if mode() == 'n'
        :hi ModeHl ctermbg=black ctermfg=magenta
        :hi LineNr ctermfg=yellow
        :hi StatusLine ctermbg=black ctermfg=darkgrey
        :redrawstatus
        return " • "
    endif
    if mode() == 'i'
        :hi LineNr ctermfg=green
        :hi ModeHl ctermbg=green ctermfg=black
        :hi StatusLine ctermbg=green ctermfg=black
        :redrawstatus
        return "INS"
    endif
    if mode() == 'R'
        :hi LineNr ctermfg=red
        :hi ModeHl ctermbg=red ctermfg=black
        :hi StatusLine ctermbg=red ctermfg=black
        :redrawstatus
        return "RPL"
    endif
    if mode() == 'v'
        :hi LineNr ctermfg=blue
        :hi ModeHl ctermbg=blue ctermfg=black
        :hi StatusLine ctermbg=blue ctermfg=black
        :redrawstatus
        return "VIS"
    endif
    if mode() == 'V'
        :hi LineNr ctermfg=blue
        :hi ModeHl ctermbg=blue ctermfg=black
        :hi StatusLine ctermbg=blue ctermfg=black
        :redrawstatus
        return "VIS"
    endif
    if mode() == '^V'
        :hi LineNr ctermfg=blue
        :hi ModeHl ctermbg=blue ctermfg=black
        :hi StatusLine ctermbg=blue ctermfg=black
        :redrawstatus
        return "BLV"
    endif
    if mode() == 'c'
        :hi LineNr ctermfg=darkgrey
        :hi ModeHl ctermbg=black ctermfg=darkgrey
        :hi StatusLine ctermfg=darkgrey ctermbg=black
        :redrawstatus
        return "CON"
    endif

    :redrawstatus
    return mode()
endfunction

:hi StatusLine ctermbg=black ctermfg=darkgray cterm=NONE
:set laststatus=2
:au InsertEnter call GetMode()
:au InsertLeave call GetMode()
:au CursorMoved call GetMode()
:set statusline=%#ModeHl#\ %{GetMode()}\ %*%#FileHl#\ %t\ %y\ %M\ %*%=\ \ %4l:%4c\ \│\ %P\ 
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

