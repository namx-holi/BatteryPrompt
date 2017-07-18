batPrompt(){
	if [ "$1" == "off" ]; then
		PROMPT_COMMAND=''
		PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
	else
		PROMPT_COMMAND='BAT=`upower -i $(upower -e | grep "BAT") | grep -E "percentage" | sed "s/^.*:[ ]*//"`;\
		PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;31m\] "$BAT"\[\033[01;34m\] \w \$\[\033[00m\] ";'
	fi
}
