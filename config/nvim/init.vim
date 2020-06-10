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
set tabstop=2               " the visible width of tabs
set shiftwidth=2            " number of spaces to use for indent and unindent
set shiftround              " round indent to a multiple of 'shiftwidth'
set completeopt+=longest


" set a map leader for more key combos
let mapleader = ','

" remap esc
inoremap jk <esc>

" Prevent ex mode
nnoremap Q <nop>


" CTRL-S to Save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" CTRL-X to Close
:nmap <c-x> :q<CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" === coc.nvim === "
"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
"nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

"===============================
" User Interface
"===============================
set number
set relativenumber
set background=dark
let g:gruvbox_contrast_dark = 'soft'

colorscheme gruvbox

"===============================
" Plugins
"===============================

" === NERDTree === "
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" === Fugitive (Git) === "
nnoremap <C-g> <C-d> :Gdiff!<CR>

" === fzf.nvim === "
let g:fzf_layout = { 'down': '~25%' }

" Search files
nnoremap <C-p> :Files!<CR>

" Search within files
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always ' 
  \  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)
nnoremap <C-f> :Rg!<CR>


" === Airline === "
let g:airline_left_sep= '░'
let g:airline_right_sep= '░'
let g:airline_powerline_fonts=1


" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
