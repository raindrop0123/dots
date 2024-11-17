""" REFERENCE """
" https://gitee.com/mirrorvim/vim-fast/blob/master/vimrc-no-plug
" https://github.com/chenxuan520/vim-fast
" https://github.com/skywind3000/vim-init

""" GENERAL """
let mapleader='\'
let maplocalleader=' '
filetype on
filetype plugin on
syntax enable
syntax on
set noeb
set t_Co=256
set vb t_vb=
set cmdheight=1
set showcmd
set textwidth=0
set ruler
set showtabline=1
set laststatus=1
set number
set relativenumber
set cursorline
set cursorcolumn
set colorcolumn=80
set whichwrap+=<,>,h,l
set timeoutlen=500
set ttimeoutlen=0
set virtualedit=block
set showmode
set hidden
set matchpairs+=<:>
set splitbelow
set splitright
set clipboard^=unnamed,unnamedplus
set nowrap
set backspace=2
set sidescroll=0
set nofoldenable
set sidescrolloff=4
set scrolloff=2
set completeopt=menuone,preview,noselect
set omnifunc=syntaxcomplete#Complete
set shortmess+=c
set cpt+=kspell

""" WILD """
set wildmenu
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib,*.bak
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso,*.webp
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git,*/__pycache__/**,__pycache__
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

""" THEME """
set background=dark
" colorscheme habamax

""" INDENTATION """
set autoindent
set cindent
set cinoptions=g0,:0,N-s,(0
set smartindent
filetype indent on
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab

""" SEARCH """
set hlsearch
set incsearch
set ignorecase
set smartcase

""" BACKUP """
set nobackup
set noswapfile
set autoread
set autowrite
set confirm

""" ENCODING """
set langmenu=en_US.UTF-8
set helplang=en
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

""" GUI SETUP """
if has('gui_running')
  set guifont=JetBrainsMono\ Nerd\ Font\ Regular\ 14
  set guioptions-=m
  set guioptions-=T
  set guioptions-=L
  set guioptions-=r
  set guioptions-=b
  set showtabline=0
  set guicursor=n-v-c:ver5
endif

""" DISTRIBUTION PLUGINS """
let g:loaded_getscriptPlugin=1
let g:loaded_gzip=1
let g:loaded_logiPat=1
let g:loaded_manpager=1
let g:loaded_matchit=1
let g:loaded_matchparen=1
let g:loaded_netrwPlugin=1
let g:loaded_rrhelper=1
let g:loaded_spellfile=1
let g:loaded_tarPlugin=1
let g:loaded_tohtml=1
let g:loaded_vimballPlugin=1
let g:loaded_zipPlugin=1

""" AUTOCMD """
autocmd BufReadPost * if line("'\"")>1 && line("'\"") <= line('$') | exe "normal! g'\"" | endif
autocmd InsertEnter * setlocal formatoptions-=r formatoptions-=c formatoptions-=o
autocmd BufWinEnter * if getfsize(expand('%')) > 1048576 | syntax clear | endif

""" MAPPING """
nnoremap <leader>rc <CMD>edit $MYVIMRC<CR>
nnoremap <leader>rC <CMD>source $MYVIMRC<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap jk <ESC>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
cnoremap <C-d> <DEL>

""" VIM-PLUGIN """
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))>0 | PlugInstall --sync | source $MYVIMRC | endif

call plug#begin()
Plug 'sheerun/vim-polyglot', { 'on': [] }
Plug 'morhetz/gruvbox', { 'on': [] }
Plug 'vim-airline/vim-airline', { 'on': [] }
Plug 'ryanoasis/vim-devicons', { 'on': [] }
Plug 'Yggdroot/indentLine', { 'on': [] }
Plug 'airblade/vim-gitgutter', { 'on': [] }
Plug 'tpope/vim-commentary', { 'on': [] }
Plug 'ntpeters/vim-better-whitespace', { 'on': [] }
Plug 'andymass/vim-matchup', { 'on': [] }
Plug 'LunarWatcher/auto-pairs', { 'on': [] }
Plug 'luochen1990/rainbow', { 'on': [] }
Plug 'machakann/vim-highlightedyank', { 'on': [] }
Plug 'wellle/context.vim', { 'on': [] }
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle'] }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'on': ['Files', 'Buffers', 'Colors', 'Rg', 'Lines', 'BLines', 'History', 'Commands'] }
Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF'] }
Plug 'thinca/vim-quickrun', { 'on': ['QuickRun'] }
Plug 'easymotion/vim-easymotion', { 'on': ['<Plug>(easymotion-bd-jk)', '<Plug>(easymotion-bd-w)'] }
Plug 'voldikss/vim-floaterm', { 'on': ['FloatermNew', 'FloatermToggle'] }
Plug 'dense-analysis/ale', { 'on': [] }
call plug#end()

" vim-polyglot
augroup plug_vim_polyglot
  autocmd!
  autocmd InsertEnter * call plug#load('vim-polyglot')
        \| autocmd! plug_vim_polyglot
augroup END

" gruvbox
augroup plug_gruvbox
  autocmd!
  autocmd BufEnter,BufReadPost * call plug#load('gruvbox')
        \| autocmd! plug_gruvbox
        \| colorscheme gruvbox
augroup END

" vim-airline
augroup plug_vim_airline
  autocmd!
  autocmd BufReadPost * call plug#load('vim-airline')
        \| autocmd! plug_vim_airline
        \| let g:airline#extensions#tabline#enabled=1
augroup END

" vim-devicons
augroup plug_vim_devicons
  autocmd!
  autocmd BufReadPost * call plug#load('vim-devicons')
        \| autocmd! plug_vim_devicons
augroup END

" indentLine
augroup plug_indentline
  autocmd!
  autocmd BufReadPost * call plug#load('indentLine')
        \| autocmd! plug_indentline
        \| let g:indentLine_char_list = ['│']
        \| IndentLinesToggle
augroup END

" vim-gitgutter
augroup plug_vim_gitgutter
  autocmd!
  autocmd BufReadPost * call plug#load('vim-gitgutter')
        \| autocmd! plug_vim_gitgutter
        \| call gitgutter#enable()
augroup END

" vim-commentary
augroup plug_vim_commentary
  autocmd!
  autocmd BufReadPost * call plug#load('vim-commentary')
        \| autocmd! plug_vim_commentary
augroup END

" vim-better-whitespace
augroup plugin_vim_better_whitespace
  autocmd!
  autocmd BufReadPost * call plug#load('vim-better-whitespace')
        \| autocmd! plugin_vim_better_whitespace
        \| ToggleWhitespace
augroup END

" vim-matchup
augroup plug_vim_matchup
  autocmd!
  autocmd BufReadPost * call plug#load('vim-matchup')
        \| autocmd! plug_vim_matchup
        \| call matchup#init()
augroup END

" auto-pairs
augroup plug_auto_pairs
  autocmd!
  autocmd InsertEnter * call plug#load('auto-pairs')
        \| autocmd! plug_auto_pairs
        \| call autopairs#AutoPairsTryInit()
augroup END

" rainbow
augroup plug_rainbow
  autocmd!
  autocmd InsertEnter * call plug#load('rainbow')
        \| autocmd! plug_rainbow
        \| call rainbow_main#toggle()
augroup END

" vim-highlightedyank
augroup plug_vim_highlightedyank
  autocmd!
  autocmd BufReadPost * call plug#load('vim-highlightedyank')
        \| autocmd! plug_vim_highlightedyank
        \| let g:highlightedyank_highlight_duration=2000
augroup END

" context.vim
augroup plug_context_vim
  autocmd!
  autocmd BufReadPost * call plug#load('context.vim')
        \| autocmd! plug_context_vim
        \| ContextEnable
augroup END

" which-key
nnoremap <Leader> :<c-u>WhichKey '\'<cr>
nnoremap <localleader> :<c-u>WhichKey '<Space>'<cr>

" nerdtree
let g:NERDTreeWinSize=20
let g:NERDTreeShowHidden=1
nnoremap <c-n> <cmd>NERDTreeToggle<cr>

" fzf.vim
nnoremap <leader>ff <cmd>Files<cr>
nnoremap <leader>fF <cmd>Files ~/<cr>
nnoremap <leader>fb <cmd>Buffers<cr>
nnoremap <leader>fc <cmd>Colors<cr>
nnoremap <leader>fw <cmd>Rg<cr>
nnoremap <leader>fs <cmd>BLines<cr>
nnoremap <leader>fS <cmd>Lines<cr>
nnoremap <leader>fr <cmd>History<cr>
nnoremap <leader><leader> <cmd>Commands<cr>
nnoremap <localleader><localleader> <cmd>Commands<cr>

" quickrun
nnoremap <leader>rf <cmd>QuickRun<cr>

" vim-easymotion
let g:EasyMotion_do_mapping=0
nnoremap <leader>gl <Plug>(easymotion-bd-jk)
nnoremap <leader>gw <Plug>(easymotion-bd-w)

" vim-floaterm
nnoremap <leader>ttp <cmd>FloatermPrev<cr>
tnoremap <leader>ttp <c-\><c-n><cmd>FloatermPrev<cr>
nnoremap <leader>ttT <cmd>FloatermNew<cr>
tnoremap <leader>ttT <c-\><c-n>:FloatermNew<cr>
nnoremap <leader>ttn <cmd>FloatermNext<cr>
tnoremap <leader>ttn <c-\><c-n><cmd>FloatermNext<cr>
nnoremap <leader>ttt <cmd>FloatermToggle<cr>
tnoremap <leader>ttt <c-\><c-n><cmd>FloatermToggle<cr>

" ale
augroup plug_ale
  autocmd!
  autocmd BufReadPost * call plug#load('ale')
        \| autocmd! plug_ale
augroup END
