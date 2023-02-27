" Line numbes
set number

" File title
set title

" Highlight current line
set cursorline
hi CursorLine cterm=NONE ctermbg=lightgrey

set wildmenu
set expandtab
set shiftwidth=4
set tabstop=4

filetype plugin indent on
syntax on

set t_Co=256

" Load plugins
lua require("plugins")

" Plugin specific configs
lua require("configs/tree")
lua require("configs/lspconfig")

" Colorscheme
set background=light
colorscheme gruvbox

" Errors in LSP appear instead of linenumber
set signcolumn=number
