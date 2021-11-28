Plug 'pseewald/vim-anyfold'
Plug 'arecarn/vim-fold-cycle'

" ======[ Any fold ] =========
filetype plugin indent on " required
syntax on                 " required

autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" or
" autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific filetype

set foldlevel=1  " close all folds
" or
" set foldlevel=99 " Open all folds

" === Fold Cycling ===
let g:fold_cycle_default_mapping = 0 "disable default mappings
nmap <Tab><Tab> <Plug>(fold-cycle-open)
nmap <S-Tab><S-Tab> <Plug>(fold-cycle-close)

" Won't close when max fold is opened
let g:fold_cycle_toggle_max_open  = 0
