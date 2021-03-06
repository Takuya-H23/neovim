syntax on

set spelllang=en
set spell
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
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
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
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
  require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
EOF

:lua << EOF
  require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
EOF

set completeopt=menuone,noinsert,noselect 
let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']

autocmd BufWritePre * Neoformat

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'typescript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:highlightedyank_highlight_duration=100

" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FckThatMatchParen()
augroup END

let mapleader = " " 

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>gs <cmd>G<cr>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<cr> 
nnoremap gh <cmd>lua vim.lsp.buf.hover()<cr> 
nnoremap <F5> :UndotreeToggle<CR>
