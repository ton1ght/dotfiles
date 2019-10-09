"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          _              
"    _  __(_)_ _  ________
"  _| |/ / /  ' \/ __/ __/
" (_)___/_/_/_/_/_/  \__/ 
"                        
"                       
" Sections:
"    -> Plugins
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimplug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/neosnippet.vim'
"Plug 'SirVer/ultisnips'
"Plug 'astoff/digestif'
"Plug 'cquery-project/cquery'
"Plug 'cquery-project/cquery' 
"Plug 'deoplete-plugins/deoplete-jedi'
"Plug 'deoplete-plugins/deoplete-tag'
"Plug 'junegunn/fzf.vim'
"Plug 'junegunn/goyo.vim'
"Plug 'llvm-mirror/clang-tools-extra'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'rhysd/vim-grammarous'
"Plug 'valloric/youcompleteme'
"Plug 'vim-latex/vim-latex'
"Plug 'vim-syntastic/syntastic'
"Plug 'xavierd/clang_complete'
"Plug 'zchee/deoplete-clang'
Plug 'dylanaraps/wal.vim'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'ryanoasis/vim-devicons' 
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Coc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline^=%{coc#status()}

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
map <leader>vv :Vista<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_compiler_progname = 'nvr'

" basic latex settings
let g:vimtex_complete_close_braces = 1
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
"let g:vimtex_quickfix_mode=0

" bindings for vimtex
map <leader>vc :VimtexCompile<CR>
map <leader>vt :VimtexTocToggle<CR>
map <leader>vo :VimtexTocOpen<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme = 'wal'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dont show mode (already in airline)
set noshowmode

" close fold with bakspace
nnoremap <BS> zc

" set leader to ,
let mapleader = ","

" bindings for copy/paste
noremap <C-c> "+y
map <C-v> "+p

" show buffers with f5
nnoremap <F5> :buffers<CR>:buffer<Space>

" always show signcolumn 
set signcolumn=yes

" set signcolumn color
hi! link SignColumn LineNr

" disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable mouse scrolling
set mouse=a

" Autocompile .Xresources
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
autocmd BufWritePost *compton.conf !~/bin/comptonRestart.sh > /dev/null 2>&1 &

" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

" Set every line number, except the current one, to a different color
highlight LineNr ctermfg=4

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
" disable window separator
" autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=NONE ctermbg=NONE
" hi StatusLine                  ctermfg=NONE     ctermbg=NONE     cterm=NONE
" hi StatusLineNC                ctermfg=NONE     ctermbg=NONE     cterm=NONE
" set fillchars+=vert:│
" hi VertSplit ctermbg=NONE guibg=NONE

" highlight StatusLine ctermfg=NONE ctermbg=NONE guibg=NONE guifg=NONE   
" highlight StatusLineNC ctermfg=NONE ctermbg=NONE guibg=NONE guifg=bg

" Autostart NERDTree
""autocmd vimenter * NERDTree

" Tells Powerline to use python3
let g:powerline_pycmd="py3"

" Sets how many lines of history VIM has to remember
set history=500

" Show hybrid numbers of the line
set relativenumber
set number

" Enable filetype plugins
"filetype plugin on
"filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
"let $LANG='en' 
"set langmenu=en
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=de
 setlocal noexpandtab
endfu

com! WP call WordProcessorMode()

" remember folds
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
