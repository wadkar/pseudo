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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'farmergreg/vim-lastplace'
Plug 'ntpeters/vim-better-whitespace'
" let g:strip_whitespace_on_save = 1
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'dbeniamine/cheat.sh-vim'

call plug#end()

" Use the Solarized Dark theme
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Searching
set hlsearch
set ignorecase
set smartcase

" Judiciously space out your words
" See: https://stackoverflow.com/a/1878983
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" Dont clutter my workspace with temporary files
set backupdir=~/.scratch/vim/backup,.vim/backup,.,~/
set undodir=~/.scratch/vim/undo,.vim/undo,.
set undofile
set fileencoding=utf-8
set directory=~/.scratch/vim/swap,.vim/swap,.,~/tmp,/var/tmp,/tmp

set clipboard=unnamedplus
set mouse=a
let mapleader = "\<Space>"

set updatetime=100
set signcolumn=yes
set relativenumber
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

nnoremap <leader>cd :lcd %:p:h<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>
nnoremap Q :qa<CR>

" fzf-vim Commands
" `Files [PATH]`    | Files (similar to  `:FZF` )
" `GFiles [OPTS]`   | Git files ( `git ls-files` )
" `GFiles?`         | Git files ( `git status` )
" `Buffers`         | Open buffers
" `Colors`          | Color schemes
" `Ag [PATTERN]`    | {ag}{6} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
" `Rg [PATTERN]`    | {rg}{7} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
" `Lines [QUERY]`   | Lines in loaded buffers
" `BLines [QUERY]`  | Lines in the current buffer
" `Tags [QUERY]`    | Tags in the project ( `ctags -R` )
" `BTags [QUERY]`   | Tags in the current buffer
" `Marks`           | Marks
" `Windows`         | Windows
" `Locate PATTERN`  |  `locate`  command output
" `History`         |  `v:oldfiles`  and open buffers
" `History:`        | Command history
" `History/`        | Search history
" `Snippets`        | Snippets ({UltiSnips}{8})
" `Commits`         | Git commits (requires {fugitive.vim}{9})
" `BCommits`        | Git commits for the current buffer
" `Commands`        | Commands
" `Maps`            | Normal mode mappings
" `Helptags`        | Help tags [1]
" `Filetypes`       | File types
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>flb :BLines<CR>
nnoremap <leader>fw :Windows<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fc :Commands<CR>
nnoremap <leader>fm :Maps<CR>

" fugitive
nnoremap <leader>ga :Git add--interactive
