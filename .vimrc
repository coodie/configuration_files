



" ------------------------------- Start of vundle

set nocompatible              " be iMproved, required
filetype off                  " required


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'bling/vim-airline'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'xuhdev/SingleCompile'
Plugin 'cmake.vim'
Bundle 'octol/vim-cpp-enhanced-highlight' 
Plugin 'grep.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/vimproc.vim'
Plugin 'unite.vim'
Plugin 'Gundo'
Plugin 'xolox/vim-misc'
Plugin 'ctrlp.vim'
Plugin 'Tagbar'
Plugin 'davidhalter/jedi-vim'

" Easier cooperation with tmux
Plugin 'christoomey/vim-tmux-navigator'

" Make some text tasks easier
Plugin 'surround.vim'
Plugin 'repeat.vim'

" Haskell plugins
Plugin 'dag/vim2hs'
Plugin 'eagletmt/neco-ghc'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'klen/python-mode'

" Latex Plugins

" Coq Plugins
Plugin 'the-lambda-church/coquille'
Plugin 'def-lkb/vimbufsync'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------- End of vundle

syntax on

filetype plugin on
set shell=/bin/bash

" Mostly for GVim
" set background=dark

colorscheme molokai

" Mouse options

set mouse=a " mouse is usable in every mode
set mousemodel=popup " gives menu on right click in gvim
" Display line numbers on the left
set number
set ruler
set wildmenu
set showcmd
set nostartofline
set hidden

" vim completion options
set completeopt=menuone

" folding options
" set foldcolumn=1 " when bigger than 0 ads + at start of line which allows to fold
set foldmethod=syntax " folding is syntax based
set foldlevelstart=99 " stuff's not folded when opening files

" Indentation Options "
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab
let g:indentLine_char='┆' "Will work only with UTF-8 file encodings

" .swp files options
set noswapfile
" set backupdir=~/.vimswp
" set directory=~/.vimswp

" Wrapping options
set nowrap

" compiled from source vim doesn't support backspace
set backspace=indent,eol,start

" statusline options
set laststatus=1 " status line is always on

" Gui options
set guioptions-=M
set guioptions-=m
set guioptions-=L
set guioptions-=R
set guioptions-=T " disables toolbar, it's useless

" Search Options
set incsearch
set ignorecase
set smartcase " If search contains big letter, search gets case sensitive
set wrapscan " Makes searching cyclic

" Keeps cursor in the middle of the screen
set scrolloff=3

" Nice mapping for moving block of lines up and down
vnoremap <silent><C-A-down> :m '>+1<CR>gv
vnoremap <silent><C-A-up> :m '<-2<CR>gv
vnoremap <silent><C-A-j> :m '>+1<CR>gv
vnoremap <silent><C-A-k> :m '<-2<CR>gv


" Coloring Optio
" let &colorcolumn="80,".join(range(120,500),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Easier scrolling 
nmap <C-Down> <C-e>
nmap <C-Up> <C-y>

" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <M-Left> :TmuxNavigateLeft<cr>
nnoremap <silent> <M-Down> :TmuxNavigateDown<cr>
nnoremap <silent> <M-Up> :TmuxNavigateUp<cr>
nnoremap <silent> <M-Right> :TmuxNavigateRight<cr>
nnoremap <silent> <M-w> :TmuxNavigatePrevious<cr>

" Compilation and make options
" CAREFUL, F9 key mapping might not working with some compilers
" Which don't support -O2 or -g options
noremap <silent><F9> :w <CR> :SCCompile <CR> :botright cwindow <CR>
noremap <silent><S-F9> :w <CR> :make! <CR> :botright cwindow <CR>
noremap <silent><F10> :cclose <CR>
noremap <silent><F11> :botright copen <CR>

" Makes moving around windows easier
" map <silent> <A-Up> :wincmd k <CR>
" map <silent> <A-Down> :wincmd j <CR>
" map <silent> <A-Left> :wincmd h <CR>
" map <silent> <A-Right> :wincmd l <CR>

" Buffer moving options
nmap <silent> gn :bnext <CR>
nmap <silent> gN :bprev <CR>

" ConqueGdb options
command -complete=file -nargs=* Gdb split|wincmd T|ConqueGdb <args>
map `q :ConqueGdbCommand quit<CR>
let g:ConqueGdb_SrcSplit = 'left'
let g:ConqueGdb_Leader = '`'
let g:ConqueTerm_ReadUnfocused = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_write = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 0

map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>

" Tagbar options
map <silent> <Leader>g :TagbarToggle<CR>

" C++ Options
" in order to make it work with c++11, one has to change 
" file /syntastic/syntax_checkers/gcc
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1

call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU G++ Compiler', 'g++', '$(FILE_NAME)$ -O2 -g --std=c++14 -Wall  -Wpedantic -o $(FILE_TITLE)$', 'l:common_run_command')
call SingleCompile#SetOutfile('cpp', 'g++', 'l:common_out_file')
call SingleCompile#ChooseCompiler('cpp', 'g++')

au FileType cpp set matchpairs+=<:> " highlights < > brackets in c++

" AirLine options
let g:airline#extensions#tabline#enabled = 1

" neco-ghc options
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" YouCompleteMe option
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''
let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
" let g:ycm_extra_conf_vim_data = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

au filetype cpp map <c-]> :YcmCompleter GoTo<CR>

" NERDTree settings
map <silent> <Leader>t :NERDTreeToggle <CR>
let g:NERDTreeWinPos = "right"

" Haskell settings
let g:syntastic_haskell_checkers = ['hdevtools']
call SingleCompile#ChooseCompiler('haskell', 'ghc')

" vim-hdevtools
let g:syntastic_haskell_hdevtools_args = '-g-fhelpful-errors'
let g:hdevtools_options = g:syntastic_haskell_hdevtools_args

au FileType haskell nnoremap <buffer> <F1> :GhcModType <CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :GhcModTypeClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :botright GhcModLint<CR>
au FileType haskell nnoremap <buffer> <silent> <F4> :GhcModSplitFunCase<CR>
au FileType haskell nnoremap <buffer> <silent> <F5> :GhcModSigCodegen<CR>

" lushtags
" copy pasted from https://github.com/bitc/lushtags/blob/master/plugin/tagbar-haskell.vim
if executable('lushtags')
    let g:tagbar_type_haskell = {
        \ 'ctagsbin' : 'lushtags',
        \ 'ctagsargs' : '--ignore-parse-error --',
        \ 'kinds' : [
            \ 'm:module:0',
            \ 'e:exports:1',
            \ 'i:imports:1',
            \ 't:declarations:0',
            \ 'd:declarations:1',
            \ 'n:declarations:1',
            \ 'f:functions:0',
            \ 'c:constructors:0'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
            \ 'd' : 'data',
            \ 'n' : 'newtype',
            \ 'c' : 'constructor',
            \ 't' : 'type'
        \ },
        \ 'scope2kind' : {
            \ 'data' : 'd',
            \ 'newtype' : 'n',
            \ 'constructor' : 'c',
            \ 'type' : 't'
        \ }
    \ }
endif
" end of copy paste

" Pymode

let g:pymode_rope = 0
let g:pymode_python = 'python3'

" Coquille
let g:coquille_auto_move = 'true'

" Maps Coquille commands to <F2> (Undo), <F3> (Next), <F4> (ToCursor)
au FileType coq call coquille#FNMapping()
