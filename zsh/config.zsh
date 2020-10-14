if [ -f ~/.config/posix-sh/config.sh ]
then emulate sh -c 'source ~/.config/posix-sh/config.sh'
fi

PROMPT='%F{blue}%~%f %(?.%F{green}.%F{red})%#%f '
REPORTTIME=10
WORDCHARS=${WORDCHARS/\/}

bindkey '\e[5~' history-beginning-search-backward # PgUp
bindkey '\e[6~' history-beginning-search-forward # PgDn
bindkey '\e[3~' delete-char # Delete
bindkey '\e[H' beginning-of-line # Home
bindkey '\e[F' end-of-line # End
bindkey -M isearch '\e[5~' history-incremental-search-backward # PgUp
bindkey -M isearch '\e[6~' history-incremental-search-forward # PgDn

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

setopt hist_ignore_dups hist_ignore_space inc_append_history
autoload -Uz add-zsh-hook
source ~/.config/zsh/report-completion.zsh

function source-maybe() {
	if [ -f "$1" ]
	then source "$1"
	else return 1
	fi
}

function source-from-share() {
	source-maybe "/usr/share/$1" ||
		source-maybe "/usr/local/share/$1" ||
		source-maybe "/opt/local/share/$1"
}

function () {
	local ls_alias=$aliases[ls]
	unalias ls
	source-from-share chruby/chruby.sh
	alias ls="$ls_alias"
}
source-from-share chruby/auto.sh
add-zsh-hook -d preexec chruby_auto
add-zsh-hook precmd chruby_auto

source-from-share nvm/nvm.sh

if source-maybe /Applications/MacPorts/iTerm2.app/Contents/Resources/iterm2_shell_integration.zsh
then
	function __set-status-bar() {
		iterm2_set_user_var ruby_version ${RUBY_VERSION:-system}
		if command -v nvm > /dev/null
		then iterm2_set_user_var node_version `nvm version`
		fi
	}
	add-zsh-hook precmd __set-status-bar
fi

source-from-share zsh-autosuggestions/zsh-autosuggestions.zsh

source-maybe ~/.config/zsh/local-config.zsh
source-from-share zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
unfunction source-from-share source-maybe
