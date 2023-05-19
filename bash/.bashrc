# ================
# sean's ~/bashrc
# ================

set -o pipefail

treset="\[$(tput sgr0)\]"
tdir_col="\[$(tput bold; tput setaf 4)\]"

# init
export PS1="${tdir_col}\W${treset} \\$ "

# git_branch_ps1(){
#     git branch 2>/dev/null 1>/dev/null
#     if [[ $? == 0 ]]; then
#         branch_name=$(git branch | awk '/^\*/ { print $NF }')
#         export PS1="${tdir_col}\W${treset} (${branch_name}) \\$ "
#     else
#         export PS1="${tdir_col}\W${treset} \\$ "
#     fi
# }
# export PROMPT_COMMAND=git_branch_ps1

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
