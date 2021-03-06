" ==========================================================================
" To install:
" [1] search for "vim-plug" plugin manager and follow installation
" instructions.
" [2] You will need an autoload folder inside the nvim configuration folder.
" [3] Run: curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
" https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" [4] You are done, just run nvim and install plugins with PlugInstall
" command.
" [5] Optionally you may create an alias to replace `vim` with  `nvim`
"
" To check which plugin is making startup slow:
" vim core/main.cpp --startuptime time.txt time.txt
" After that, sort the output file, as in:
" sort -r -s -k2,2 time2.txt -o saida
" ==========================================================================

set nocompatible              " be iMproved, required
filetype off                  " required
" Apparently, I need to change this before the plugins are loaded otherwise
" the change won't take effect.
let mapleader = "\<space>"

"--------------------------------------------------------------------------
" Plugins settings
"--------------------------------------------------------------------------

" Specify a directory for plugins and initialize plugin system
call plug#begin('~/.config/nvim/plugged')
" ======[ Tools ] ======
" source ~/.config/nvim/plugins_cfg/goyo.vim                  " Focus writing
source ~/.config/nvim/plugins_cfg/vifm.vim                  " Invoking Vifm to open files.
source ~/.config/nvim/plugins_cfg/fzf.vim                   " File listing in a window 
source ~/.config/nvim/plugins_cfg/floaterm.vim              " Opens a floating terminal <lead>+F1-4
" ======[ Visual scheme ] ======
source ~/.config/nvim/plugins_cfg/gruvbox.vim               " Gruvbox plugin.
source ~/.config/nvim/plugins_cfg/vim-solarized8.vim        " Solarized theme.
source ~/.config/nvim/plugins_cfg/dracula.vim        " Solarized theme.
source ~/.config/nvim/plugins_cfg/papercolor.vim            " Papercolor theme.
source ~/.config/nvim/plugins_cfg/airline.vim               " Poweline style status bar.
source ~/.config/nvim/plugins_cfg/colorizer.vim             " Support coloring of colornames 
source ~/.config/nvim/plugins_cfg/vim-devicons.vim          " Icons support.
" ======[ Programming ] ======
source ~/.config/nvim/plugins_cfg/nerdcommenter.vim         " Comment lines out.
source ~/.config/nvim/plugins_cfg/easymotion.vim            " Easy motion in text.
source ~/.config/nvim/plugins_cfg/gitgutter.vim             " Show code for modified lines in a repo.
source ~/.config/nvim/plugins_cfg/folding.vim               " Controls folding (2 plugins)
source ~/.config/nvim/plugins_cfg/markdown-preview.vim      " Markdown preview. To activate: <C-p>
source ~/.config/nvim/plugins_cfg/treesitter.vim            " Better highlight, folding, autocomplete.
source ~/.config/nvim/plugins_cfg/ycm.vim                   " YouCompleteMe -> IDE support: autocomplete, syntax checking
" ======[ Deactivated ] ======
" source ~/.config/nvim/plugins_cfg/syntastic.vim             " Syntax checking
" source ~/.config/nvim/plugins_cfg/coc.vim                   " Autocomplete
" source ~/.config/nvim/plugins_cfg/vim-surround.vim          " Change, add, replace surrounding brackets.
" source ~/.config/nvim/plugins_cfg/indentline.vim            " Add a vertical identation line to programs.
" source ~/.config/nvim/plugins_cfg/telescope.vim             " Search and stuff displayed in a window
" source ~/.config/nvim/plugins_cfg/fugitive.vim              " Git support
" source ~/.config/nvim/plugins_cfg/nerdtree.vim              " Nerd tree
" source ~/.config/nvim/plugins_cfg/ctrlp.vim                 " Fuzzy search
call plug#end()

"--------------------------------------------------------------------------
" General settings
"--------------------------------------------------------------------------
filetype plugin on
" Encoding
set encoding=utf-8
set fileencoding=utf-8
" Tabbing
set expandtab
set shiftwidth=4
set smarttab
set tabstop=4
set hidden              " Abandoned buffers are not unloaded.
set signcolumn=yes:1    " Keep the sign column always open so that the text does not shift horiz.
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
set ruler               " Show text info on the bottom right, such line/column percentage%
set visualbell          " Visual bell instead of sound.
set cursorline          " Show a cursor line where the cursor is.
set list                " Show tabs and spaces with symbols.
set listchars=tab:???\ ,trail:??  " Visual cues while typing.
set mouse=a             " Enables mouse support in all modes.
set sidescroll=1        " Scroll 1 column at a time.
" set scrolloff=6         " Minimal # of lines to keep above/below the cursor.
set scrolloff=1         " Minimal # of lines to keep above/below the cursor.
set backspace=indent,eol,start  " more powerful backspacing
set nojoinspaces        " Does not add 2 spaces after '?', '.', '!'.
set splitright          " Split windows are put to the right of current one.
set clipboard=unnamedplus " Clipboard info is always shared with the system clipboard.
set confirm             " Opens a confirm dialog in certain operations, such as quitting unsaved buffer.
set updatetime=300      " Is nothing is typed in this interval the swap file will be written to disk
"set redrawtime=10000    " Allow more time for loading syntax on large files
set foldmethod=syntax   " Folding by syntax, not block

set background=dark
" colorscheme solarized8
" colorscheme solarized
" colorscheme NeoSolarized
" colorscheme gruvbox
colorscheme PaperColor
" colorscheme solarized8_high
" colorscheme dracula


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

" nmap <C-g> :Goyo<CR>
" nmap <ENTER> :Goyo<CR>
" nmap <C-i> :IndentLinesToggle<CR>
nmap <silent> <F5> :call ClangCheck()<CR>
nmap <leader>fm :EditVifm .<CR>
nmap <leader>fv :VsplitVifm .<CR>
nmap <leader>fh :SplitVifm .<CR>

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vy :edit ~/.config/nvim/plugins_cfg/ycm.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>

nmap <leader>Q :bufdo bdelete<cr>
" nmap <leader>te :botright 10split | terminal<cr>

" Temporarily disable execution mode.
nnoremap Q <nop>

" Replate Ctrl+W + navigation_keys for Ctrl+naviagation_keys.
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

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

nnoremap <leader>te :botright 10split \| terminal <CR>

" Remaping escape shortcut in terminal mode.
" tnoremap <Esc> <C-\><C-n>
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  " Use this to escape in buffer, or vifm windows: Alt + [
  tnoremap <M-[> <Esc> " Use this to escape in buffer, or vifm windows
  tnoremap <C-v><Esc> <Esc>
endif

  " For local replace
" nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>
"
" " For global replace
" nnoremap gR gD:%s/<C-R>///gc<left><left><left>

lua << EOF
require("treesitter")
EOF
