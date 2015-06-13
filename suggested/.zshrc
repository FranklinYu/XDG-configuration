
# alias
unalias la gc gca
alias la='ls -A' gc='git commit' gcm='git commit -m' gca='git commit -a' gcam='git commit -am' gcob='git checkout -b' gap='git add --patch'

# set tree color (double quotes because the output of `dircolors` contains single quotes)
eval "$(dircolors -b)"
