
# alias
unalias la gcm
alias la='ls --almost-all' gcm='git commit --verbose -m' \
      gcam='git commit --all --verbose -m' gcob='git checkout -b' \
      gap='git add --patch' gds='git diff --staged' trall='tree -a -I .git'

# set tree color (double quotes because the output of `dircolors` contains
# single quotes)
eval "$(dircolors -b)"

# include the RVM script
source $HOME/.rvm/scripts/rvm
