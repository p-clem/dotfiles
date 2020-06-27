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

" Opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
set hidden

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


nnoremap <C-c> <nop>

" CTRL-S to Save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a

" CTRL-X to Close
:nmap <c-w> :q<CR>

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

" Replace all highlights
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left><left>

" Replace word. Pressing dot will execute same change on following occurences
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
"===============================
" user interface
"===============================
set number
set relativenumber
set background=dark

"let g:gruvbox_contrast_dark = 'soft'
" colorscheme gruvbox
colorscheme palenight
let g:palenight_terminal_italics=1

" Enables true colors
if (has("termguicolors"))
  set termguicolors
endif

"nnoremap ; :
"nnoremap : ;

"===============================
" plugins
"===============================

" === nerdtree === "
" toggle nerdtree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

let NERDTreeShowHidden=1
let NERDTreeDirArrowExpandable = '▷'
let NERDTreeDirArrowCollapsible = '▼'

" === Fugitive (Git) === "
nnoremap <C-g><C-d> :Gvdiff!<CR>
nnoremap <C-g><C-b> :Gblame!<CR>
nnoremap <C-g><C-c> :Commits!<CR>

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

" === Emmmet === "
let g:user_emmet_leader_key=','
 
" === Airline === "
let g:airline_left_sep= '░'
let g:airline_right_sep= '░'
let g:airline_powerline_fonts=1
let g:airline_theme = "palenight"



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


" === Commentary.nvim === "
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>
" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
