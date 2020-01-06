PATH=~/.local/bin:"$PATH"

export CFLAGS='-Wall -Wextra -Wpedantic -Wshadow'
export CXXFLAGS='-Wall -Wextra -Wpedantic -Wshadow'
export TEX2PDF=latexmk
export TEX_CLEAN='latexmk -C'

# Java
export ANT_ARGS='-logger org.apache.tools.ant.listener.AnsiColorLogger'
export ANT_OPTS="-Dant.logger.defaults=$HOME/.config/java/ant-colors"

[ -f /usr/bin/lesspipe ] && eval `lesspipe`

#===============================================================================
# XDG standard #
#--------------#

export GNUPGHOME=~/.local/share/gnupg
export IRBRC=~/.config/irb/irbrc
export PYTHONDONTWRITEBYTECODE=true
export RLWRAP_HOME=~/.local/share/rlwrap
export CARGO_HOME=~/.local/share/cargo # Rust
export VAGRANT_HOME=~/.local/share/vagrant

# less
export LESSHISTFILE=~/.cache/less/history
export LESSKEY=~/.config/less/lesskey

# Node.js
export NODE_REPL_HISTORY=~/.cache/nodejs/repl_history
export NPM_CONFIG_USERCONFIG=~/.config/npm/config

if [ -f ~/.config/posix-sh/local-profile.sh ]
then source ~/.config/posix-sh/local-profile.sh
fi
