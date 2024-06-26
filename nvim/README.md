# Neovim

## Plugins

I use several plugins.

1. Plug for plugin manager.
2. NERDTree for File Explorer.
3. Startify for fancy welcome screen.
4. Vim powerline for fancy status bar.
5. COC for extension host.
6. Fuck-ton of themes, I use Gruvbox personally.
7. Small minor plugins such as gitsigns, vim-devicons, etc.

## Configurations

I've set up my editors to do several stuff.

1. Encoding is utf-8 (basic stuff).
2. In order to make C+P from outside WSL easier: set `clipboard+=unnamedplus`.
3. Basic features such as numbers, syntax, etc are enabled.
4. Auto-save is enabled by listening to `TextChanged` event, except if `filename` is empty, to avoid auto-saving Startify.
5. Auto-start NERDTree and Startify, set up basic stuff such as Airline, etc.
6. You can see `init.vim` for more info.

## Keybindings

Several keybindings are applied:

1. `A+[number]` for switching between tab.
2. `A-q` and `A-w` for cycling tab respectively.
3. `A-e` and `A-r` for closing and reopening a tab respectively.
4. `A-t` to switch to the last tab.
5. `F5` for opening and closing NERDTree.
6. `F6` for opening terminal.
7. `F7` for closing terminal.
