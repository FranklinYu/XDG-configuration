path=(~/.local/bin $path)

export CFLAGS='-Wall -Wextra -Wpedantic -Wshadow'
export CXXFLAGS='-Wall -Wextra -Wpedantic -Wshadow'
export TEX2PDF=latexmk
export TEX_CLEAN='latexmk -C'

# Java
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export ANT_OPTS="-Dant.logger.defaults=$HOME/.config/java/ant-colors"

#===============================================================================
# XDG standard #
#--------------#

export ANSIBLE_CONFIG=~/.config/ansible/ansible.cfg
export GNUPGHOME=~/.local/share/gnupg
export IRBRC=~/.config/irb/irbrc
export NODE_REPL_HISTORY=~/.local/share/nodejs/repl_history
export PYTHONDONTWRITEBYTECODE=true
export RLWRAP_HOME=~/.local/share/rlwrap
export CARGO_HOME=~/.local/share/cargo # Rust
export VAGRANT_HOME=~/.local/share/vagrant

# less
export LESSHISTFILE=~/.cache/less/history
export LESSKEY=~/.config/less/lesskey

[[ -f ~/.config/zsh/local-zprofile.zsh ]] && source ~/.config/zsh/local-zprofile.zsh
