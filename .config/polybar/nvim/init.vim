:set number
":set relativenumber
:set autoindent
:set smartindent
:set mouse=a
:set expandtab
:set shiftwidth=4
:set tabstop=4
:set softtabstop=4
let mapleader=","
    
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Barra de abajo
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
"Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
  
" Autocompletion
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
call plug#end()

"nnoremap <C-f> :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"Paste <leader> = \ 
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

"nmap <F8> :TagbarToggle<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"



set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-CursorInsert/lCursor,r-cr:hor20

highlight Cursor guifg=NONE guibg=white
highlight CursorInsert guifg=NONE guibg=white
