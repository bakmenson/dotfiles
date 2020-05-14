#!/bin/sh

wget -q --spider https://google.com

if [ $? != 0 ]; then
	echo "<fc=#666666>| </fc><icon=/home/solus/.xmonad/xpm/connection.xpm/>"
fi
