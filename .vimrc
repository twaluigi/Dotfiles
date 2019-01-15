" Thomas Wygonik vimrc
" Colors {{{
syntax enable        " enable syntax processing
set background=dark
let g:two_firwatch_italics=1
color two-firewatch
set t_Co=256
" }}}

" Spaces & Tabs {{{
set tabstop=4        " number of visual spaces per TAB
set softtabstop=4    " number of spaces in tab when editing
set expandtab        " tabs are spaces
filetype indent on   " load filetype-specific index files
set autoindent
set backspace=indent,eol,start
" }}}

" UI Layout {{{
set number           " show line numbers
set showcmd          " show command in bottom bar
set cursorline       " highlight the current line
set wildmenu         " visual autocomplete for command menu
set lazyredraw       " redraw only when needed
set showmatch        " highlight matching [{()}]
" }}}

" Searching {{{
set incsearch        " search as characters are entered
set hlsearch         " highlight matches
set ignorecase       " ignores case while searching
" turn off search highlight by pressing space
nnoremap <leader><space> :nohlsearch<CR>
" }}}

" Folding {{{
set foldenable       " enable folding (collapses sections)
set foldlevelstart=10 " open most folds by default
set foldnestmax=10   " 10 nested folder max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent " fold based on indent level
" allow cursor change in tmux mode
" }}}

" Detect TMUX {{{
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    "    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md\:call <SID>StripTrailingWhiteSpaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END 
" }}}

" Backups {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}

" Functions {{{
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}
" vim:foldmethod=marker:foldlevel=0
