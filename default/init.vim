" Fix slow escape key reaction
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=100
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"Note: install vim-plug if not present
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

"Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif
  if has('vim_starting')
    set nocompatible
    " Required:
    call plug#begin()
endif

call plug#begin()
  Plug 'tomasiser/vim-code-dark'            " provides the 'code dark' color scheme
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }   " enhances Go development
  Plug 'majutsushi/tagbar'                  " displays tags in a sidebar
  Plug 'airblade/vim-gitgutter'             " shows Git diff markers in the gutter
  Plug 'ctrlpvim/ctrlp.vim'                 " provides a fuzzy file finder
  Plug 'rking/ag.vim'                       " integrates the Silver Searcher (ag) for fast searching
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }   " provides a file explorer in a sidebar
  Plug 'Xuyuanp/nerdtree-git-plugin'        " adds Git integration to NERDTree
  Plug 'scrooloose/syntastic'               " checks syntax errors in various programming languages
  Plug 'tpope/vim-bundler'                  " provides support for Ruby's Bundler
  Plug 'tpope/vim-commentary'               " provides easy commenting of code
  Plug 'tpope/vim-cucumber'                 " enhances Cucumber feature files editing
  Plug 'tpope/vim-dispatch'                 " integrates external tools for tasks execution
  Plug 'tpope/vim-endwise'                  " auto-closes certain structures in programming languages
  Plug 'tpope/vim-fugitive'                 " provides Git integration and commands
  Plug 'tpope/vim-pastie'                   " simplifies pasting from the clipboard
  Plug 'tpope/vim-ragtag'                   " provides shortcuts for HTML/XML tag editing
  Plug 'tpope/vim-rails'                    " provides enhanced Rails development support
  Plug 'tpope/vim-repeat'                   " allows repeating plugin maps with '.'
  Plug 'tpope/vim-surround'                 " provides mappings to easily manipulate surroundings
  Plug 'tpope/vim-unimpaired'               " provides various pairs of mappings for common tasks
  Plug 'tpope/vim-vividchalk'               " provides the 'vividchalk' color scheme
  Plug 'tpope/vim-rake'                     " enhances Rakefile editing
  Plug 'vim-ruby/vim-ruby'                  " provides enhanced Ruby support
  Plug 'vim-scripts/Align'                  " provides alignment of text based on patterns
  Plug 'vim-airline/vim-airline'            " enhances the status line
  Plug 'vim-airline/vim-airline-themes'     " provides additional themes for vim-airline
  Plug 'edkolev/tmuxline.vim'               " integrates Vim with tmux status line
  Plug 'vimwiki/vimwiki'                    " provides personal wiki functionality
  Plug 'Yggdroot/indentLine'                " displays vertical lines to indicate indent levels

  " Plug 'Shougo/neopairs.vim'              " provides advanced auto-pairing functionality with additional features and customization options
  Plug 'jiangmiao/auto-pairs'               " automatically inserts closing pairs of characters

  " autocomplete
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'zchee/deoplete-go', { 'do': 'make'} " provides Go autocompletion for the Deoplete plugin
"  Plug 'deoplete-plugins/deoplete-jedi' " provides Python autocompletion for the Deoplete plugin

  " Markdown support
  " https://github.com/plasticboy/vim-markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'

  " fancy start screen
  Plug 'mhinz/vim-startify'

  " protobuf
  Plug 'uarun/vim-protobuf'

  " HCL support
  Plug 'b4b4r07/vim-hcl'
call plug#end()

"set noshowmode " don't use this with airline. It disables the display of the current mode in the command-line area
set colorcolumn=80,100
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=5                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=4                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set cursorline
set inccommand=split
set relativenumber                                           " shows the relative numbers to your current position

" Enable basic mouse behavior such as resizing buffers.
set mouse=a

" Removes superfluous white space from the end of a line
function! RemoveWhiteSpace()
   :%s/\s*$//g
    :'^
    "`.
endfunction

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader><space> :call RemoveWhiteSpace()<CR>
nnoremap <leader>gt :GitGutterToggle<CR>
"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>
" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>
" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %
nnoremap <silent> <F8> :TagbarToggle<CR>


syntax on
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd BufRead,BufNewFile *.wiki setlocal textwidth=80 wrap
autocmd BufRead,BufNewFile *.nogo set filetype=go

set background=dark
colorscheme codedark

" Auto start NERD tree when opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Allow NerdTree to show hidden files
let NERDTreeShowHidden=1

" Auto start NERD tree if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto refresh NERD tree when new files are created
let g:NERDTreeAutoRefresh = 1

" Use deocomplete.
"let g:deoplete#enable_at_startup = 1
" Use smartcase.
"let g:deolete#enable_smart_case = 1
" Set minimum syntax keyword length.
"let g:deoplete#sources#syntax#min_keyword_length = 3

" deoplete-go settings
"let g:deoplete#sources#go#gocode_binary = $GOPATH . '/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" airline configuration
let g:airline_powerline_fonts = 1
"let g:airline_theme='solarized'
let g:airline_theme='codedark'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:tmuxline_preset = {
  \'a'               : '#(tmux show-option -qv key-table | tr [:lower:] [:upper:])#{?client_prefix,#[reverse][P]#[noreverse] ,}#{?window_zoomed_flag,#[reverse][F]#[noreverse] ,}',
  \'win'             : ['#I', '#W'],
  \'cwin'            : ['#I', '#W'],
  \'x'               : ['#(cat ~/.config/pianobar/current-song.txt)'],
  \'y'               : ['%G-%m-%d'],
  \'z'               : '%R',
  \'options'         : {
    \'status-justify'  : 'left'}
  \}

let g:gitgutter_enabled = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd Filetype go noremap <F2> :GoDecls<CR>

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 1


" Terminal settings
tnoremap <ESC> <C-\><C-n>
autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
" Make navigation into and out of Neovim terminal splits nicer.
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

let g:startify_fortune_use_unicode=1

