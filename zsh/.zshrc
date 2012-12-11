setopt appendhistory histignorealldups extendedglob nomatch notify promptsubst
setopt noautocd nobeep nobgnice
bindkey -v

HISTFILE=$HOME/.histfile
HISTSIZE=1024
SAVEHIST=1024

if [ -d $HOME/.zsh.d ]; then
    for f in $HOME/.zsh.d/*; do
        [ -x $f ] && source $f
    done;
    unset f
fi

source $HOME/.environ
