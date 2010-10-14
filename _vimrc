"basic settings 
set nocompatible
"colorscheme zenburn
set guioptions-=T
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
"let g:dbext_default_profile_rdysrv_dc = 'type=SQLSRV:user=readywiseSA:passwd=l1nuxrams:srvname=rdysrv:host=rdysrv:dbname=democentric'
"let g:dbext_default_profile_ctl_dc = 'type=SQLSRV:user=sa:passwd=continental*2005:srvname=db01.continentalltd.local:host=db01.continentalltd.local:dbname=democentric'
"let g:dbext_default_profile_ctl_se = 'type=SQLSRV:user=sa:passwd=continental*2005:srvname=db01.continentalltd.local:host=db01.continentalltd.local:dbname=shoppereventsoperations'
"let g:dbext_default_profile = 'rdysrv_dc'
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
colorscheme vividchalk
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
set relativenumber "add back when vim7.3 installed
"end new settings to explore and document

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


"easier than typing noh all the time
nnoremap <leader><space> :noh<cr>


"manage length of lines
set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85 "add back when vim7.3 installed

"save after leaving
"au FocusLost * :wa

"folding html tags
nnoremap <leader>ft Vatzf

"editing vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>rb <C-w><C-v><C-l>:!ruby %<cr>
nnoremap <leader>md <C-w><C-v><C-l>:%!mkd.bat<cr>
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

"start NERDTree by default
autocmd VimEnter * NERDTree c:\projects  

"New vim commands to get used to: comma for leader, jj for escape, <leader>ev
"to edit vimrc, ctrl for moving windows, <leader>tab for scratch, tab for tag
"navigation, <leader>c<space> for comments, double letter commands for asp
"navigation, ctrl+p for paste ring, coding zen, sql commands, ;w instead of :w
fun! Demomode()
    exe ':colorscheme vividchalk'
    exe ':set gfn=Consolas:h12:cANSI'
endf

fun! LaunchExplorer()
    silent! exe ':!explorer '.expand('%:h')
endf

"fun! LaunchBash()
    "let mypath = 'cd "'.expand('%:p:h').'"'
    "echo ':!c:\cygwin\bin\bash.exe --login -i -c '.mypath
    "silent! exe ':!c:\\cygwin\\bin\\bash.exe --login -i -c '.mypath
"endf
