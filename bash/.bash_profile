#########################
# sean's ~/.bash profile'#
#########################

export GOPATH="$HOME/.config/go"

# environment variables
export PATH="$PATH:/home/sean/bin:/home/sean/.local/bin:$GOPATH/bin"
export BROWSER="librewolf"
export EDITOR="nvim"
export TERMINAL="alacritty"
export TERM="xterm-256color"
export MANPAGER="nvim +Man!"
export LESS=" -R "

# XDG base directory and compliance
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export PROMPT_COMMAND='history -a'
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# ls colours
eval $(dircolors -b $HOME/.dircolors)

# Autorun startx
[[ -z "$DISPLAY" && "$XDG_VTNR" -eq 1 ]] && exec startx 1>/dev/null 2>&1
