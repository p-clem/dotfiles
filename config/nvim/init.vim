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
:nnoremap <c-x> :q<CR>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

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

nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

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
hi CocErrorSign ctermbg=black ctermfg=white

" Enables true colors
if (has("termguicolors"))
  set termguicolors
endif

set completefunc=emoji#complete

" to convert :smiley_cat: to 😸
nmap <Leader>e :s/:\([^: ]\+\):/\=emoji#for(submatch(1), submatch(0), 0)/g<CR>:nohl<CR>

" Folding
" set foldmethod=syntax
" set foldlevelstart=1
" let javaScript_fold=1         " JavaScript

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


let g:webdevicons_enable_nerdtree = 1
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
let g:airline#extensions#coc#enabled = 1



" === jsdoc.nvim === "
nmap <C-c> :JsDoc<CR> 

" === Coc.nvim === "
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]


" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <TAB> <Plug>(coc-range-select)
xmap <TAB> <Plug>(coc-range-select)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')


" Fix autofix problem of current line
nmap <leader>f  <Plug>(coc-fix-current)

" Remap for rename current word
nmap <leader>n <Plug>(coc-rename)


" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" === Commentary.nvim === "
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>


let g:startify_change_to_dir=0
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
