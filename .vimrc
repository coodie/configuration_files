" goovie .vimrc
" Works with gtk-vim, version at least 7.4 (could be less but not checked) 


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
" Plugin 'Syntastic'
Plugin 'bitc/vim-hdevtools'
Plugin 'Valloric/YouCompleteMe'
Plugin 'terryma/vim-multiple-cursors'
" Plugin 'nerdtree-ack'
Plugin 'scrooloose/nerdtree'
Plugin 'xuhdev/SingleCompile'
Bundle 'octol/vim-cpp-enhanced-highlight' 
Plugin 'grep.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Shougo/vimshell.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'unite.vim'
Plugin 'Gundo'
Plugin 'rdnetto/YCM-Generator'
" Plugin 'eaglemt/ghcmod-vim'
" Plugin 'eaglemt/neco-ghc'
Plugin 'Haskell-Highlight-Enhanced'
Plugin 'Conque-GDB'
" Plugin 'Solarized'
" Plugin 'AutoComplPop'
" Plugin 'easytags.vim'
Plugin 'xolox/vim-misc'
Plugin 'ctrlp.vim'
Plugin 'Tagbar'
Plugin 'cmake.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ------------------------------- End of vundle

syntax on

filetype plugin on
set shell=/bin/bash

" Mostly for GVim
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
set backupdir=~/.vimswp
set directory=~/.vimswp

" Wrapping options
set nowrap

" statusline options
set laststatus=1 " status line is always on

" Gui options
set guioptions+=b " enables scrolling
set guioptions-=T " disables toolbar, it's useless

" Search Options
set incsearch
set ignorecase
set smartcase " If search contains big letter, search gets case sensitive
set wrapscan " Makes searching cyclic

" Keeps cursor in the middle of the screen
set scrolloff=3

" Coloring Optio
" let &colorcolumn="80,".join(range(120,500),",")
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Easier scrolling 
nmap <C-Down> <C-e>
nmap <C-Up> <C-y>

" These don't really work unless terminal is executed with stty -ixon
nmap <c-s> :w <CR>
imap <c-s> <Esc>:w<CR>a

" Compilation and make options
" CAREFUL, F9 key mapping might not working with some compilers
" Which don't support -O2 or -g options
noremap <silent><F9> :w <CR> :SCCompile <CR> :botright cwindow <CR>
noremap <silent><S-F9> :w <CR> :make! <CR> :botright cwindow <CR>
noremap <silent><F10> :cclose <CR>
noremap <silent><F11> :botright copen <CR>

" Makes moving around windows easier
map <silent> <A-Up> :wincmd k <CR>
map <silent> <A-Down> :wincmd j <CR>
map <silent> <A-Left> :wincmd h <CR>
map <silent> <A-Right> :wincmd l <CR>

" Buffer moving options
nmap <silent> Q :bdelete <CR>
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

call SingleCompile#SetCompilerTemplate('cpp', 'g++', 'GNU G++ Compiler', 'g++', '$(FILE_NAME)$ -O2 -g --std=c++11 -Wall  -Wpedantic -o $(FILE_TITLE)$', 'l:common_run_command')
call SingleCompile#SetOutfile('cpp', 'g++', 'l:common_out_file')
call SingleCompile#ChooseCompiler('cpp', 'g++')

au FileType cpp set matchpairs+=<:> " highlights < > brackets in c++

" AirLine options
let g:airline#extensions#tabline#enabled = 1

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
let g:ycm_confirm_extra_conf = 1
let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

" NERDTree settings
map <silent> <Leader>t :NERDTreeToggle <CR>


" Haskell settings
let g:syntastic_haskell_checkers = ['hdevtools']
call SingleCompile#ChooseCompiler('haskell', 'ghc')
"call SingleCompile#ChooseCompiler('haskell', 'ghc', 'Glasgow Haskell

" vim-hdevtools
let g:syntastic_haskell_hdevtools_args = '-g-fhelpful-errors'
let g:hdevtools_options = g:syntastic_haskell_hdevtools_args

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
