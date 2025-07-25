#!/bin/sh

# $1 must be '"lowSpeed"', '"middleSpeed"' or '"highSpeed"'.
# https://github.com/OpenWonderLabs/SwitchBotAPI

export DEVID=<<Switchbot Device ID>>

#### https://github.com/OpenWonderLabs/SwitchBotAPI
#### Effective commands ($1) below. Currently any parameter cannot be hanlded
# All home appliance types except Others
#	turnOn
#	turnOff
####
# TV, IPTV, Streamer, Set Top Box
#	volumeAdd
#	volumeSub
# 	channelAdd
#	channelSub
# DVD, Speaker
#	setMute
#	FastForward
#	Rewind
#	Next
#	Previous
#	Pause
#	Play
#	Stop
# Speaker
#       volumeAdd                                                                                                   #       volumeSub
# Fan
#	swing
#	timer
#	lowSpeed
#	middleSpeed
#	highSpeed
# Light
#	brightnessUp
#	brightnessDown

SWITCHBOT_API=https://api.switch-bot.com/v1.0

CWD=`dirname $0`

# SwitchbotSecrets.sh must have API_KEY
. $CWD/SwitchbotSecrets.sh

if [ x$1 != x ]; then
    RET=`curl --request POST "$SWITCHBOT_API/devices/$DEVID/commands" \
  --header "Authorization: $API_KEY" \
  --header "Content-Type: application/json; charset=utf8" \
  --data-raw "{	     
    \"command\": \"$1\"
  }" 2>/dev/null`
else
    curl --request GET "$SWITCHBOT_API/devices" \
  --header "Authorization: $API_KEY" \
  --header "Content-Type: application/json; charset=utf8"
fi

echo $RET | grep success 2>&1 /dev/null


