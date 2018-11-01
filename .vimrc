" Meh
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" I can't keep them "sorted" :lol:
" But lets load the sensible defaults first
Plug 'tpope/vim-sensible'
" csw} := Create Surrounding on Word with }
Plug 'tpope/vim-surround'
" Automagically repeat last command with .
Plug 'tpope/vim-repeat'
" gcc on selection toggles commenting
Plug 'tpope/vim-commentary'
" Git related syntax/filetype configuration
Plug 'tpope/vim-git'
" Git management from vim
Plug 'tpope/vim-fugitive'
" Just do this on file instead of buffer :Move,:Save,:Delete
Plug 'tpope/vim-eunuch'
" Session management, prosession depends on obsession
Plug 'tpope/vim-obsession'
" Automagically detect tabstops
Plug 'tpope/vim-sleuth'
" Use ]b :bnext [<Space> insert \n before current line
Plug 'tpope/vim-unimpaired'
" readline keybindings in insert and command mode C-a for home, C-e for end, C-w delete word
Plug 'tpope/vim-rsi'
" .md is markdown not Modula-2
Plug 'tpope/vim-markdown'
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_minlines = 100
" C-a increment date/number; C-x decreases
Plug 'tpope/vim-speeddating'
" see unicode character representation try ga here: 🍺 
Plug 'tpope/vim-characterize'
" add support for plist editing in vim
Plug 'darfink/vim-plist'
" Navigate across tmux windows using Ctrl+h,j,k,l
Plug 'christoomey/vim-tmux-navigator'
" play nicely with tmux focus events
Plug 'tmux-plugins/vim-tmux-focus-events'
" Automagically add the other pair of bracket/quote/…
Plug 'Raimondi/delimitMate'
" Show changes to files with respect to git index
Plug 'airblade/vim-gitgutter'
" Save your mistakes to be saved from your mistakes!
Plug 'mbbill/undotree'
" Edit zplug files nicely
Plug 'zplug/vim-zplug'
" Theme
Plug 'altercation/vim-colors-solarized'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'farmergreg/vim-lastplace'
Plug 'ntpeters/vim-better-whitespace'
" let g:strip_whitespace_on_save = 1

call plug#end()

" Use the Solarized Dark theme
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Dont clutter my workspace with temporary files
set backupdir=~/.scratch/vim/backup,.vim/backup,.,~/
set undodir=~/.scratch/vim/undo,.vim/undo,.
set undofile
set fileencoding=utf-8
set directory=~/.scratch/vim/swap,.vim/swap,.,~/tmp,/var/tmp,/tmp

set clipboard=unnamedplus
set mouse=a
let mapleader = "\<Space>"

" ctrlp settings
let g:ctrlp_map = '<C-b>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/.git/*,*/tmp/*,*.swp,*.pyc
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|swp|zip)$',
  \}
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

nnoremap <leader>lcd :lcd %:p:h<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap Q :qa<CR>
nnoremap <C-b> :Buffers<CR>

