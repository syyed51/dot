 
"--------------------------------------------------------------------------
"
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


" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
let g:syntastic_javascript_checkers = ['eslint'] 

"--------------------------------------------------------------------------
"
" 
"          Plugins 
"
"__________________________________________________________________________


" Add pathogen to load autoload pugins
set nocp
execute pathogen#infect()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete        "enbale onmicomplete for smart autocompletion.
syntax on
 
 
" Set airline statusline to appear even in single vim editor
" https://github.com/vim-airline/vim-airline.git
set laststatus=2
      


"vim-jsx
"https://github.com/mxw/vim-jsx.git
"Syntax highlighting and indenting for JSX. JSX is a JavaScript syntax
"transformer which translates inline XML document fragments into JavaScript
"objects. It was developed by Facebook alongside React.
let g:jsx_ext_required = 0
" Use global installation of eslint for linting javascript files
 let g:syntastic_javascript_checkers = ['eslint'] 
"--------------------------------------------------------------------------
"           
"            VIM Configurations 
"__________________________________________________________________________
 
"enable mouse in all modes.
set mouse=a


set smartindent


if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile
    "set colorcolumn=+1 "mark the ideal max text width
endif


" set temp directory
set directory=~/.vim/swapfiles/

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


" Setup Omni complete
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



"--------------------------------------------------------------------------
" 
"          Plugins 
"
"__________________________________________________________________________


" Add pathogen to load autoload pugins
set nocp
execute pathogen#infect()
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete        "enbale onmicomplete for smart autocompletion.
syntax on
 
 
" Set airline statusline to appear even in single vim editor
" https://github.com/vim-airline/vim-airline.git
set laststatus=2
      


"vim-jsx
"https://github.com/mxw/vim-jsx.git
"Syntax highlighting and indenting for JSX. JSX is a JavaScript syntax
"transformer which translates inline XML document fragments into JavaScript
"objects. It was developed by Facebook alongside React.
let g:jsx_ext_required = 0
" Use global installation of eslint for linting javascript files
 
 
"     SYNTASTIC
" The syntax checker for vim
" https://github.com/vim-syntastic/syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"      ag
"   the great ag searcher for vim
"   set to be used with vimgrep
"   https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --vimgrep'

