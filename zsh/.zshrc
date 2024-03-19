export PS1="%B%F{#ffffff}%n%f%b@%F{magenta}%m%f %B%F{blue}%c%f%b %# "
export BROWSER="firefox"
export TERMINAL="alacritty"
export MANPAGER="nvim +Man!"
export MANWIDTH=80

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#111111,bold,underline,bg=#000000"
export FZF_DEFAULT_OPTS="--height=20 --layout=reverse"

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

source /usr/share/LS_COLORS/dircolors.sh
