# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set a fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;36m\]\u@\h\[\033[00m\]:\[\033[1;30m\]\w\[\033[00m\]\$ '
    #PS1="\e[44m\u\e[96m@\e[39m\h\e[49m:\e[95m\w\e[39m\e[1m\\$ \[$(tput sgr0)\]"
else
    PS1='\u@\h:\w\$ '
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

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set Xterm alias for X11 clipboard support
alias xterm="xterm -ls -xrm 'XTerm*selectToClipboard: true'"

# Enable sudo autocompletion
complete -cf sudo

# Add slash when autocompleting sym-linked dir
bind 'set mark-symlinked-directories on'

# Add ~/.local/bin to PATH
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Add ~/.local/scripts to PATH
if [ -d "$HOME/.local/scripts" ] ; then
    PATH="$HOME/.local/scripts:$PATH"
fi

# Add ~/.screenlayout to PATH
if [ -d "$HOME/.screenlayout/" ] ; then
    PATH="$HOME/.screenlayout:$PATH"
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
# THIS NEEDS TO BE AT THE END OF .bashrc
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

