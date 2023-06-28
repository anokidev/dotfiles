" anokidev's dotfiles : NeoVim / nvim .




" ORIGINAL SCRIPT FROM : https://github.com/genzyy/suckless-builds/blob/dotfiles/config/nvim/init.vim - genzyy  .


" BEGIN :


" PLUGINS :


" Plug Plugin Manager.
call plug#begin('~/.vim/plugged')


"" Tools and stuff :

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'romgrk/barbar.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

"" Interface :

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'akinsho/toggleterm.nvim'



" Themes :


""" General :

Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'


""" Bottom bar :


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


""" Icons :

Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'


"" Others :

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'sheerun/vim-polyglot'


call plug#end()

" CONFIGS :

" Auto yank and paste to the system clipboard.
set clipboard=unnamedplus

" Autosave !
autocmd TextChanged,TextChangedI <buffer> silent write

" If people want to test my file, 
" they can use this file without 
" having to worry about incompabillity.
set nocompatible

set shiftwidth=4

" Enable numbers.
set number

" Enable syntax.
syntax enable

" Encoding.
set fileencoding=utf-8
set encoding=utf-8

" So you know the name of the opened document.
set title

" Mouse settings.
set mouse=a

" Auto indent.
set autoindent

" Background dark #1 . Light theme people == aliens.
set background=dark

" No backuping.
set nobackup

" Highlight search words.
set hlsearch

" Show commands.
set showcmd

" Default height for the command line.
set cmdheight=1

" Show the status.
set laststatus=2

" Let 10 lines after the last line of the file.
set scrolloff=10

" Im using ZSH.
set shell=zsh

" Colorscheme.
colorscheme gruvbox

" Airline theme.
let g:airline_theme='gruvbox'

" Enable powerline and powerlevel10k for AirLine.
let g:airline_powerline_fonts = 1

" GUI config.
hi Normal guibg=none
hi Foreground guibg=#ffffff

if has('nvim')
	set inccommand=split
endif

set nosc noru nosm

set lazyredraw
set ignorecase
set smarttab

" Auto-indenting.
set ai
set si

" Turns on indent, detection, amd plugin.
filetype plugin indent on

" No wrap.
set nowrap

" This will set your path variable to current 
" directory (from which you launched NVIM) 
" and to all directories under current directory 
" recursively.
set path+=$PWD/**

" Ignore node_modules.
set wildignore+=*/node_modules/*

" Enable cursor.
set cursorline

" Enable GUI colors.
set termguicolors


" AUTOSTART :

" Auto-start NERDTree.
autocmd VimEnter * NERDTree


" CUSTOM NEOVIM FUNCTIONS :

"Goyo Settings - By Genzyy .
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi! Normal ctermbg=NONE guibg=NONE 
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" NERDTree setup .


let NERDTreeShowHidden=1

" Exit Vim if NERDTree is the only window left - By Genzyy .

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Changing default NERDTree arrow characters.

let g:NERDTreeDirArrowExpandable = '↓'
let g:NERDTreeDirArrowCollapsible = '↑'

" COC Auto - Complete - By Genzyy.


let g:coc_node_path='/usr/local/bin/node'

let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-css',
  \  'coc-eslint',
  \  'coc-prettier'
  \ ]


autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


"function! s:show_hover_doc()
"  call timer_start(500, 'ShowDocIfNoDiagnostic')
"endfunction


"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()

" KEYMAPS :

" Set a key-mapping for copy and pasting to the system clipboard
:vnoremap <Leader>y "+y
:nnoremap <Leader>p "+p

" NERDTree :
"
" KeyBind for my personal shorcut.

nnoremap <F2> :tabprevious<CR>
nnoremap <F3> :tabnext<CR> 

"KeyBind for NERDTree - By Genzyy.

"nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>

" COC :

nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)

nmap <leader>rn <Plug>(coc-rename)


" END.

