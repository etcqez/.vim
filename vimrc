" C-w c kill window
" C-w C-o kill other window
" C-a/e vim-number
set ttimeout
set ttimeoutlen=100
set display=truncate
try
  set clipboard=unnamedplus
  colorscheme habamax
catch
endtry
set number
set ruler
set linebreak
set showcmd
set noshowmode
set scrolloff=5
"set cursorline
set noswapfile
set softtabstop=2
set shiftwidth=2
set expandtab
"retab
"set showtabline=2
set splitbelow
set splitright
set hlsearch
set ignorecase
set incsearch
set smartcase
syntax on
filetype indent plugin on
inoremap <C-g> <Esc>
inoremap <C-s> <Esc>:w<Enter>
inoremap <C-d> <C-a>
noremap <C-s> :w<Enter>
inoremap <C-Enter> <Esc>o
inoremap <C-v> <Esc>o<Esc>p
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-a> <Esc>I
inoremap <C-e> <End>
inoremap <C-t> <Esc>hxpa
inoremap <C-y> <Esc>p
noremap <C-e> <C-x>

let mapleader=" "
noremap <leader>s :set nohlsearch<Enter>

" 清除每行最后多余的空白
autocmd BufWritePre * :%s/\s\+$//e

" 插件
call plug#begin()
  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
"  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mileszs/ack.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-commentary'
  Plug 'mbbill/undotree'
call plug#end()

" airline
let g:airline#extensions#tabline#enabled = 1

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
let NERDTreeChDirMode=2

" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap FF :Ack!<Space>

" easymotion
nnoremap s <Plug>(easymotion-s2)

" undotree
nnoremap <F5> :UndotreeToggle<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * silent! checktime

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Turn on the Wild menu
set wildmenu

" Height of the command bar
set cmdheight=1

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map 0 ^

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
