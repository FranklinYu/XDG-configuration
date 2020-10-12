# Notify completion of a command, with `ping-me`.
#
# Markdown is used to wrap the command as part of the message.
#
# Usage:
#
#     pm && some-command

function pm() {
	__report_next_completion=true
}

function __report_command_completion() {
	local return_value=$?
	if [ -z "$__report_next_completion" ]
	then return 0
	fi

	if ! command -v ping-me >/dev/null
	then >&2 echo '"ping-me" not found.'
	fi

	local cmd=`history -1 | sed 's/ *[0-9]* *//' | sed 's/pm *&& *//'`

	local status_verb=''
	if [[ return_value -eq 0 ]]
	then status_verb='succeeded'
	else status_verb="failed with status $return_value"
	fi

	local message
	if [[ ${#cmd} -lt 50 ]]
	then message=$(printf '`%s` %s' "$cmd" "$status_verb")
	else
		message=("following command $status_verb:" '' '```')
		message+=$cmd
		message+='```'
	fi

	local orig_ifs=$IFS
	IFS=$'\n'
	ping-me "$message"
	IFS=$orig_ifs
	unset __report_next_completion
}

add-zsh-hook precmd __report_command_completion
