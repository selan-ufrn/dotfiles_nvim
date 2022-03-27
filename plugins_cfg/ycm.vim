Plug 'Valloric/YouCompleteMe'
" From: https://github.com/autozimu/LanguageClient-neovim/wiki/Clangd
let g:LanguageClient_serverCommands = {
      \ 'cpp': ['clangd'],
  \ }

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
" Global config file: set flags there or copy a local conf file to the
" project' folder.
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gt :YcmCompleter GoTo<CR>
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
nnoremap <leader>gtp :YcmCompleter GetType<CR>
nnoremap <leader>gp :YcmCompleter GetParent<CR>
nnoremap <leader>gti :YcmCompleter GoToInclude<CR>
nnoremap <leader>gdf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>yd :YcmDiags<CR>
" nmap <leader>D <plug>(YCMHover)

function! s:CustomizeYcmLocationWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
  " Switch back to working window.
  wincmd p
endfunction

autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()


function! s:CustomizeYcmQuickFixWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
endfunction

autocmd User YcmQuickFixOpened call s:CustomizeYcmQuickFixWindow()

