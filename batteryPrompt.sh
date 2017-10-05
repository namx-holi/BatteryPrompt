##############
# niceprompt #
##############

# YOU CAN ADD THIS TO .bashrc OR SOMETHING, BUT IF YOU DO, READ
# THE LAST LINE PLEASE?

# declare defaults
__default_prompt__=$PS1
__default_name__="\u"

# the colours!
declare -a __colours__
__colours__=("1;31m" "1;33m" "1;32m" "1;34m" "1;36m" "1;35m")

# method that turns it on or off
niceprompt(){
    # leave this at -1 for the pretty rainbow that moves right.
    # can change this if you want though, but i personally
    # recommend -1
    coloursplit=-1

    # if the first argument is "--off", set the prompt to default
   	if [ "$1" == "--off" ]; then
		PROMPT_COMMAND=''
		PS1=$__default_prompt__

    # if theres text after calling niceprompt, but its not --off
    # set the name to whatever is entered
	elif [ "$@" != "" ]; then
		__count__="0"
		PROMPT_COMMAND='\
PS1="${debian_chroot:+($debian_chroot)}\
\[\033[${__colours__[$(((__count__+0*coloursplit)%6))]}\] [\t]\
\[\033[${__colours__[$(((__count__+1*coloursplit)%6))]}\] $@\
\[\033[${__colours__[$(((__count__+2*coloursplit)%6))]}\] \w\
\[\033[${__colours__[$(((__count__+3*coloursplit)%6))]}\] \$\
\[\033[00m\] ";__count__=$((__count__+1))'

    # if niceprompt is just called, turn it on but with default
    # name set
    else
		__count__="0"
		PROMPT_COMMAND='\
PS1="${debian_chroot:+($debian_chroot)}\
\[\033[${__colours__[$(((__count__+0*coloursplit)%6))]}\] [\t]\
\[\033[${__colours__[$(((__count__+1*coloursplit)%6))]}\] $__default_name__\
\[\033[${__colours__[$(((__count__+2*coloursplit)%6))]}\] \w\
\[\033[${__colours__[$(((__count__+3*coloursplit)%6))]}\] \$\
\[\033[00m\] ";__count__=$((__count__+1))'
	fi
}

# if you have added this to .bashrc or something and want to have
# niceprompt turned on from the start, uncomment this line. you can
# also change the name it sets it to rather than the default being
# whatever your username is
#niceprompt $__default_name__
