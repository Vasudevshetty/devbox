" Enable syntax highlighting and file type detection
syntax on
filetype plugin indent on

" Set encoding and file formats
set encoding=utf-8
set fileformats=unix,dos,mac

" UI Enhancements
set number                " Show line numbers
" set cursorline            " Highlight the current line
set ruler                 " Show cursor position
set showcmd               " Show (partial) command in the last line
set laststatus=2          " Always show the status line
set background=dark       " Set dark background for better contrast
set termguicolors         " Enable true color support
set signcolumn=yes        " Show sign column (e.g., for LSP diagnostics)

" Search settings
set hlsearch              " Highlight search results
set incsearch             " Incremental search
set ignorecase            " Ignore case in search
set smartcase             " Override ignorecase if search includes uppercase

" Indentation settings
set tabstop=4             " Number of spaces that a <Tab> in the file counts for
set shiftwidth=4          " Number of spaces to use for autoindent
set expandtab             " Use spaces instead of tabs
set autoindent            " Copy indentation from the current line
set smartindent           " Smart autoindenting for C-like programs
set smarttab              " Adjust tabbing based on file content

" Performance
set lazyredraw            " Redraw only when needed to improve performance
set updatetime=300        " Faster completion (default is 4000ms)
set timeoutlen=500        " Faster key mappings
set ttyfast               " Optimize for fast terminals

" Backup and undo
" set backup                " Keep a backup file
" set backupdir=~/.vim/backup//  " Directory for backup files
" set undofile              " Enable persistent undo
" set undodir=~/.vim/undo// " Directory for undo files
" set swapfile              " Enable swap file
" set directory=~/.vim/swap// " Directory for swap files

" Clipboard and mouse
set clipboard=unnamedplus " Use system clipboard for easier copy/pasting
set mouse=a               " Enable mouse in all modes for easier navigation

" Folding
set foldmethod=indent     " Fold based on indentation
set foldlevel=99          " Open all folds by default
set foldenable            " Enable folding by default

" Split management
set splitright            " Vertical splits open to the right
set splitbelow            " Horizontal splits open below

" Wildmenu and autocompletion
set wildmenu              " Visual autocomplete for command menu
set wildmode=longest:full,full " Enhanced wildmenu behavior
set completeopt=menu,menuone,noselect " Better popup menu experience for completion

" Key mappings
nnoremap <Space> :noh<CR> " Clear search highlights with Space
nnoremap <C-n> :tabnew<CR> " Open a new tab
nnoremap <C-h> :wincmd h<CR> " Navigate splits (left)
nnoremap <C-l> :wincmd l<CR> " Navigate splits (right)
nnoremap <C-j> :wincmd j<CR> " Navigate splits (down)
nnoremap <C-k> :wincmd k<CR> " Navigate splits (up)

" Plugin Manager (vim-plug)
call plug#begin('~/.vim/plugged')

" Plugins for productivity and development
Plug 'tpope/vim-sensible'           " Sensible defaults to optimize Vim setup
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy file finder for fast searching
Plug 'junegunn/fzf.vim'             " fzf integration with Vim for file navigation
Plug 'preservim/nerdtree'           " File tree explorer for easy navigation
Plug 'dense-analysis/ale'           " Asynchronous linting and fixing to show errors inline
Plug 'vim-airline/vim-airline'      " Status/tabline for visual status indicators
Plug 'vim-airline/vim-airline-themes' " Themes for airline for customizing status line
Plug 'morhetz/gruvbox'              " Gruvbox color scheme for better syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code completion engine with LSP support
Plug 'scrooloose/nerdcommenter'     " Easy commenting functionality for rapid commenting/uncommenting
Plug 'jiangmiao/auto-pairs'         " Automatically close brackets, quotes, and parentheses
Plug 'tpope/vim-fugitive'           " Git integration for Git workflows in Vim
Plug 'airblade/vim-gitgutter'       " Git diff indicators in the gutter (shows added/removed lines)
Plug 'lervag/vimtex'                " LaTeX support for writing and compiling LaTeX documents
Plug 'sheerun/vim-polyglot'         " A collection of language packs for various programming languages

" Extra plugins for added functionality
Plug 'vim-syntastic/syntastic'      " Syntax checking (alternative to ALE)
Plug 'godlygeek/tabular'            " Easy alignment of code (especially for tables)
Plug 'nvim-treesitter/nvim-treesitter' " Advanced syntax highlighting and parsing with Treesitter
Plug 'editorconfig/editorconfig-vim' " EditorConfig plugin for consistent coding styles
Plug 'tpope/vim-surround'           " Easy surround editing (e.g., quotes, tags)

call plug#end()

" NERDTree key mapping
nnoremap <C-b> :NERDTreeToggle<CR> " Toggle NERDTree with Ctrl+b for file navigation

" Coc.nvim settings
autocmd BufWritePre *.js,*.ts,*.py,*.go,*.rs :CocCommand prettier.formatFile " Auto format on save

" Additional settings
set hidden                 " Allow switching between buffers without saving
set linebreak              " Wrap lines at word boundaries for better readability
set nowrap                 " Do not wrap long lines (instead, horizontal scroll)
set scrolloff=8            " Keep 8 lines above and below the cursor while scrolling
set updatetime=300         " Faster UI updates for a snappier experience

