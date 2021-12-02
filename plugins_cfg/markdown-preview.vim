Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

let g:preview_markdown_auto_update = 1	"Update preview window when write to buffer.

nmap <leader>m :MarkdownPreview<CR>

let vim_markdown_preview_browser='brave'
