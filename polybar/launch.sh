#!/usr/bin/env bash

POLYBAR_DIR="$HOME/.config/polybar"
THEME=""

launch_bar() {
	
    # Terminate already running bar instances
	killall -q polybar

    # Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    # Launch new polybar(s)                                                            
    if type "xrandr"; then                                                             
        IFS=$'\n'  # must set internal field separator to avoid dumb                   
        for entry in $(xrandr --query | grep " connected"); do                         
            mon=$(cut -d" " -f1 <<< "$entry")                                          
            status=$(cut -d" " -f3 <<< "$entry")                                       
                                                                                       
            tray_pos=""                                                                
            if [ "$status" == "primary" ]; then                                        
                tray_pos="right"                                                       
            fi                                                                         
                                                                                       
            MONITOR=$mon TRAY_POS=$tray_pos polybar -r -c "$POLYBAR_DIR/$THEME/config.ini" -q main 2>&1 | tee -a /tmp/polybar-monitor-"$mon".log & disown
            #sleep 1
        done                                                                          
        unset IFS  # avoid mega dumb by resetting the IFS                              
    else                                                                               
        polybar -r -c "$POLYBAR_DIR/$THEME/config.ini" -q main 2>&1 | tee -a /tmp/polybar.log & disown                      
    fi
}

if [[ "$1" == "--one" ]]; then
	THEME="one"
	launch_bar

elif [[ "$1" == "--two" ]]; then
	THEME="two"
	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme
		
	Available Themes :
	 --one    --two
	# --blocks    --colorblocks    --cuts      --docky
	# --forest    --grayblocks     --hack      --material
	# --panels    --pwidgets       --shades    --shapes
	EOF
fi
