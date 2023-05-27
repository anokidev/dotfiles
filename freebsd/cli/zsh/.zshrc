# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"


## PLUGINS :

plugins=(
		git
		zsh-autosuggestions
		zsh-syntax-highlighting
)

## THEME SETTINGS :

# ORDER :
SPACESHIP_PROMPT_ORDER=(
  user
	host
  time     
  dir
  git
  node
  ruby
  xcode
  swift
  golang
  docker
  venv
  pyenv
  char
)

# OPTIONS :
SPACESHIP_PROMPT_ADD_NEWLINE=true

# USER :
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SUFFIX=" at "
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR="red"

# CHAR :
SPACESHIP_CHAR_SYMBOL=":\n> "
SPACESHIP_CHAR_COLOR_SUCCESS="green"

# HOST :
SPACESHIP_HOST_PREFIX=""
SPACESHIP_HOST_SUFFIX=" "
SPACESHIP_HOST_SHOW=always
SPACESHIP_HOST_SHOW_FULL=always
SPACESHIP_HOST_COLOR="red"

# DIR :
SPACESHIP_DIR_PREFIX='| '

# TIME :
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX="| "

# GIT :
SPACESHIP_GIT_PREFIX='| Git : '
SPACESHIP_GIT_SUFFIX=" "
SPACESHIP_GIT_BRANCH_SUFFIX=""
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""

# NODE :
SPACESHIP_NODE_PREFIX="Node : "
SPACESHIP_NODE_SUFFIX=" "
SPACESHIP_NODE_SYMBOL=""

# RUBY
SPACESHIP_RUBY_PREFIX="Ruby : "
SPACESHIP_RUBY_SUFFIX=" "
SPACESHIP_RUBY_SYMBOL=""

# SWIFT
SPACESHIP_SWIFT_PREFIX=" Swift : "
SPACESHIP_SWIFT_SUFFIX=" "
SPACESHIP_SWIFT_SYMBOL=""

# GOLANG
SPACESHIP_GOLANG_PREFIX="Go : "
SPACESHIP_GOLANG_SUFFIX=" "
SPACESHIP_GOLANG_SYMBOL=""

# DOCKER
SPACESHIP_DOCKER_PREFIX="Docker : "
SPACESHIP_DOCKER_SUFFIX=" "
SPACESHIP_DOCKER_SYMBOL=""

# VENV
SPACESHIP_VENV_PREFIX="Venv : "
SPACESHIP_VENV_SUFFIX=" "

# PYENV
SPACESHIP_PYENV_PREFIX="Python : "
SPACESHIP_PYENV_SUFFIX=" "
SPACESHIP_PYENV_SYMBOL=""

source $ZSH/oh-my-zsh.sh

echo ""

# Colorscript.
colorscript -e six

echo ""

uname -a

EDITOR=nvim;   																										export EDITOR
PAGER=less;  	  																									export PAGER
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin export PATH

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; 																									export ENV
