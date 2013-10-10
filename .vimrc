set nocompatible 

set t_Co=256
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rake'
Bundle 'leshill/vim-json'
Bundle 'digitaltoad/vim-jade'
Bundle 'ZoomWin'
Bundle 'christoomey/vim-space'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'mutewinter/LustyJuggler'
Bundle 'kien/ctrlp.vim'
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'Rykka/colorv.vim'
Bundle 'nanotech/jellybeans.vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'mutewinter/swap-parameters'
Bundle 'keepcase.vim'
Bundle 'scratch.vim'
Bundle 'IndexedSearch'
Bundle 'xolox/vim-session'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/snipmate-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle "tomtom/tlib_vim"
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'itspriddle/vim-jquery'
Bundle 'nono/vim-handlebars'
" Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'acustodioo/vim-tmux'
Bundle 'hallison/vim-markdown'
Bundle 'kana/vim-textobj-user'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-endwise'
Bundle 'mattn/gist-vim'
Bundle 'wavded/vim-stylus'

autocmd BufNewFile,BufRead *.json setf json
filetype off
filetype plugin indent on 

let mapleader=","
set guifont=Menlo\ for\ Powerline:h12

" Hide Toolbar in MacVim
if has("gui_running")
  set guioptions=egmrt
endif

set macmeta
set background=dark
colorscheme jellybeans

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set ruler         
set nu            
set nowrap       
set laststatus=2 
set cmdheight=2 
set encoding=utf-8
if exists('+colorcolumn')
  set colorcolumn=80 
endif
if exists('+ballooneval')
  set noballooneval
  set balloondelay=100000
endif

syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
set tabstop=2
set backspace=2  
set shiftwidth=2 
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2
set ignorecase
set smartcase 
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc
set showmatch   
set matchtime=2 
set noerrorbells
set novisualbell
set t_vb=

set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

set complete=.,w,b,u,U

command! W w
command! Q q
map <F1> <Esc>
imap <F1> <Esc>
cnoremap w' w<CR>
cnoremap w; w<CR>
nmap Q <nop>

nmap K k
vmap K k

imap <C-l> <C-x><C-l>
nmap <C-d> <C-b>
if has("gui_macvim")
  nmap <D-f> <C-f>
  nmap <D-d> <C-b>
else
  nmap <M-f> <C-f>
  nmap <M-d> <C-b>
endif

inoremap <expr><C-k>  "\<C-x><C-n>"

nnoremap ; :
vnoremap ; :
cnoremap %% <C-R>=expand('%:h').'/'<cr>
nmap gy :%y+<cr>

nmap <silent> <leader>s :set spell!<CR>
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

nmap <silent> gh :wincmd h<CR>
nmap <silent> gj :wincmd j<CR>
nmap <silent> gk :wincmd k<CR>
nmap <silent> gl :wincmd l<CR>
" Upper left window
nmap <silent> g1 :wincmd t<CR>
" Upper right window
nmap <silent> g2 :wincmd b<Bar>:wincmd k<CR>
" Lower left window
nmap <silent> g3 :wincmd t<Bar>:wincmd j<CR>
" Lower right window
nmap <silent> g4 :wincmd b<CR>

" Top Middle
nmap <silent> gt g2<Bar>:wincmd h<CR>
" Bottom Middle
nmap <silent> gb g3<Bar>:wincmd l<CR>

" Previous Window
nmap <silent> gp :wincmd p<CR>
" Equal Size Windows
nmap <silent> g= :wincmd =<CR>
" Swap Windows
nmap <silent> gx :wincmd x<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
" Because I'm dyslexic
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ---------------
" space.vim
" ---------------
" Disables space mappings in select mode to fix snipMate.
let g:space_disable_select_mode=1

" ---------------
" snipMate
" ---------------
" Sets up C-j as the snippet override command. If neocomplcache is completing
" to something we don't want, we can force a snippet with c-j.
ino <silent> <c-j> <c-g>u<c-r>=snipMate#TriggerSnippet()<cr>
snor <silent> <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>
ino <silent> <c-r><c-j> <c-r>=snipMate#ShowAvailableSnips()<cr>

" Backwards mapping to C-h
ino <silent> <c-h> <c-r>=snipMate#BackwardsSnippet()<cr>
snor <silent> <c-h> <esc>i<right><c-r>=snipMate#BackwardsSnippet()<cr>

" These are bindings that don't behave the way you'd expect in select mode.
" Note: Select mode is what snipMate uses when filling in a snippet.
"
" Idea for this fix from neocomplcache-snipmate http://git.io/uq64tQ.
snoremap <CR> a<BS>
snoremap <BS> a<BS>
snoremap <right> <ESC>a
snoremap <left> <ESC>bi
snoremap ' a<BS>'
snoremap ` a<BS>`
snoremap % a<BS>%
snoremap U a<BS>U
snoremap ^ a<BS>^
snoremap \ a<BS>\
snoremap <C-x> a<BS><c-x>

" ---------------
" Neocachecompl
" ---------------
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_enable_cursor_hold_i=1
let g:neocomplcache_cursor_hold_i_time=200
let g:neocomplcache_auto_completion_start_length=1

" Tab / Shift-Tab to cycle completions
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Required to make neocomplcache_cursor_hold_i_time work
" See https://github.com/Shougo/neocomplcache/issues/140
let s:update_time_save = &updatetime
autocmd InsertEnter * call s:on_insert_enter()

function! s:on_insert_enter()
  if &updatetime > g:neocomplcache_cursor_hold_i_time
    let s:update_time_save = &updatetime
    let &updatetime = g:neocomplcache_cursor_hold_i_time
  endif
endfunction

autocmd InsertLeave * call s:on_insert_leave()

function! s:on_insert_leave()
  if &updatetime < s:update_time_save
    let &updatetime = s:update_time_save
  endif
endfunction

" ---------------
" Lusty Juggler
" ---------------
if has('unix')
  " Allows for previous buffer on unix systems without most recent patch level
  " that enable LustyJuggler to work
  nnoremap <leader>, :e#<CR>
else
  nnoremap <leader>, :LustyJugglePrevious<CR>
end
let g:LustyJugglerShowKeys=1 " Show numbers for Lusty Buffers
let g:LustyJugglerSuppressRubyWarning=1

" ---------------
" Syntastic
" ---------------
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Platform-specific config files
if has('win32') || has('win64')
  let g:syntastic_jsl_conf=$HOME.'/.vim/config/windows/syntastic/jsl.conf'
  let g:syntastic_disabled_filetypes=['sh'] " Disable .sh on Windows
endif

" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ---------------
" Indent Guides
" ---------------
let g:indent_guides_enable_on_vim_startup=1

" ---------------
" Session
" ---------------
let g:session_autosave=0
let g:session_autoload=0
nnoremap <leader>os :OpenSession<CR>

" ---------------
" SpeedDating
" ---------------
let g:speeddating_no_mappings=1 " Remove default mappings (C-a etc.)
nmap <silent><leader>dm <Plug>SpeedDatingDown
nmap <silent><leader>dp <Plug>SpeedDatingUp
nmap <silent><leader>dn <Plug>SpeedDatingNowUTC

" ---------------
" Tabular
" ---------------
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>
nmap <Leader>t- :Tabularize /-<CR>
vmap <Leader>t- :Tabularize /-<CR>
nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>

" ---------------
" Fugitive
" ---------------
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>

" ---------------
" Zoomwin
" ---------------
" Zoom Window to Full Size
nmap <silent> <leader>wo :ZoomWin<CR>

" ---------------
" Command T and ctrlp.vim
" ---------------
" Ensure Ctrl-P isn't bound by default
let g:ctrlp_map = ''

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
let g:ctrlp_map = '<C-p>'

" Leader Commands
nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" Always use CtrlP for most recently used files and relative dierctory.
if has('unix')
  nnoremap <silent><C-u> :CtrlPCurFile<CR>
else
  nnoremap <silent><M-u> :CtrlPCurFile<CR>
endif

" Also map leader commands
nnoremap <leader>u :CtrlPCurFile<CR>
nnoremap <leader>m :CtrlPMRUFiles<CR>
nnoremap <leader>b :CtrlPBuffer<CR>

" ---------------
" Powerline
" ---------------
" Keep ^B from showing on Windows in Powerline
if has('gui_macvim')
  let g:Powerline_symbols = 'fancy'
endif
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')

" ---------------
" jellybeans.vim colorscheme tweaks
" ---------------
" Make cssAttrs (center, block, etc.) the same color as units
hi! link cssAttr Constant

" ---------------
" Ack.vim
" ---------------
nmap <silent> <leader>as :AckFromSearch<CR>

" ---------------
" Vundle
" ---------------
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>
