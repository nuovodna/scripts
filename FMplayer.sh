#!/bin/bash
# Bash Menu Script Example

PS3='Please enter your choice: '
options=("Rai RadioUno" "Rai RadioDue" "Rai RadioTre" "Quit")
select opt in "${options[@]}"
do
    case $opt in
	"Rai RadioUno")
        	mplayer -playlist http://www.listenlive.eu/rai1.m3u    	
		;;
        "Rai RadioDue")
		mplayer -playlist http://www.listenlive.eu/rai2.m3u
            	;;
        "Rai RadioTre")
	    	mplayer -playlist http://www.listenlive.eu/rai3.m3u
            	;;
        "Quit")
            	break
            	;;
        *) echo invalid option;;
    esac
done

