"basic settings 
set nocompatible
"colorscheme zenburn
"set guioptions-=T
set guioptions=ac
set vb t_vb=
set nohls
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin      
set clipboard=unnamed
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autowrite
set gfn=Consolas:h12:cANSI
set directory=c:\projects\
set nobackup
set nowritebackup
set noswapfile
"need to turn off before pathogen
filetype off
"Note : when installing snipmate thru pathogen, you must copy the after/plugin
"file under vimfiles rather than trusting pathogen to source it
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin on
set formatoptions=l
set lbr
syntax on
filetype on

"NERD TREE settings
let NERDTreeIgnore=['\.sln', '\.sln.cache','^obj$','\My Project','\.suo','\.vbproj.user']
let NERDTreeChDirMode=2
let g:NERDTreeHijackNetrw = 0

"DBext settings
let g:dbext_table_names_number = 0
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn" 

"I prefer to use HTML formatting for my aspx pages
au BufNewFile,BufRead *.aspx set filetype=html
au BufNewFile,BufRead *.vb set filetype=vb
au BufNewFile,BufRead *.txt set filetype=markdown
au BufNewFile,BufRead *.ttc set gfn=Consolas:h14:cANSI

" let c- do it's magic of incrementing numbers
:nunmap <C-A>

"this helps travers long lines better
:nnoremap k gk
:nnoremap j gj
:nnoremap gk k
:nnoremap gj j

"make for easy search across files with \f
:map <leader>f :execute "noautocmd vimgrep /\\<" . expand("<cword>") . "\\>/gj **/*." .  expand("%:e") <Bar> cw<CR>
:map <F2> :NERDTreeToggle c:\projects<CR>
:map <F3> :call Demomode()<CR>
:nmap <CR> _i<Enter><Esc>
:nnoremap <Space> i<Space><Esc>

"start new settings to explore and document
colorscheme zenburn
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"end new settings to explore and document

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

"make search work well
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

"Fixed messed up vim regex so they match every other language
nnoremap / /\v
vnoremap / /\v

"change the leader
let mapleader = ","

" make saving easier
 nnoremap ; :


"make creating windows easy
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <leader><tab> :Sscratch<cr>

"make getting recent files easy
nnoremap <leader>rf :MRU<cr>

nnoremap <leader>t :FufFile<cr>
nnoremap <leader>b :FufBookmarkDir<cr>

"easier than typing noh all the time
nnoremap <leader><space> :noh<cr>


"manage length of lines
set nowrap
"set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85 "add back when vim7.3 installed

"save after leaving
"au FocusLost * :wa

"folding html tags
nnoremap <leader>ft Vatzf

"editing vimrc
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>rb :!ruby %<cr>
nnoremap <leader>md :%!mkd.bat<cr>
"try instead of remapping capslock
inoremap jj <ESC>

nnoremap <leader>ex :call LaunchExplorer()<cr>
nnoremap <leader>eb :call LaunchBash()<cr>

"for moving windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:user_zen_expandabbr_key = '<c-e>'
nmap <leader>w :w!<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>
inoremap { {<CR><BS>}<Esc>ko
set lazyredraw

"Switch to current dir
map CD :cd %:p:h<cr>

"Select all and copy to + buffer
map sa :%y +<cr>
"start NERDTree by default
"autocmd VimEnter * NERDTree c:\projects  

"New vim commands to get used to: comma for leader, jj for escape, <leader>ev
"to edit vimrc, ctrl for moving windows, <leader>tab for scratch, tab for tag
"navigation, <leader>c<space> for comments, double letter commands for asp
"navigation, ctrl+p for paste ring, coding zen, sql commands, ;w instead of :w
"
" GET used to Ctrl-o and Ctrl-i for jumps
" Try using C and D and cc
" sh to goto shell
" ctrl-o = temp normal mode
" :ls = show open buffers
" :b = goto buffer
fun! Demomode()
    exe ':colorscheme vividchalk'
    exe ':set gfn=Consolas:h12:cANSI'
endf
fun! LaunchExplorer()
    silent! exe ':!explorer '.expand('%:h')
endf


