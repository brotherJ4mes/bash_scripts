#!/bin/sh

# this script does nothing for now
# found a more ideal solution for monitor unlocks using gdbus (~/my_scripts/

case "$1" in
	pre)
	echo hi > /dev/null
	;;

	post)
	echo hi > /dev/null
	;;

esac
