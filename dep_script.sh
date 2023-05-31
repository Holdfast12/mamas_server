#!/bin/bash

for prog in python firefox xorg-server xorg-xinit alsa-utils openbox i3-wm
do
pacman -Si $prog|sed -n '/Depends\ On/,/:/p'|sed '$d'|cut -d: -f2 | sed 's:^.::g' | sed 's:  :\n:g' > ./deps/$prog.txt
done
