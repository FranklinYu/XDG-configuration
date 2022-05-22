alias be='bundle exec' g=git grep='grep --color' ping='ping -c 10'
alias docker-shell='docker run --rm --interactive --tty --volume "$PWD:/docker"'

# aliases related to the directory stack
alias pu=pushd po=popd d='dirs -v'

# When the “LESS” environment variable is unset, Git sets it to FRX;
# https://git-scm.com/docs/git-config/2.31.1#Documentation/git-config.txt-corepager
# Therefore, an alias is used instead of setting the environment variable, to
# make use of this default setting.
alias less='less --LINE-NUMBERS --LONG-PROMPT'

# Trigger the Pathname Expansion with a subshell, matching Vim 8.x.
alias vless=$(echo /usr/share/vim/vim8?/macros/less.sh)

if command -v lsb_release >/dev/null && [ "`lsb_release --id --short`" = Debian ]
then
	alias fd=fdfind
	if command -v batcat >/dev/null
	then alias bat=batcat cat='bat --style=plain'
	fi
elif command -v bat >/dev/null
then alias cat='bat --style=plain'
fi

if ! command -v octave >/dev/null && command -v docker >/dev/null
then alias octave='docker-shell franklinyu/octave'
fi

if [ "`uname`" = Darwin ]
then
	alias cp='cp -v' mv='mv -v' rm='rm -v'
	alias ln='ln -v' mkdir='mkdir -v'
	alias chown='chown -v' chmod='chmod -vv'
	alias ps='ps -T'
else
	alias cp='cp --verbose' mv='mv --verbose' rm='rm --verbose'
	alias ln='ln --verbose' mkdir='mkdir --verbose'
	alias chown='chown --verbose' chmod='chmod --verbose'
fi

# https://unix.stackexchange.com/questions/623725/does-posix-specify-whether-to-continue-script-when-nested-dot-fails
source_maybe() {
	if [ -f "$1" ]
	then . "$1"
	else return 1
	fi
}

source_maybe ~/.config/posix-sh/local-config.sh

unset -f source_maybe
