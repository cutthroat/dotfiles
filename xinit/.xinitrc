#!/bin/sh -e
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -f $HOME/.Xresources ]; then
  xrdb -merge $HOME/.Xresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# Fonts
xset +fp /usr/share/fonts/local

# Keys
. $HOME/.xkbmap

# Default terminal for i3-wm
export TERMINAL=urxvt

# GTK2
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# WM
exec i3
