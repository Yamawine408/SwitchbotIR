#!/bin/sh

# $1 must be '"lowSpeed"', '"middleSpeed"' or '"highSpeed"'.
# https://github.com/OpenWonderLabs/SwitchBotAPI

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
function usage() {
    echo 'Usage:'
    echo '    ' `basename $0` ' API-KEY [ DEV-ID COMMAND ]'
    echo '    ' `basename $0` ' -s SECRETS.sh [ COMMAND ]'
    exit 1
}

CWD=`dirname $0`
CMD=
if [ $# -eq 0 ]; then
    usage
else
    if [ $1 == '-s' ]; then
	if [ $# > 1 ]; then
	    . $CWD/$2
	    if [ x$APIKEY == x ]; then
		echo $2 does not have APIKEY 
	    fi
	    if [ x$DEVID == x ]; then
		echo $2 does not have DEVID
	    fi
	    if [ $# > 2 ]; then
		CMD=$3
	    fi
	else
	    usage
	fi
    elif [ $1 == '-h' ]; then
	usage
    elif [ $1 == '-u' ]; then
	usage
    elif [ $1 == '-help' ]; then
	usage
    elif [ $1 == '-usage' ]; then
	usage
    else
	APIKEY=$1
	if [ $# -gt 2 ]; then
	    DEVID=$2
	    CMD=$3
	fi
    fi
fi

echo APIKEY=$APIKEY >> $CWD/IR.log
echo DEVID=$DEVID >> $CWD/IR.log
echo CMD=$CMD >> $CWD/IR.log

if [ x$CMD != x ]; then
    RET=`curl --request POST "$SWITCHBOT_API/devices/$DEVID/commands" \
  --header "Authorization: $APIKEY" \
  --header "Content-Type: application/json; charset=utf8" \
  --data-raw "{	     
    \"command\": \"$CMD\"
  }" 2>/dev/null`
    echo $RET | grep success 2>&1 /dev/null
else
    curl --request GET "$SWITCHBOT_API/devices" \
  --header "Authorization: $APIKEY" \
  --header "Content-Type: application/json; charset=utf8"
fi
exit 0
