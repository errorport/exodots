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

:colorscheme exo_color

" search highlight
:set hlsearch
:hi Search          cterm=NONE ctermfg=black ctermbg=green
:hi CursorLine      cterm=NONE ctermfg=black ctermbg=yellow
:hi CursorColumn    cterm=NONE ctermfg=black ctermbg=darkblue
:hi CursorLineNR    cterm=NONE ctermfg=cyan ctermbg=darkblue
:hi ModeHl          ctermbg=black ctermfg=darkgrey cterm=NONE
:hi FileHl          ctermbg=black ctermfg=magenta cterm=bold
:set cursorline

" ruler highlight
":set colorcolumn=120
":highlight ColorColumn ctermbg=yellow ctermfg=black

" brackets
:hi MatchParen      cterm=bold ctermfg=yellow ctermbg=magenta
:set shm=a

" highlight unwanted whitespaces
:hi ExtraWhitespace ctermbg=red guibg=red
":match ExtraWhiteSpace /\s\+ \|\s\+$/
:match ExtraWhiteSpace /\s\+$/

:set listchars=eol:•,tab:·\ ,trail:\ ,extends:>,precedes:<
:hi eol ctermbg=black ctermfg=darkgray
:hi SpecialKey ctermbg=black ctermfg=darkgray
:hi NonText ctermbg=black ctermfg=darkgray

:hi LineNr ctermfg=darkblue
:hi StatusLine ctermbg=black ctermfg=darkgray cterm=NONE
:set laststatus=2
:set noshowmode
:set updatetime=100

function! ModeSetter()
    let mode = mode()
    "echom "Mode:" mode
    if mode == 'n'
        hi LineNr ctermfg=darkblue
        hi ModeHl ctermbg=black ctermfg=magenta
        hi StatusLine ctermbg=black ctermfg=darkgrey
    elseif mode == 'i'
        hi LineNr ctermfg=green
        hi ModeHl ctermbg=green ctermfg=black
        hi StatusLine ctermbg=green ctermfg=black
    elseif mode == 'R'
        hi LineNr ctermfg=red
        hi ModeHl ctermbg=red ctermfg=black
        hi StatusLine ctermbg=red ctermfg=black
    elseif mode == 'v'
        hi LineNr ctermfg=blue
        hi ModeHl ctermbg=blue ctermfg=black
        hi StatusLine ctermbg=blue ctermfg=black
    elseif mode == 'V'
        hi LineNr ctermfg=blue
        hi ModeHl ctermbg=blue ctermfg=black
        hi StatusLine ctermbg=blue ctermfg=black
    elseif mode == '^V'
        hi LineNr ctermfg=blue
        hi ModeHl ctermbg=blue ctermfg=black
        hi StatusLine ctermbg=blue ctermfg=black
    elseif mode == 'c'
        hi LineNr ctermfg=darkgrey
        hi ModeHl ctermbg=black ctermfg=darkgrey
        hi StatusLine ctermfg=darkgrey ctermbg=black
    endif
    ":redraw!
    ":redrawstatus!
    return ""
endfunction!

function! GetModeTxt()
    let mode = mode()
    "echom "Mode:" mode
    if mode == 'n'
        return " • "
    elseif mode == 'i'
        return "INS"
    elseif mode == 'R'
        return "RPL"
    elseif mode == 'v'
        return "VIS"
    elseif mode() == 'V'
        return "VIS"
    elseif mode == '^V'
        return "BLV"
    elseif mode == 'c'
        return "CON"
    endif
    return mode()
endfunction

" autocommands
augroup colorstyle
    :autocmd!
    :autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    :autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
augroup end

:set statusline=%{ModeSetter()}%#ModeHl#\ %{GetModeTxt()}\ %*%#FileHl#\ %t\ %y\ %M\ %*%=\ \ %4l:%4c\ \│\ %P\ 


