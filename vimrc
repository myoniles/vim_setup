"    /\/\ (_) | _____ _   _  ___  _ __( )__  __   _(_)_ __ ___  _ __ ___
"   /    \| | |/ / _ \ | | |/ _ \| '_ \/ __| \ \ / / | '_ ` _ \| '__/ __|
"  / /\/\ \ |   <  __/ |_| | (_) | | | \__ \  \ V /| | | | | | | | | (__
"  \/    \/_|_|\_\___|\__, |\___/|_| |_|___/   \_/ |_|_| |_| |_|_|  \___|
"                     |___/

" Automatic reading of vimrc file on change
autocmd! bufwritepost .vimrc source %

" Numbers on the side, number on is static, all else is relative
set number relativenumber
" Add the ability to toggle them off by pressing the pound key
" or press the star to only get the absolute, when that convenient
map * :set relativenumber!<CR>
map # :set number! relativenumber!<CR>

" I need layers
map <C-c> :sh<CR>

" Lets set hidden to do some buffer magic
set hidden
" define windows and the movement between them
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l>

" tab completion in the menubar
set wildmenu

" Lets get some better buffer movement
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>
nnoremap <c-X> :w<CR>:bd!<CR>
" Lets get some better tab movement
nnoremap ]t :tabn<CR>
nnoremap [t :tabp<CR>

" This was a setting that the brotege told me to use. no idea what it does
set bs=2
" I am a dirty peasant who uses tabs
set tabstop=2
set noexpandtab

" get rid of swap file for living fast and dangerous
set nobackup
set nowritebackup
set noswapfile

" I dislike whitespace
autocmd BufWritePre * %s/\s\+$//e

" I can't spell, I'd be a terrible wizard
map =s :setlocal spell!<CR>

" Package manager Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Manage yourself
Plugin 'VundleVim/Vundle.vim'

" A E S T H E T I C
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'dracula/vim'

" Git stuff
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Markdown syntax
Plugin 'plasticboy/vim-markdown'

" Snippet magic!
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" File exploration
Plugin 'scrooloose/nerdtree'

call vundle#end()

"" --- Colors were moved down here because dracula is handled by vundle now

" https://youtu.be/oilVq8-F4_Q?t=144
" colors
set background=dark
set term=xterm-256color
set t_Co=256
" Color scheme available at https://github.com/ashfinal/vim-colors-violet
color dracula
syntax on


"" ----- Lets configure the plugins -----

" vim-airline: enable tabline and set theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'

" ultisnips
let g:UltiSnipsExpandTrigger="<S-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Shift-N is not used so it goes to NerdTree
" N for Nerd
nnoremap <s-n> :NERDTreeToggle<cr>

" Map the f5 key to compile latex and rmarkdown files
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
autocmd Filetype tex	map <F5> :!pdflatex<space>'<c-r>%'<enter>
" I don't know why but this line used to work, then afterwards the line refrering to the doc type as markdown worked
autocmd Filetype md	map <F5> :!pandoc -o %:p:r.pdf %<CR>
autocmd Filetype markdown	map <F5> :!pandoc -o %:p:r.pdf %<CR>
" Have Shift f5 pull up the pdf generated
map <S-F5> :!$MIKEPDF %:p:r.pdf &<CR>

" run make for c, cpp, run python3
autocmd Filetype c,cpp map <F5> :!make<CR>
autocmd Filetype python map <F5> :!python3 %:p<CR>

"" ----- Keybind Apendix -----
" F5: compile a .tex, .md, or .rmd file using pdftex, pandoc, or R respectively
" F5: Run make in a c file or run a python script
" Shift+F5: open <filename>.pdf
" Shift+N: toggle NERDTREE
" # will toggle the numbers on and off
" =s will toggle spellchecking
" ]c and [c are movement methods between hunks in GitGutter
" ]t and [t are used to move between tabs
" ]b and [b are used to move between buffers
" ctrl+[hjkl] can move betwen windows
" ctrl+X is to exit a buffer and automatically save
" tab expands ultisnips
" ctrl+b and ctrl+z are used for movement in ultisnips
