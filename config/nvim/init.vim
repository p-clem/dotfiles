source ~/.config/nvim/plugins.vim

"===============================
" General
"===============================

" Abbreviations
abbr funciton function
abbr teh the
abbr tempalte template
abbr fitler filter
abbr cosnt const
abbr attribtue attribute
abbr attribuet attribute

set nocompatible            " not compatible with vi
set autoread                " detect when a file is changed

set history=1000            " change history to 1000
set textwidth=120

"set relativenumber	    " relative line numbers

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"let g:python_host_prog = '/usr/local/bin/python2'
"let g:python3_host_prog = '/usr/local/bin/python3'

"===============================
" Mappings
"===============================
" Tab control
set expandtab             " insert tabs rather than spaces for <Tab>
set tabstop=4               " the visible width of tabs
set shiftwidth=4            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest


" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

vnoremap <C-c> "+y

" CTRL-S to Save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

"===============================
" User Interface
"===============================
set number
set background=dark
colorscheme gruvbox
"colorscheme onedark

"===============================
" File specific indentation
"===============================
autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

"===============================
" Pluggins
"===============================

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" elm-vim
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0


" airline options
" Airline
let g:airline_left_sep= '░'
let g:airline_right_sep= '░'
let g:airline_powerline_fonts=1

