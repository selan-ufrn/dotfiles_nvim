" Command #1: curl -fLo $HOME/.config/nvim/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

set nocompatible              " be iMproved, required
filetype off                  " required

" ======[ LIST OF PLUGINS FOR INSTALLATION ]========
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')
" Gruvbox plugin.
source ~/.config/nvim/plugins_cfg/gruvbox.vim
" " Another solarized theme.
source ~/.config/nvim/plugins_cfg/vim-solarized8.vim
source ~/.config/nvim/plugins_cfg/vim-colors-solarized.vim
source ~/.config/nvim/plugins_cfg/neosolarized.vim
" Git support
source ~/.config/nvim/plugins_cfg/fugitive.vim
" Nerd tree
source ~/.config/nvim/plugins_cfg/nerdtree.vim
" Fuzzy search
source ~/.config/nvim/plugins_cfg/ctrlp.vim
" Autocomplete
source ~/.config/nvim/plugins_cfg/coc.vim
" Comment lines out.
source ~/.config/nvim/plugins_cfg/nerdcommenter.vim
" Synatx checking
source ~/.config/nvim/plugins_cfg/syntastic.vim
" Easy motion in text.
source ~/.config/nvim/plugins_cfg/easymotion.vim
" Change, add, replace surroundin ( { ""})
source ~/.config/nvim/plugins_cfg/vim-surround.vim
" Poweline style status bar.
source ~/.config/nvim/plugins_cfg/airline.vim
" Add a vertical identation line to programs.
source ~/.config/nvim/plugins_cfg/indentline.vim
" Show code for modified lines in a repo.
source ~/.config/nvim/plugins_cfg/gitgutter.vim
" Controls folding (2 plugins)
source ~/.config/nvim/plugins_cfg/folding.vim
" Markdown preview
source ~/.config/nvim/plugins_cfg/markdown-preview.vim

" Initialize plugin system
call plug#end()
" ======[ End of Plugin configuration ]========


"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
filetype plugin on
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
" Tabbing
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4
set hidden              " Abandoned buffers are not unloaded.
" Keep the sign column always open so that the text does not shift horiz.
" set signcolumn=yes:2
set relativenumber      " Show numbering relative to cursor location.
set number              " Show line numbers
" set hlsearch            " Highlight text while search string is typed in.
set nohlsearch          " Turn off the highlight text after searching is done.
set termguicolors       " Enables 24-bit RGB color in terminal. Use :highlight to see mapping 
set undofile            " Saves undo history to an undo file.  set spell
set title               " The title of the window will be set to 'titlestring' or filename
set ignorecase          " Ignore case in search patterm
set smartcase           " Override 'ignorecase' if search pattern contains upper case characters.
set smartindent         " Smart indentation when programming.
set nowrap              " Do not wrap long lines.
set linebreak           " Wrap lines at convenient points, preserving word integrity.
set autoread            " Reload files changed outside vim
set ruler               " Show text info on the botto right, such line/column percentage%
set visualbell          " Visual bell instead of sound.
" set list                " Show tabs and spaces with symbols.
" set listchars=tab:▸\ ,trail:·  " Visual cues while typing.
set mouse=a             " Enables mouse support in all modes.
set sidescroll=1                " Scroll 1 column at a time.
set scrolloff=8         " Minimal # of lines to keep above/below the cursor.
set backspace=indent,eol,start  " more powerful backspacing
set nojoinspaces        " Does not add 2 spaces after '?', '.', '!'.
set splitright          " Split windows are put to the right of current one.
set clipboard=unnamedplus " Clipboard info is always shared with the system clipboard.
set confirm             " Opens a confirm dialog in certain operations, such as quitting unsaved buffer.
set updatetime=300      " Is nothing is typed in this interval the swap file will be written to disk
set redrawtime=10000    " Allow more time for loading syntax on large files

set background=dark
" colorscheme solarized8
" colorscheme solarized
colorscheme NeoSolarized
" colorscheme gruvbox


" =========================================
" [0] BASIC SETUP:
" =========================================
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" =========================================
" [1] OPENS A TERMINAL WINDOW BELOW
" =========================================
" open terminal below all splits
" cabbrev bterm bo term
" ab bterm bo 10sp | term
" set termwinsize=10x200

" =========================================
" [2] FINDING FILES:
" =========================================

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu
"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif


" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" =========================================
" [3] TAG JUMPING:
" =========================================

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -x .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags


"--------------------------------------------------------------------------
" Customized functions
"--------------------------------------------------------------------------

function! ClangCheckImpl(cmd)
  if &autowrite | wall | endif
  echo "Running " . a:cmd . " ..."
  let l:output = system(a:cmd)
  cexpr l:output
  cwindow
  let w:quickfix_title = a:cmd
  if v:shell_error != 0
    cc
  endif
  let g:clang_check_last_cmd = a:cmd
endfunction

function! ClangCheck()
  let l:filename = expand('%')
  if l:filename =~ '\.\(cpp\|cxx\|cc\|c\)$'
    call ClangCheckImpl("/usr/local/opt/llvm/bin/clang-check " . l:filename)
  elseif exists("g:clang_check_last_cmd")
    call ClangCheckImpl(g:clang_check_last_cmd)
  else
    echo "Can't detect file's compilation arguments and no previous clang-check invocation!"
  endif
endfunction


"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <silent> <F5> :call ClangCheck()<CR><CR>
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vc :edit ~/.config/nvim/coc-settings.json<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Quicky escape to normal mode
imap jj <esc>

" We can also move to windows with arrow keys, adfter pressin `Ctrl+W`
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" " For local replace
" nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
"
" " For global replace
" nnoremap gR gD:%s/<C-R>///gc<left><left><left>
