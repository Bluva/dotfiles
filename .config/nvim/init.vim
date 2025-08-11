:set number
:set autoindent
:set smartindent
:set mouse=a
:set expandtab
:set shiftwidth=4
:set tabstop=4
:set softtabstop=4
let mapleader=","

call plug#begin()

Plug 'vim-airline/vim-airline' " Status bar
Plug 'preservim/nerdtree' " NerdTree
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'sitiom/nvim-numbertoggle' " Number toggle
Plug 'terryma/vim-multiple-cursors' " CTRL + N for multiple cursors

" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'

call plug#end()

nnoremap <C-t> :NERDTreeToggle<CR>

"Paste
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>x "+x
vnoremap <leader>x "+x

lua << EOF
local cmp = require'cmp'
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  completion = {
    keyword_length = 2,
  },
  performance = {
    max_view_entries = 10,
  },
  sources = {
    { name = 'nvim_lsp' },
  }
})

vim.diagnostic.config({
  signs = false,
  virtual_text = false,
})

require('lspconfig').clangd.setup{
    cmd = { "clangd", "--header-insertion=never"}
}
EOF

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-CursorInsert/lCursor,r-cr:hor20

highlight Cursor guifg=NONE guibg=white
highlight CursorInsert guifg=NONE guibg=white

" --- VS Code Dark+ inspired theme ---
set termguicolors
set background=dark
highlight clear

" Base
highlight Normal       guifg=#d4d4d4 guibg=#000000
highlight Comment      guifg=#6a9955 gui=italic
highlight Constant     guifg=#569cd6
highlight String       guifg=#ce9178
highlight Number       guifg=#b5cea8
highlight Boolean      guifg=#b5cea8

" Code structure
highlight Function     guifg=#dcdcaa
highlight Identifier   guifg=#d4d4d4
highlight Keyword      guifg=#c586c0
highlight Statement    guifg=#c586c0
highlight Type         guifg=#4ec9b0
highlight Operator     guifg=#d4d4d4

" Treesitter overrides
highlight @function    guifg=#dcdcaa
highlight @variable    guifg=#d4d4d4
highlight @keyword     guifg=#c586c0
highlight @type        guifg=#4ec9b0
highlight @string      guifg=#ce9178
highlight @number      guifg=#b5cea8
highlight @boolean     guifg=#b5cea8
highlight @comment     guifg=#6a9955 gui=italic

let g:airline_theme='vscode_like'
let g:airline_powerline_fonts=1
