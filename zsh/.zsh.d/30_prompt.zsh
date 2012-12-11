# 30_prompt.zsh

# (we don't need no fancy themes)
if [[ -n $(who mom likes | awk '{print $5}' | tr -d '()') ]]; then
    PROMPT='%n@%m %2~%# '
else
    PROMPT='%2~%# '
fi

set_title() { # see ^1
    case $TERM in
        xterm*|rxvt*)
            print -Pn "\e]0;$PS1$1\a"
            ;;
    esac
}
precmd_functions+=(set_title)
set_title

# this is for emacs' ansi-term
if [[ $TERM == "eterm-color" ]]; then
    set_eterm_dir() {
        echo -e "\033AnSiTu $LOGNAME\n\033AnSiTc $PWD\n\033AnSiTh $HOST"
    }
    precmd_functions+=(set_eterm_dir)
    set_eterm_dir
fi

# ^1 Terminal title must be set before compinit or initial xterm title is not
# set (at least when using chpwd_functions).
