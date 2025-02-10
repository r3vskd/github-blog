syntax on
:set nu
:set clipboard+=unnamedplus

" Some extra-settings
set number
" Filetype detection
filetype plugin indent on
" Syntax highlighting
if !exists("g:syntax_on")|syntax enable|endif
" Allow hidden buffers
set hidden
" Set soft maximum line length
set tw=80
" Make tabs smaller
set tabstop=4 shiftwidth=4
" Stops stupid hard line breaks. See |fo-table|
set formatoptions=lcqjn
" Shown through statusline
set noshowmode
" Sensible splits
set splitright splitbelow
" Show the command being typed
set showcmd
" Case insensitive search - Unless begins with uppercase
set ignorecase smartcase
" Hide formatting characters unless in current line or in insert or command mode
set conceallevel=2 concealcursor=nc
" Better command completion
set wildmode=longest,list,full
" Keep indentation after wrapping and don't break words
set breakindent linebreak
" Don't redraw during macros/register usage
set lazyredraw
" Enable folds but open them by default
set foldenable foldlevelstart=10
" Enable modelines
set modeline
" Lines to keep visible above/below, left/right of the cursor
set scrolloff=10 sidescrolloff=5
" Substituations can happen more than once per line by default
set gdefault
" Write a buffer when switching off of it
set autowrite
" These are neovim defaults on some terminals, set them for all
" Enable changing cursor shape
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" Use mouse
set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'freddiehaddad/feline.nvim'
Plug 'seblj/nvim-tabline'
Plug 'nvim-tree/nvim-web-devicons' 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Yggdroot/indentLine'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
Plug 'ervandew/supertab'
Plug 'Shougo/echodoc.vim' " Muestra la firma de la función.
Plug 'sheerun/vim-polyglot' " Colección de varios plugins de resaltado de sintaxis.
Plug 'ryanoasis/vim-devicons'
Plug 'Mofiqul/vscode.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nougat.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'rcarriga/nvim-notify'
Plug 'itchyny/lightline.vim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""

" In your init.lua or init.vim
set termguicolors
lua << EOF
require("bufferline").setup{}
EOF

" Nerdtree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>:
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Moving between tabs 
nnoremap <C-y> :tabnew<CR>
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

" Telescope mappings
nnoremap <C-l> :Telescope find_files<CR>

" Close tabs mapping  
nnoremap <C-w> :q<CR>

" Save file mapping 
nnoremap <C-s> :w<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""

" Invertir direccion de navegacion (de arriba a abajo) en el plugin supertab
let g:SuperTabDefaultCompletionType = '<c-n>'

set noshowmode  " No mostrar el modo actual (echodoc hace uso de este espacio)

" Activar echodoc al iniciar Neovim
let g:echodoc_enable_at_startup = 1

" Don't showing specific buffers and files on indentLine plugin
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']

" Airline theme selector
let g:airline_theme='distinguished'

" Activar deoplete al iniciar Neovim
let g:deoplete#enable_at_startup = 1

" Showing lines of files
let g:NERDTreeFileLines = 1

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)
augroup deopleteCompleteDoneAu
  autocmd!
  autocmd CompleteDone * silent! pclose!
augroup END
