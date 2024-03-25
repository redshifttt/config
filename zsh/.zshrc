export PS1="%B%F{#ffffff}%n%f%b@%F{magenta}%m%f %B%F{blue}%c%f%b %# "
export BROWSER="firefox"
export TERMINAL="alacritty"
export MANPAGER="nvim +Man!"
export MANWIDTH=80

export FZF_DEFAULT_OPTS="--height=20 --layout=reverse"

path+=('/home/sean/.local/bin')
fpath=(/usr/share/zsh/site-functions $fpath)

bindkey '^I' complete-word
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^Y' autosuggest-accept
bindkey -r "^F"
bindkey -s '^F' "fcd"

alias grep="grep --color=auto"
alias lsblk="lsblk -o \"NAME,FSTYPE,FSAVAIL,FSUSE%,SIZE,TYPE,MOUNTPOINT\" -p"
alias ls="lsd -lhF --group-dirs first --date relative --icon never"
alias cat="bat --pager=never"
alias mkdir="mkdir -pv"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"

alias soda="ssh -p 52222 num@soda.privatevoid.net"
alias ncdu="ncdu --color off"
alias ytdl="yt-dlp"
alias ytba="yt-dlp -f bestaudio"
alias ytmp3="yt-dlp -x --extract-audio --audio-format mp3"

fcd() {
    cd "$(bfs $HOME -type d -nocolor 2>/dev/null | fzf --height=40% --reverse)"
}

source /usr/share/LS_COLORS/dircolors.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
