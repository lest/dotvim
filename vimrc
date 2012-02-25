set nocompatible

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Background and color scheme
if has('gui_running')
  set background=light
  colorscheme solarized
else
  set background=dark
  colorscheme default
endif

set guioptions-=T               " turn off toolbar
set guioptions-=r guioptions-=L " turn off scrollbars
set guioptions+=c               " use console dialogs

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Enable limited line numbering
set ruler

" Always show status line
set laststatus=2

" Make file/command completion useful
set wildmode=list:longest
set wildmenu

" Don't scatter .swp files everywhere, no constant warnings when opening files
" from a crashed session etc.
set noswapfile

" Turn off backup
set nobackup

" Setup indentation and tabs
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs
set autoindent
set smartindent

" Allow backspace to delete indents, line breaks and past the start of the
" current insert. This makes the key work like in every other editor
set backspace=indent,eol,start

" Show line numbers
set number

" Keep a longer history
set history=1000

" Map leader to ,
let mapleader = ","

" Map NERDTree to ,p
nmap <silent> <Leader>n :NERDTreeToggle<CR>

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Remap ` to '
nnoremap ' `
nnoremap ` '

" Map meta-backspace in command mode to backward kill word
cmap <M-BS> 

" Make <C-l> clear the highlight as well as redraw
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

nnoremap <Leader><Leader> <C-^>

" Allow buffers with changes to be hidden
set hidden

" Maintain more context around the cursor
set scrolloff=3

" Russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Remove trailing whitespace
nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" CtrlP configuration
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']

" Don't use the arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
