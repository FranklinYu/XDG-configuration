PATH=~/.local/bin:/opt/local/bin:/opt/local/sbin:"$PATH"
export MANPATH=~/.local/share/man:/opt/local/share/man:"$MANPATH"
export INFOPATH=~/.local/share/info:/opt/local/share/info:"$INFOPATH"

export CFLAGS='-Wall -Wextra -Wpedantic -Wshadow -Wcast-qual'
export CXXFLAGS='-Wall -Wextra -Wpedantic -Wshadow -Wcast-qual'
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
export GOPATH=~/.local/share/go
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
then . ~/.config/posix-sh/local-profile.sh
fi
