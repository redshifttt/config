PS1="%B%F{blue}%c%f%b %# "

# man zshoptions
# setopt always_to_end
# setopt auto_remove_slash
# setopt complete_aliases

# Init
unsetopt global_rcs

# Completion
setopt autocd
setopt auto_menu
setopt list_types
setopt auto_param_slash

# History
setopt inc_append_history
setopt hist_find_no_dups
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS

# I/O
setopt correct

setopt pipe_fail

setopt posix_builtins

setopt zle
bindkey -v
