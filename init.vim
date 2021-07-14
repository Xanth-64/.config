call plug#begin('~/.local/share/nvim/plugged')
Plug 'tpope/vim-sensible' "Minimum sensible Configuration
Plug 'dracula/vim'  " Tema Dracula de la IDE
Plug 'morhetz/gruvbox' " Tema Gruvbox
Plug 'drewtempelmeyer/palenight.vim' "Tema Palenight
Plug 'patstockwell/vim-monokai-tasty' "Tema Monokai Tasty
Plug 'folke/tokyonight.nvim' "Tema tokyonighti
Plug 'haishanh/night-owl.vim' "Tema NightOwl 
Plug 'Rigellute/shades-of-purple.vim' "Shades Of Purple
"Plug 'wokalski/autocomplete-flow' "Fuente de Autocompletado para Javascript
Plug 'scrooloose/nerdtree' " File Traversal
Plug 'vim-airline/vim-airline' "Manejo de Git inmediato
Plug 'vim-airline/vim-airline-themes'  " Temas para airline
Plug 'Yggdroot/indentLine' "Marcas de Identacion
Plug 'neovim/nvim-lspconfig' "Configuracion LSP
"Plug 'nvim-lua/completion-nvim' "AutoComplete
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } "Autocomplete via Deoplete 
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense

"Plug 'SirVer/ultisnips' "Snippets Engine
"Plug 'honza/vim-snippets' "Snippets
Plug 'luochen1990/rainbow' "Rainbow Pair Brackets
Plug 'dense-analysis/ale' "Linting 
Plug 'sheerun/vim-polyglot' "Syntax Highlighting
Plug 'jiangmiao/auto-pairs' "Bracket Pairs
Plug 'tpope/vim-surround' "Easy Pair Chaining
Plug 'APZelos/blamer.nvim' "Git Blame
Plug 'nvim-lua/plenary.nvim' "Dependencia de los Comentarios Todo
Plug 'folke/todo-comments.nvim' "Comentarios Todo
Plug 'ryanoasis/vim-devicons' "Cool Icons
Plug 'mhinz/vim-startify' "Start Screen
Plug 'kyazdani42/nvim-web-devicons' "Icons for errors
Plug 'folke/trouble.nvim' "Better Looking Errors
Plug 'jremmen/vim-ripgrep' "RipGrep for searching
Plug '907th/vim-auto-save' "AutoSave 
Plug 'folke/lsp-colors.nvim' "Erroring Colors
Plug 'alvan/vim-closetag' "Close Tag
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " Fuzzy Finder
Plug 'junegunn/fzf.vim'                                 " Enable fuzzy finder in Vim with <C-p>
Plug 'folke/zen-mode.nvim' "Zenmode

"Deoplete Plugins
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'wokalski/autocomplete-flow'
call plug#end() 

"enable the theme
set termguicolors
nnoremap <C-p> :Files<cr>
"colorscheme vim-monokai-tasty

"GruvBox Theme
"autocmd vimenter * ++nested colorscheme gruvbox


"NightOwl Theme
"syntax enable
"colorscheme night-owl

" To enable the lightline theme
"let g:lightline = { 'colorscheme': 'nightowl' }


"Palenight Theme
set background=dark
colorscheme palenight

let g:airline_theme = "palenight"


set relativenumber

"LSP Autocompletion
"lua require'lspconfig'.pyright.setup{}
"lua require'lspconfig'.flow.setup{on_attach=require'completion'.on_attach}
"Use completion-nvim in every buffer
"autocmd BufEnter * lua require'completion'.on_attach()



let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
"Configuracion del AutoComplete
" Use <Tab> and <S-Tab> to navigate through popup menu

" Set completeopt to have a better completion experience
"set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
"set shortmess+=c

"Eliminar Popup Automatico
"let g:completion_enable_auto_popup = 1
"imap <silent> <c-p> <Plug>(completion_trigger)

"Enable Snippets
"let g:completion_enable_snippet = 'UltiSnips'

"Habilitar Brackets de Colores
let g:rainbow_active = 1

"Git Blame Config
let g:blamer_enabled = 1
let g:blamer_delay = 3000

let g:blamer_prefix = ' <=> '

"Todo Comments

lua << EOF
  require("todo-comments").setup {
		 signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
  },
  merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    before = "", -- "fg" or "bg" or empty
    keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
    after = "fg", -- "fg" or "bg" or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
  colors = {
    error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
    warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
    info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
    hint = { "LspDiagnosticsDefaultHint", "#10B981" },
    default = { "Identifier", "#7C3AED" },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
    },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
  }
EOF



"Better Errors
lua require("trouble").setup {}


"Autosave
let g:auto_save = 1

"Zenmode

lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

"Mappings
"Abrir y Cerrar Nerdtree con F2
map <F2> :NERDTreeToggle<CR>
map <F3> :ZenMode<CR>
" INFO: CoC Configuration
let g:coc_global_extensions = ['coc-tsserver','coc-angular','coc-json','coc-html','coc-css','coc-jedi ','coc-eslint','coc-vetur','coc-diagnostic']





" WARN: Anything Below Here Was Copy Pasted

"Basic Configs
"let mapleader = ","

set nocompatible
set hlsearch              " Highlight search results
set ignorecase            " Search ignoring case
set smartcase             " Do not ignore case if the search patter has uppercase
set noerrorbells          " I hate bells
set belloff=esc
set tabstop=2             " Tab size of 4 spaces
set softtabstop=2         " On insert use 4 spaces for tab
set shiftwidth=2
set expandtab             " Use apropiate number of spaces
set nowrap                " Wrapping sucks (except on markdown)
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap " DO wrap on markdown files
set noswapfile            " Do not leve any backup files
set mouse=a               " Enable mouse on all modes
set clipboard=unnamed,unnamedplus     " Use the OS clipboard
set showmatch
set splitright splitbelow
set list lcs=tab:\¦\      "(here is a space)
let &t_SI = "\e[6 q"      " Make cursor a line in insert
let &t_EI = "\e[2 q"      " Make cursor a line in insert

" Keep VisualMode after indent with > or <
vmap < <gv
vmap > >gv
"
" Move Visual blocks with J an K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Autocomand to remember las editing position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END



" NOTE: Coc Configuration 
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
