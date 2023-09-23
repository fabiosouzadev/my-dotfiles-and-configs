#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
            
	# Launch the bar
    if type "xrandr"; then
        for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            MONITOR=$m polybar -q main -c "$dir/$style/config.ini" &
        done
    else
	    polybar -q main -c "$dir/$style/config.ini" &
    fi
    # polybar -q main -c "$dir/$style/config.ini" &
    sleep 1
}

if [[ "$1" == "--one" ]]; then
	style="one"
	launch_bar

elif [[ "$1" == "--two" ]]; then
	style="two"
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
