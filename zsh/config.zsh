alias g=git
alias be='bundle exec'
alias ll='ls -l --human-readable'
alias la='ls --almost-all'

PROMPT='%F{blue}%~%f %(?.%F{green}.%F{red})%#%f '

bindkey '\e[5~' history-beginning-search-backward # PgUp
bindkey '\e[6~' history-beginning-search-forward # PgDn
bindkey '\e[3~' delete-char # Delete
bindkey '\e[H' beginning-of-line # Home
bindkey '\e[F' end-of-line # End

setopt hist_ignore_dups hist_ignore_space inc_append_history

[[ -f ~/.config/zsh/local-config.zsh ]] && source ~/.config/zsh/local-config.zsh
