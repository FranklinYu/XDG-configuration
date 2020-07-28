fpath=(~/.local/share/zsh/site-functions $fpath
	/opt/local/share/zsh/site-functions)

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' prompt '# of errors: %e'
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/Users/franklinyu/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=1000000
setopt appendhistory
bindkey -e
# End of lines configured by zsh-newuser-install

# NOTE: don't edit this file manually; instead, use
#
#     autoload -Uz zsh-newuser-install && zsh-newuser-install -f

source ~/.config/zsh/config.zsh
