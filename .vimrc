" general tweaks

""""""""""""""""""""""""""""""""""""""""""
" Pathogen
""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
  
"Forget compatibility with Vi. Who cares.  
set nocompatible
set hlsearch

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

let mapleader=","

" Yanking in vim should also copy into my OSX clipboard
set clipboard=unnamed

" Allow backspacing in insert mode
:set backspace=indent,eol,start

" Paste without fear!
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode


""""""""""""""""""""""""""""""""""""""""""
" Visual Stuff
""""""""""""""""""""""""""""""""""""""""""
"Display current cursor position in lower right corner.  
set ruler
  
"Set the color scheme. Change this to your preference.  
set background=dark
"colorscheme solarized
colorscheme wombat256mod

"Show current command in the screen corner
set showcmd
set history=1000

"Set a page title
set notitle

" Highlight the current line
set cul                                           
"hi CursorLine term=none cterm=none ctermbg=3

" No more bell!
set noerrorbells
set visualbell

" Disable code folding
set nofoldenable

"Prefer a slightly higher line height  
set linespace=3  

" put git info and funstuffs into status line
" don't forget to escape spaces! it doesn't seem to like having double quotes
" around the whole thing
set statusline=%<%f%=\ %{GitBranchInfoString()}\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
"                                                                                     ^  ^--- %b is "byte under character" 02 is printf style size I think?
"
" only show the current branch, not the available branches
let g:git_branch_status_head_current=1
" I don't need it to tell me that it's git!
let g:git_branch_status_text=""

"Better line wrapping  
set wrap  
set textwidth=79  
"set colorcolumn=+2
"highlight ColorColumn ctermbg=0
set formatoptions=qrn1 


""""""""""""""""""""""""""""""""""""""""""
" Forcing myself not to use arrows 
""""""""""""""""""""""""""""""""""""""""""
" Movement

" use tab to go between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"nnoremap n gj
"nnoremap e gk
"nnoremap i l

"vnoremap n gj
"vnoremap e gk
"vnoremap i l

"vnoremap s i
"nnoremap s i
"nnoremap S I
"omap s i
" No Help, please
"nmap <F1> <Esc>

set expandtab
"set ts=4
"set sw=4
"set wrap linebreak textwidth=0
set so=5 " no more scrolling from the bottom



" For xml, xhtml, html, mak let's use 2 spaces of indentation
autocmd BufNewFile,BufRead *.mako,*.mak setlocal ft=html
autocmd BufNewFile,BufRead *.less setlocal ft=css
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType perl setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 expandtab
autocmd BufNewFile,BufRead *.json setlocal ft=json
autocmd FileType json setlocal softtabstop=2 tabstop=8 expandtab 

 
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

let g:netrw_list_hide='^\.,.\(pyc\|pyo\|o\)$'

""""""""""""""""""""""""""""""""""""""""""
" Indents, wrapping, line numbers, completion, etc...
""""""""""""""""""""""""""""""""""""""""""

"Show lines numbers  
"set relativenumber
"set number

"Indent stuff  
set smartindent
set autoindent  

" tabs
map tf :tabfirst<CR>
map tj :tabnext<CR>
map tk :tabprev<CR>
map tl :tablast<CR>
map tn :tabnew<CR>
map tc :tabclose<CR>

""""""""""""""""""""""""""""""""""""""""""
" Other Functionality
""""""""""""""""""""""""""""""""""""""""""

" Keep more context when scrolling off the end of a buffer
set scrolloff=3
  
"Set incremental searching"  
set incsearch  
  
" case insensitive search  
set ignorecase  
set smartcase
  
"Hide mouse when typing  
set mousehide  
set ttymouse=xterm2
  
"Split windows below the current window.  
set splitbelow               
  
" More useful command-line completion  
set wildmenu
set wildmode=list:longest  
  
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Ack searching and highlight support 
nmap <Leader>a <Esc>:Ack 
let g:ackhighlight = 1

" Hard wrap for the current paragraph
nmap <Leader>w ^mw<C-V>gq`w

" Use chapa.vim default mappings
let g:chapa_default_mappings = 1

" Map <Leader>h to a Mac color picker (hex)
nmap <Leader>h <Esc>:ColorHEX<CR>

" Pytest leader mappings
nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
map <F3> :Pytest session<CR>

" Function tag list plugin
map <leader>f :TagbarToggle<CR>

" Command T baby
"nnoremap <leader><t> :cd :CommandT
"let g:CommandTAcceptSelectionSplitMap=['<CR>', '<C-g>']
nnoremap <C-h> :CommandTAcceptSelectionSplitMap

nnoremap <leader><space> :noh<cr>

nnoremap <slient>zj o<Esc>
nnoremap <slient>zk O<Esc>

" syntastic settings
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_warnings=0
let g:syntastic_disabled_filetypes = ['html']

" git awesomeness
autocmd FileType gitcommit DiffGitCached | wincmd L | wincmd p

" screen resize
nnoremap <silent> <Leader>r  :resize 21<CR>

" annoying, no please
nnoremap q/ <nop>
nnoremap q: <nop>
nnoremap q? <nop>
 
set t_Co=256

" tmux with awesome vim mappings
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
