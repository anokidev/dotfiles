" Anokidev's dotfiles : NeoVim / nvim .

set nocompatible

"" PLUGINS :

call plug#begin('~/.vim/plugged')

" Auto-Complete Toolings:
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " COC language server.
Plug 'sheerun/vim-polyglot'                             " Polygot language pack.
Plug 'pangloss/vim-javascript'                          " Vim for Javascript.
Plug 'leafgarland/typescript-vim'                       " Vim for Typescript.
Plug 'evanleck/vim-svelte', {'branch': 'main'}          " Vim for Svelte.

" User Interfaces:
Plug 'preservim/nerdtree'                               " NERDTree file explorer.
Plug 'akinsho/toggleterm.nvim'                          " Built-in terminal.
Plug 'pacha/vem-tabline'                                " Tabline plugin.
Plug 'vim-airline/vim-airline'                          " Vim Airline.
Plug 'vim-airline/vim-airline-themes'                   " Theme for Vim Airline.
Plug 'ryanoasis/vim-devicons'                           " Vim icon packs.
Plug 'kyazdani42/nvim-web-devicons'                     " Another icon packs.
Plug 'ap/vim-css-color'                                 " Color highlight for Vim.

" Vim Themes:
Plug 'navarasu/onedark.nvim'                            " Atom One dark.
Plug 'NLKNguyen/papercolor-theme'                       " Google Papercolor themes.
Plug 'morhetz/gruvbox'                                  " Gruvbox.
Plug 'dracula/vim'                                      " Dracula.
Plug 'tomasr/molokai'                                   " Monokai.
Plug 'tomasiser/vim-code-dark'                          " VS Code dark theme.
Plug 'wojciechkepka/vim-github-dark'                    " Github theme.
Plug 'arcticicestudio/nord-vim'                         " Nord.

call plug#end()

"" CONFIGS:

" Features:
set number                                              " Enable number.
set title                                               " Enable title.
set hlsearch                                            " Enable highlight search patterns.
set showcmd                                             " Show commands.
set mouse=a                                             " Enable mouse.
set cursorline                                          " Enable cursor line.
set termguicolors                                       " Enable colors.
set cmdheight=1                                         " Set command height to one line.
set laststatus=2                                        " Show last status.
syntax enable                                           " Enable syntax.
filetype plugin indent on                               " Enable filetype, plugins, and indentation.

" Behaviour:
set clipboard+=unnamedplus                              " Set clipboard to system clipboard.
set scrolloff=10                                        " Set scrolloff height to 10 lines.
set nowrap                                              " Do not wrap text.
set nosc noru nosm                                      " Increase notification speed.
set lazyredraw                                          " Buffer screen updates to increase speed.
set ignorecase                                          " Ignore case.
set smarttab                                            " Smart tab.
set path+=$PWD/**                                       " Set path to the current PWD.
set wildignore+=*/node_modules/*                        " Ignore node_modules.
if has('nvim')                                          " Interactive feedback when composing command.
	set inccommand=split
endif

" Indenting:
set autoindent                                          " Automatically indent.
set shiftwidth=4                                        " Set shift size to 4 spaces.
set ai                                                  " Enable smarter indenting.
set si                                                  " Optimize syntax highlighting.

" Encoding:
set encoding=utf-8                                      " Set encoding to UTF-8.
set fileencoding=utf-8                                  " Set file encoding to UTF-8.

" Saving:
set nobackup                                            " No backup.
autocmd TextChanged,TextChangedI <buffer> silent write  " Autosave.

" Appearance:
colorscheme ghdark                                      " Set colorscheme to Github dark.
set background=dark                                     " Set background to dark.

hi Normal guibg=none                                    " GUI background = none.
hi Foreground guibg=#ffffff                             " Foreground = white.

"" PLUGINS:

" Airline:
let g:airline_theme='ghdark'                            " Airline theme = Github dark.
let g:airline_powerline_fonts = 1                       " Enable Powerline fonts for Airline.

" NERDTree:
autocmd VimEnter * NERDTree                             " Autostart NERDTree.
let NERDTreeShowHidden=1                                " Show hidden files.
let g:NERDTreeDirArrowExpandable = '↓'                  " Expandable icon.
let g:NERDTreeDirArrowCollapsible = '↑'                 " Collapsible icon.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Auto-quit if NERDTree is the only active window.

" COC:
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

"" KEYMAPS :

" Copypasta:
:vnoremap <Leader>y "+y
:nnoremap <Leader>p "+p

" Tabbing:
nnoremap <F2> :tabprevious<CR>
nnoremap <F3> :tabnext<CR> 

" NERDTree:
nnoremap <F5> :NERDTreeToggle<CR>

" ToggleTerm:
nnoremap <F6> :ToggleTerm<CR>

" COC:
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