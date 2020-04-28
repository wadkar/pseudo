" cSpell:ignore pyenv,rbenv,nofile,gofmt,untrailspaces
" cSpell:ignore tpope,raimondi,plist,christoomey,roxma,junegunn,antoinemadec
" cSpell:ignore neoclide,honza,mbbill,ntpeters,thaerkh,itchyny
" Set mapleader now so that they get picked by plugins
" XXX: neovim inside vscode support
if !exists('g:vscode')
let mapleader="\<Space>"

" Set proper host programs
let g:python3_host_prog = $HOME . '/.pyenv/versions/neovim-3.8.2/bin/python'
let g:python_host_prog = $HOME . '/.pyenv/versions/neovim-2.7.17/bin/python'
let g:ruby_host_prog = $HOME . '/.rbenv/versions/2.6.5/bin/neovim-ruby-host'
" Make sure you change the shebang accordingly
let g:node_host_prog = $HOME . '/.nodenv/versions/12.16.2/bin/neovim-node-host'
let g:coc_node_path = $HOME . '/.nodenv/versions/12.16.2/bin/node'

" vim-plug
call plug#begin()

"
" Type1: The plugin is fire and forget
"

" Load sensible defaults first
Plug 'tpope/vim-sensible'

" Automagically repeat last command with .
Plug 'tpope/vim-repeat'

" Latest release of git related syntax/filetype configuration
" Supports syntax/indent in .COMMIT_MESSAGE, `git rebase --interactive` etc.
Plug 'tpope/vim-git'

" Automagically detect tabstops :Sleuth for manual detection
Plug 'tpope/vim-sleuth'

" XXX: Battle tested and just works!
Plug 'raimondi/delimitmate'

" .md is markdown not Modula-2
Plug 'tpope/vim-markdown', {'for': ['markdown', 'md']}
let g:markdown_fenced_languages = ['python', 'bash=sh', 'zsh=sh']
let g:markdown_minlines = 100

" Add support for plist editing in vim
Plug 'darfink/vim-plist', {'for': ['plist']}
let g:plist_display_format = 'json'
let g:plist_json_filetype = 'json'

"
" TMUX Support
"

" Navigate across tmux windows using Ctrl+h,j,k,l
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 1

" Play nicely with tmux focus events
Plug 'tmux-plugins/vim-tmux-focus-events'

" Copy paste seemlessly between tmux and vim
Plug 'roxma/vim-tmux-clipboard'

" Support .tmux.conf , K on keyword works :make will source the config
Plug 'tmux-plugins/vim-tmux'

" Save your mistakes so that you can be saved from your mistakes!
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
let g:undotree_WindowLayout = 2
let g:undotree_ShortIndicators = 1
let g:undotree_DiffpanelHeight = 15
let g:undotree_SetFocusWhenToggle = 1

" Show changes to files with respect to git index
Plug 'airblade/vim-gitgutter'
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_grep = 'rg --color=never'

" Use :StripWhitespace{OnChangedLines}
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 0
let g:strip_whitelines_at_eof = 1
" You'll have to manually fix them, try `=` operator to fix indentation
let g:show_spaces_that_precede_tabs = 1

" Remember where we were editing a file
Plug 'farmergreg/vim-lastplace'
"let g:lastplace_ignore += ""
"let g:lastplace_ignore_buftype += ""


" Session management :ToggleWorkspace
Plug 'thaerkh/vim-workspace'
" Use tabs J K for tab switching
"let g:workspace_create_new_tabs = 0
" Save all sessions file in one directory
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'
" Use `:help persistent-undo` with Undotree plugin
let g:workspace_persist_undo_history = 0
" Don't autosave, persistent-undo is sufficient with :Undotree
let g:workspace_autosave = 0
" Don't be too helpful with whitespace
let g:workspace_autosave_untrailspaces = 0


"
" Visual Aids
"

" Highlight lines that are too long
" TODO: Do a :LengthmattersDisable for files by {gofmt,black,prettier}
Plug 'whatyouhide/vim-lengthmatters'
" Default is 81, we set it to black's 89. See: https://youtu.be/wf-BqAjZb8M?t=260
let g:lengthmatters_start_at_column=89
let g:lengthmatters_highlight_one_column=1

" TODO: Needs extensive configuration for full satisfaction
"Plug 'itchyny/lightline.vim'

" Runs most of the stuff out of the box
Plug 'vim-airline/vim-airline'
let g:airline_exclude_preview = 1
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'
let g:airline_powerline_fonts = 1

" 24bit colorscheme!
"Plug 'icymind/NeoSolarized'
Plug 'lifepillar/vim-solarized8'
let g:solarized_termtrans = 1

"
" Type2: The plugin shortcuts are muscle memorized
"

" csw( := word -> ( word )
" csw) := word -> (word)
" csW{ := entire-word -> { entire-word }
" cs"' := "word" -> 'word'
Plug 'tpope/vim-surround'

" `gcc` to comment out a line; `5gcc` comments out 5 lines
" `gc` on selection toggles commenting
" `:7,17Commentary` comments line 7 through 17
" To add support for `apache` FileType
" autocmd FileType apache setlocal commentstring=#\ %
Plug 'tpope/vim-commentary'

" :Delete :Move :Rename :SudoWrite :Chmod etc. works on buffer and file
Plug 'tpope/vim-eunuch'

"
" TODO: Exercise required
"

" FZF Everywhere! Stick with homebrew installation
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_buffers_jump = 1


" TODO: Learn how to git diff
" Git support
Plug 'tpope/vim-fugitive'

" See `:help unimpaired` for the full set of 20 mappings and mnemonics
" TODO: Add mnemonics here
" [<space> to add newline after, <space]
Plug 'tpope/vim-unimpaired'

" Completion/lint/format/quickfix support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" Backend
let g:coc_global_extensions = ['coc-marketplace']
let g:coc_global_extensions+= ['coc-python', 'coc-vimlsp', 'coc-yaml']

" DevOps
let g:coc_global_extensions = ['coc-sh']

" Frontend
let g:coc_global_extensions+= ['coc-tsserver', 'coc-html', 'coc-css']
let g:coc_global_extensions+= ['coc-emmet', 'coc-html', 'coc-css', 'coc-json']
let g:coc_global_extensions+= ['coc-webpack', 'coc-prettier']
"let g:coc_global_extensions += ['coc-tslint', 'coc-eslint', 'coc-stylelint']
"let g:coc_global_extensions += ['coc-styled-components', 'coc-tailwindcss']
"Unfinished
"let g:coc_global_extensions += ['coc-inline-jest']

"
" Completion
"
" TODO: See if <TAB> works, else config <C-{a,s,d,f}> for jump/expand
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<c-k>'
let g:coc_global_extensions+= ['coc-snippets']
Plug 'honza/vim-snippets'

" XXX: Hogs CPU, also don't trust binaries. Better use tags
"let g:coc_global_extensions+= ['coc-tabnine']

"XXX: delimitmate is good enough?
"let g:coc_global_extensions += ['coc-pairs']

" TODO: Inside a file do `cSpell:{enable,disable,word,ignore}` to
" enable/disable spell checking, add/ignore a word to dictionary
" You can also `cSpell:disable-{,next-}line` to disable checking on {,next-}line
let g:coc_global_extensions+= ['coc-spell-checker']

" XXX: Marginal utility?
"let g:coc_global_extensions += [
"  \'coc-list',
"  \'coc-yank',
"  \'coc-actions',
"  \'coc-hihighlight'
"]

" TODO: Requires Java8+ to use lsp4xml
"let g:coc_global_extensions += ['coc-xml']
"hi HighlightedyankRegion term=bold ctermbg=0 guibg=#13354A
"nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" TODO: Watch for next release
"Plug 'pechorin/any-jump.nvim'

"
" Type3: If you forget the mappings, the plugin is disabled
"

" TODO: Marginal utility?
"Plug 'justinmk/vim-sneak'

" XXX: Use vim-coc
" vim-pyenv with jedi-vim
"Plug 'davidhalter/jedi-vim', { 'for': ['python', 'python3'] }
"Plug 'lambdalisue/vim-pyenv', { 'for': ['python', 'python3'] }
"Plug 'psf/black'

" see unicode character representation try ga here: 🍺
"Plug 'tpope/vim-characterize'

" XXX: Use coc-snippets
"Plug 'SirVer/ultisnips'

" Use f<char> then fffff to repeatedly search <char> in forward
" See: https://rhysd.github.io/clever-f.vim/
"Plug 'rhysd/clever-f.vim'
"let g:clever_f_ignore_case = 1
"let g:clever_f_smart_case = 1

" C-a/C-x will also increase/decrease date/times in addition to number
"Plug 'tpope/vim-speeddating'

call plug#end()

"
" Option settings
"

" Dont create swap/backup/etc. temporary files, undodir is good enough
" Also some coc servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile
set undofile
set undodir=~/.scratch/vim/undo//,~/.config/nvim/undo//,.vim/undo//,/tmp//,.
set hidden
set autoread
set fileencoding=utf-8

" default updatetime 4000 is too short
set updatetime=100

" Use mouse when available
if has('mouse')
  set mouse=a
endif

" Indentation and tabs (additional support by vim-sleuth)
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab
set autoindent

" Line numbering
set number
"set relativenumber

" Searching
set hlsearch
set ignorecase
set smartcase
"Use the default grep, for better UX stick with FZF
"set grepprg

" Commandline
" Don't show --INSERT-- etc. in the cmdline
set noshowmode

" Shows partial command in the lower right of the cmdline
set showcmd

" Give more space for displaying messages.
set cmdheight=2

" Default 4000ms is too long, set it to 100ms for better UX.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Ignore these types of files during completion, also ignore case
set wildignorecase
set wildignore+=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib,*.so,*.dll
set wildignore+=*.jar,*.class,*.egg,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.sqlite,*.sqlite3,*.min.js,*.min.css,*.tags
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.pdf,*.dmg,*.app,*.ipa,*.apk,*.mobi,*.epub
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.doc,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*/.git/*,*/.svn/*,*.DS_Store
set wildignore+=*/node_modules/*,*/nginx_runtime/*,*/build/*,*/dist/*,*/tmp/*

" Use the * register to interact with system clipboard
"set clipboard = unnamedplus

" Save global CamelCase variables to sessions
set sessionoptions+=globals

" Split vertical windows right to the current windows
set splitright

" Split horizontal windows below to the current windows
set splitbelow

" Colors
set termguicolors
set background=dark
colorscheme solarized8_flat

" Taken from nvim's `:h guicursor`
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" TODO: Configure statusline
set laststatus=2

"
" Command Mapping
"

"
" My mappings
"

" Moving around
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>

" Make 0 go to first non empty character and ^ to beginning of line
nnoremap 0 ^
nnoremap ^ 0

" Don't start Visual mode, instead quit all
nnoremap <silent> Q :qa<CR>

" Change local directory to current file's directory
nnoremap <silent> <leader>lcd :lcd %:p:h<CR>

" Edit/Reload vimrc
nnoremap <silent> <leader>ve :edit $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

" Quickly disable hlsearch
" XXX: Use unimpaired
""nnoremap <silent> <leader>hl :nohlsearch<CR>

" FZF mappings
" Show preview for files, will not work for non-files (Buffer etc.)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
nnoremap <silent> <leader>ff :Files<CR>
nnoremap <silent> <leader>fb :Buffers<CR>
nnoremap <silent> <leader>fl :Lines<CR>
nnoremap <silent> <leader>fc :Commands<CR>
nnoremap <silent> <leader>fh :History<CR>
nnoremap <silent> <leader>fg :Rg<CR>
nnoremap <silent> <leader>fgg :GGrep<CR>
augroup fzf_status
  autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end

" Fugitive mappings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>

" ToggleWorkspace
nnoremap <silent> <leader>s :ToggleWorkspace<CR>

" better-whitespace
nnoremap <silent> [w :PrevTrailingWhitespace<CR>
nnoremap <silent> ]w :NextTrailingWhitespace<CR>

" UndotreeToggle
nnoremap <silent> <leader>u :UndotreeToggle<CR>

"
" CoC Config
"

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <TAB> for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <leader> to trigger completion.
" <C-space> is Tmux prefix, use <TAB> in insert mode
"inoremap <silent><expr> <leader>c coc#refresh()

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup CocGroup
  autocmd!

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nnoremap <silent> <leader>cf  :Format<CR>
nnoremap <silent> <leader>cd  :<C-u>CocFzfListDiagnostics<CR>
nnoremap <silent> <leader>cc  :<C-u>CocFzfListCommands<CR>
nnoremap <silent> <leader>ce  :<C-u>CocFzfListExtensions<CR>
nnoremap <silent> <leader>cl  :<C-u>CocFzfListLocation<CR>
nnoremap <silent> <leader>co  :<C-u>CocFzfListOutline<CR>
nnoremap <silent> <leader>cr  :<C-u>CocFzfListResume<CR>
nnoremap <silent> <leader>cs  :<C-u>CocFzfListSymbols<CR>
endif
" XXX: neovim inside vscode support
