#!/bin/bash
# mPlayer script to play italian FM Radio

PS3='Please enter your choice: '
options=("Rai RadioUno" "Rai RadioDue" "Rai RadioTre" "Radio Capital" "Radio Deejay" "Radio Città Aperta" "Quit")
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
        "Radio Capital")
             	mplayer -playlist http://mp3.kataweb.it:8000/CAPITAL.m3u
                ;;
        "Radio Deejay")
             	mplayer -playlist http://mp3.kataweb.it:8000/RadioDeejay.m3u
                ;;
        "Radio Città Aperta")
             	mplayer -playlist http://stream.greynetweb.it/rca
                ;;
		"Quit")
            	break
            	;;
        *) echo invalid option;;
    esac
done

