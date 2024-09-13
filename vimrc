set ttimeout
set ttimeoutlen=100
set display=truncate
try
  set clipboard=unnamed
catch
cnoremap <Esc> <Nop>
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
let mapleader=" "
noremap <leader>s :w<Enter>
inoremap <C-s> <Esc>:w<Enter>
noremap <C-s> :w<Enter>
inoremap <C-Enter> <Esc>o
noremap <C-Enter> o
inoremap <C-M> <Esc>o
noremap <C-M> o
inoremap <C-v> <Esc>o<Esc>p

" 清除每行最后多余的空白
autocmd BufWritePre * :%s/\s\+$//e

"记住上次编辑和浏览的位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 插件
call plug#begin()

  Plug 'vim-airline/vim-airline'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'mileszs/ack.vim'

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
