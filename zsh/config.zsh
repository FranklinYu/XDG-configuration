if [ -f ~/.config/posix-sh/config.sh ]
then emulate sh -c 'source ~/.config/posix-sh/config.sh'
fi

PROMPT='%F{blue}%~%f %(?.%F{green}.%F{red})%#%f '

bindkey '\e[5~' history-beginning-search-backward # PgUp
bindkey '\e[6~' history-beginning-search-forward # PgDn
bindkey '\e[3~' delete-char # Delete
bindkey '\e[H' beginning-of-line # Home
bindkey '\e[F' end-of-line # End

setopt hist_ignore_dups hist_ignore_space inc_append_history

source_maybe() {
	if [ -f "$1" ]
	then source "$1"
	else return 1
	fi
}

source_from_share() {
	source_maybe "/usr/share/$1" ||
		source_maybe "/usr/local/share/$1" ||
		source_maybe "/opt/local/share/$1"
}

source_from_share zsh-autosuggestions/zsh-autosuggestions.zsh

source_maybe ~/.config/zsh/local-config.zsh

source_from_share chruby/chruby.sh
source_from_share chruby/auto.sh
source_from_share zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
