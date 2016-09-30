# The following lines were added by compinstall
autoload -Uz compinit
compinit
# End of lines added by compinstall

# allow added functionality such as ^ to negate patterns.
setopt extendedglob
## History related:
HISTFILE=~/.histfile
HISTSIZE=9999999999
SAVEHIST=9999999999
# Append to the history file instead of writing to it between shells.
setopt appendhistory
# Save history right away instead of waiting till exit.
setopt share_history

# Add aliases:
source $HOME/.aliases

export EDITOR='vim'
# Let cd=pushd
setopt AUTO_PUSHD

# Print current time then current directory then prompt:
#PS1='%* %. %% '
#PS1="$ "
autoload -Uz promptinit
promptinit
prompt oliver

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable current directory tracking from within multi-term in Emacs
if [ -n "$INSIDE_EMACS" ]; then
  chpwd() { print -P "\033AnSiTc %d" }
  print -P "\033AnSiTu %n"
  print -P "\033AnSiTc %d"
fi

if [ -f $HOME/.workzshrc ]; then
  # add any work related items:
  source $HOME/.workzshrc
fi

# Go related:
export GOROOT=/usr/lib/go
export GOPATH=$HOME/src/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
