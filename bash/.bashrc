# ================
# sean's ~/bashrc
# ================

set -o pipefail

treset="\[$(tput sgr0)\]"
tdir_col="\[$(tput bold; tput setaf 4)\]"

# PS1
export PS1="${tdir_col}\W${treset} \\$ "

# bash history
HISTSIZE=
HISTFILESIZE=            # unlimited(?) history
HISTTIMEFORMAT="%F %T  " # command timestamp in history command

bind '"\t":menu-complete' # Tab: Cycle thru completion
# bind '"\C-k": "fkill\n"'
# bind '"\C-f": "fcd\n"'
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

# shopt options
shopt -s checkwinsize # check the window size after each command
shopt -s cdspell      # cd's into a dir if you spell at least 1 letter incorrectly

# aliases
if [[ -f /home/sean/.aliasrc ]]; then
    source /home/sean/.aliasrc
else
    printf "error: no bash aliases file found at /home/sean/.aliasrc"
fi

eval $(dircolors -b $HOME/.dircolors) # ls colours
