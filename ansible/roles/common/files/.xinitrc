#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
xrandr -s 1440x900 &
export QT_QPA_PLATFORM="xcb" &
amixer sset Master unmute &
amixer sset Master 100% &
telegram-desktop &
firefox &
exec openbox-session
