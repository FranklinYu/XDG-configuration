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

function __report-command-completion() {
	local return_value=$status
	if [[ -z $__report_next_completion ]]
	then return 0
	fi

	local cmd=`history -1 | sed 's/ *[0-9]* *//' | sed 's/pm *&& *//'`
	ping-me --command $cmd --code $return_value
	unset __report_next_completion
}

add-zsh-hook precmd __report-command-completion
