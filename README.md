# Controling Switchbot IR devices 
This is a shell scripts to control Switchbot IR (Infra Red) virttual devices which are connected via Switchbot Hub (mini).
The current version is designed to be simple, and only device commands can be post. A complex command having parameter(s) cannot be handled.

## Usage
```
./SwitchbotIR.sh API-KEY [ DEV-ID COMMAND ]
```
The first usage is to pass `API_KEY` and `DEVICE_ID` to the script.  
Here is [how to get API_KEY](https://support.switch-bot.com/hc/ja/articles/12822710195351-トークンの取得方法).
List of Switchbot devices is output if `DEV-ID` and `COMMAND` are omitted. 
You can find your target device ID from the list.

## How to setup in Home Assistant
Supposed that the shell script is stored in the `/config/www/shell_command/` directory,
here is an example of `configure.yaml` setting;
```
shell_command:
  ceilingfan_low: !secrec switchbot_ceiling_fan_low
  ceilingfan_middle: !secrec switchbot_ceiling_fan_high
```
and the secrets.yaml file may contain below;
```
switchbot_ceiling_fan_low: "/config/www/shell_command/SwitchbotIR.sh <API-KEY> <DEV-ID> lowSpeed
switchbot_ceiling_fan_high: "/config/www/shell_command/SwitchbotIR.sh <API-KEY> <DEV-ID> highSpeed
```

## Switchbot Commands
You can find the list of commands from [SwitchBotAPI](https://github.com/OpenWonderLabs/SwitchBotAPI). 
