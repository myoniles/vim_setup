" THE ALL POWERFUL CUSTOM VIM CONFIG OF MIKEYON"
" Automatic reading of vimrc file on change
autocmd! bufwritepost .vimrc source %

" Numbers on the side, starting at 1, static
set number

" This was a setting that the brotege told me to use. no idea what it does
set bs=2
" I am a dirty peasant who uses tabs
set tabstop=2
set noexpandtab

" git rid of swap file
set nobackup
set nowritebackup
set noswapfile

" https://youtu.be/oilVq8-F4_Q?t=144
" colors
set background=dark
set term=xterm-256color
set t_Co=256
" Color scheme available at https://github.com/ashfinal/vim-colors-violet
colorscheme violet
syntax on

" Package manager Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Manage yourself
Plugin 'VundleVim/Vundle.vim'

" A E S T H E T I C
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'

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

"" ----- Lets configure the plugins -----

" vim-airline: enable tabline and set theme
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Shift-T is not used so it goes to NerdTree
" T for Tree
nnoremap <s-t> :NERDTreeToggle<cr>

" Map the f5 key to compile latex and rmarkdown files
autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\<space>R<space>--vanilla<enter>
autocmd Filetype tex	map <F5> :!pdflatex<space>'<c-r>%'<enter>

"" ----- Keybind Apendix -----
" F5: compile a .tex or .rmd file using pdftex or R respectively
" Shift+T: toggle NERDTREE
" ]c and [c are movement methods between hunks in GitGutter
" tab expands ultisnips
" ctrl+b and ctrl+z are used for movement in ultisnips
