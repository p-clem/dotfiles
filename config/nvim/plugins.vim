" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" === Editing Plugins === "
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-test/vim-test'

" Comment out stuff
Plug 'tpope/vim-commentary'

" === Git Plugins === "
Plug 'tpope/vim-fugitive' " amazing git wrapper for vim


" === Markdown Plugin === "
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript', 'typescript.tsx'], 
  \ 'do': 'make install'
\}

Plug 'jparise/vim-graphql'

" ReactJS JSX syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'

" Prisma orm
Plug 'pantharshit00/vim-prisma'

" === UI === "
" vim start screen
Plug 'mhinz/vim-startify'


" File explorer
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } | Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons' " file drawer

" Colorscheme
Plug 'drewtempelmeyer/palenight.vim'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


Plug 'ryanoasis/vim-devicons'
call plug#end()

