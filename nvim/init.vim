" ORIGINAL SCRIPT FROM : https://github.com/genzyy/suckless-builds/blob/dotfiles/config/nvim/init.vim - genzyy  .


" BEGIN :


" PLUGINS :


" Plug Plugin Manager.
call plug#begin('~/.vim/plugged')


"" Tools and stuff :


" NERDTree file manager :- https://github.com/preservim/nerdtree - preservim .
Plug 'preservim/nerdtree'

" COC auto-completion :- https://github.com/neoclide/coc.nvim - neoclide.
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Javascript syntax hightlight :- https://github.com/pangloss/vim-javascript - pangloss. 
Plug 'pangloss/vim-javascript'

" CSS auto-color showcase :- https://github.com/ap/vim-css-color - ap .
Plug 'ap/vim-css-color'

" Autopairs :- https://github.com/jiangmiao/auto-pairs - jiangmiao.
Plug 'jiangmiao/auto-pairs'


"" Themes :


""" General :

" Atom one like theme :- https://github.com/sonph/onehalf - sonph.
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Google material like theme :- https://github.com/NLKNguyen/papercolor-theme - NLKNguyen.
Plug 'NLKNguyen/papercolor-theme'

" Classic jazzy like theme :- https://github.com/morhetz/gruvbox - morhetz.
Plug 'morhetz/gruvbox'

" Purple dark theme :- https://github.com/dracula/vim - dracula .
Plug 'dracula/vim'


""" Bottom bar :


" Colorscheme for bottom bar :- https://github.com/vim-airline/vim-airline - vim-airline .
Plug 'vim-airline/vim-airline'

" Auto-sync colorscheme to the bottom bar :- https://github.com/vim-airline/vim-airline-themes - vim-airline.
Plug 'vim-airline/vim-airline-themes'


""" Icons :

" Icons for Vim and NVim :- https://github.com/ryanoasis/vim-devicons - ryanoasis.
Plug 'ryanoasis/vim-devicons'


"" Others :


" Limelight :- https://github.com/junegunn/limelight.vim - junegunn.
Plug 'junegunn/limelight.vim'

" Goyo :- https://github.com/junegunn/goyo.vim - junegunn.
Plug 'junegunn/goyo.vim'

" Language packs :- https://github.com/sheerun/vim-polyglot - sheerun.
Plug 'sheerun/vim-polyglot'


call plug#end()


" CONFIGS :


" No auto cmd .
autocmd!

" If people want to test my file, 
" they can use this file without 
" having to worry about incompabillity.
set nocompatible

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
colorscheme onehalfdark

" Airline theme.
let g:airline_theme='onehalfdark'

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
set winblend=0
set wildoptions=pum
set pumblend=5

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

" Auto-start NERDTree.

autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window left - By Genzyy .

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Changing default NERDTree arrow characters.

let g:NERDTreeDirArrowExpandable = '↓'
let g:NERDTreeDirArrowCollapsible = '↑'

"KeyBind for NERDTree - By Genzyy.

"nnoremap <F4> :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

"KeyBind for TAGbar.
nmap <F8> :TagbarToggle<CR>

" COC Auto - Complete - By Genzyy.

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

nnoremap <silent> K :call CocAction('doHover')<CR>


"function! s:show_hover_doc()
"  call timer_start(500, 'ShowDocIfNoDiagnostic')
"endfunction


"autocmd CursorHoldI * :call <SID>show_hover_doc()
"autocmd CursorHold * :call <SID>show_hover_doc()

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
