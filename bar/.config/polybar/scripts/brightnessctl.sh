#!/bin/bash
BRIGHTNESS_VALUE=`brightnessctl | grep -o "(.*" | tr -d "()"`
BRIGHTNESS_NR=${BRIGHTNESS_VALUE//%}

if [ $BRIGHTNESS_NR -lt 10 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 20 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 40 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 50 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 75 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 99 ]; then
	BRIGHTNESS_ICON=''
elif [ $BRIGHTNESS_NR -lt 105 ]; then
    BRIGHTNESS_ICON=''
else
	BRIGHTNESS_ICON=''
fi

echo "$BRIGHTNESS_ICON $BRIGHTNESS_VALUE"
