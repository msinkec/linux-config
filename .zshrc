# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# autocompletion features
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES
zstyle ':completion::complete:*' gain-privileges 1

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000
HISTFILE=~/.cache/zfs/history

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# set a fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    PS1='%B%F{cyan}%n%f@%F{cyan}%M%f%b %F{#787878}%~%f %# '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# set Xterm alias for X11 clipboard support
alias xterm="xterm -ls -xrm 'XTerm*selectToClipboard: true'"

# Add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add ~/.local/scripts to PATH
if [ -d "$HOME/.local/scripts" ] ; then
    PATH="$HOME/.local/scripts:$PATH"
fi

## add aliases to various scripts that need this shells context
# conda enviroment
alias init-conda="source $HOME/.bash/init-conda"

# Add third party go tools (go PPA) to PATH
if [ -d "/usr/lib/go-1.11/bin" ] ; then
    PATH="/usr/lib/go-1.11/bin:$PATH"
fi

# Add go bins to PATH
if [ -d "$HOME/go/bin" ] ; then
    PATH="$HOME/go/bin:$PATH"
fi

# Use nvim
alias vim="nvim"

# Set default text editor
export EDITOR="nvim"
export VISUAL="nvim"

# Set feh to adjust image size to fit screen
alias feh="feh -."

# Reset NetworkManager
alias resnm="sudo systemctl restart NetworkManager"

# Fix for JetBrains IDE-s rendering issues with non-reparenting wm-s
export _JAVA_AWT_WM_NONREPARENTING=1

# Run tmux.
# NEEDS TO BE AT THE END OF THIS FILE
# we need to make sure that:  
#  (1) tmux exists on the system
#  (2) we're in an interactive shell
#  (3) tmux doesn't try to run within itself
if command -v tmux &> /dev/null && [ -n "$PS1" ] \
        && [[ ! "$TERM" =~ screen ]] \
        && [[ ! "$TERM" =~ tmux ]] \
        && [ -z "$TMUX" ]; then
    exec tmux
    exit 0  # After closing tmux session we want to exit the shell underneath too 
fi

