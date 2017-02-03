 
"--------------------------------------------------------------------------
" 
"           Key Mapping
"
"__________________________________________________________________________
 
 
"set the leader key
:let mapleader = "," 
 
 

nmap <Enter> i <Enter> <Esc>             
" nmap <BS> x
" inoremap <Space>i<Space><Esc>
"Map Q to formate paragraph.
" nnoremap Q gq}
"

"map j to formate json files.
"nmap =j :%!python -m json.tool<CR>



nmap <Enter> i <Enter> <Esc>             
"    nmap <BS> x
"   inoremap <Space>i<Space><Esc>

"Map Q to formate paragraph.
" nnoremap Q gq}
"


" Create abbrivations for commonly mistyped 
" words
" iabbr viod void
" iabbr func function

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
"--------------------------------------------------------------------------
"           
"           functions 
"__________________________________________________________________________
 
 " Setup Omni complete on tab key
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif
            &dictionary
            != ''
            return
            "\<C-K>"
        else
            return
            "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>
" See the diff of file on disk and current edited version
" can be used to see swap saved on disk :)
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffsaved call s:DiffWithSaved()
 
 
"--------------------------------------------------------------------------
"           
"            VIM Configurations 
"__________________________________________________________________________

" always open vertical split on the right.
set splitright 
 
 "enable mouse in all modes.
set mouse=a


set smartindent
set visualbell
set t_vb=
autocmd! GUIEnter * set vb t_vb=

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
    "set colorcolumn=+1 "mark the ideal max text width
endif
 
 "default indent settings
set shiftwidth=4 
set softtabstop=4   " number of visual spaces per TAB
set tabstop=4       " number of spaces per TAB
set expandtab
set autoindent
set showcmd         " show the command being types
set incsearch       " enable instant search
 
 "folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set nowrapscan                  "do not wrap around search 
set formatoptions-=o "dont continue comments when pushing o/O

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1
 
"Line numbers
set number
set relativenumber

set ignorecase
set smartcase 

" set vim path dynamically to current working directory
" remember this does not work if you change vim directory from within vim.
set path+=**

"change search highlight color
:highlight IncSearch gui=underline,bold guifg=White guibg=Red3
 
set backspace=indent,eol,start  
 
set nostartofline
" set nospell 

set directory=~/.vim/swapfiles/

" I like to see my cursor position like :)
set cursorline
set cursorcolumn
"--------------------------------------------------------------------------
" 
"          Plugins 
"
"__________________________________________________________________________


" Add pathogen to load autoload pugins
set nocp
execute pathogen#infect()
filetype plugin indent on
syntax on
set omnifunc=syntaxcomplete#Complete        "enbale onmicomplete for smart autocompletion.
 
 
" Set airline statusline to appear even in single vim editor
" https://github.com/vim-airline/vim-airline.git
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#enabled = 1 
" the separator used on the left side >
let g:airline_left_sep='>'
" the separator used on the right side >
 let g:airline_right_sep='<'

" enable modified detection >
  let g:airline_detect_modified=1

" enable paste detection >
  let g:airline_detect_paste=1
" enable/disable syntastic integration >
  let g:airline#extensions#syntastic#enabled = 1

"vim-jsx
"https://github.com/mxw/vim-jsx.git
"Syntax highlighting and indenting for JSX. JSX is a JavaScript syntax
"transformer which translates inline XML document fragments into JavaScript
"objects. It was developed by Facebook alongside React.
let g:jsx_ext_required = 0
 
" async linting
" https://github.com/w0rp/ale
"Use ale plugin
" use specific linter for specific file type.
 let g:ale_linters = {
\   'javascript': ['eslint'],
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
 
"      ag
"   the silver searcher for vim
"   set to be used with vimgrep
"   https://github.com/ggreer/the_silver_searcher
"let g:ackprg = 'ag --vimgrep'
let g:ackprg = 'ag --nogroup --nocolor --column'


"--------------------------------------------------------------------------
" 
"          auto commands
"
"__________________________________________________________________________

"
" auto reload vim, when there are changes in .vimrc
"
"augroup myvimrc
 "   au!
 "   au BufWritePost .vimrc so $MYVIMRC 
"augroup END
