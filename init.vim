syntax on

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nu
" set nohlsearch
set noerrorbells
set smartindent
set smartcase
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set cmdheight=2
set colorcolumn=80

call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'haishanh/night-owl.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'machakann/vim-highlightedyank'
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme

syntax enable
colorscheme night-owl

:lua << EOF
  require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

:lua << EOF
  require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
EOF


let g:highlightedyank_highlight_duration=100

let mapleader = " " 

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>gs <cmd>G<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr> 
nnoremap gh <cmd>lua vim.lsp.buf.hover()<cr> 
nnoremap <F5> :UndotreeToggle<CR>
