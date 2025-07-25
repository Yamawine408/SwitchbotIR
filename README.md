# Controling Switchbot IR devices 
This is a shell scripts to control Switchbot IR (Infra Red) virttual devices which are connected via Switchbot Hub (mini).
The current version is designed to be simple, and only device commands can be post. A complex command having parameter(s) cannot be handled.

## Usage
```
./SwitchbotIR.sh API-KEY [ DEV-ID COMMAND ]
./SwitchbotIR.sh -s SECRETS.sh [ COMMAND ]
```

The first usage is to pass `API_KEY` and `DEVICE_ID` to the script. The second usage is to have a secret file containing 
the `API_KEY` and `DEVICE ID`.  The `SwitchbotSecret.sh` file in this repository is the skelton of this file. 
This file is supposed to be located at the same directory as of the `SwitchbotIR.sh` file.
In both cases, list of Switchbot devices is output if `COMMAND` is omitted. 
This is useful when `DEVICE ID` of your Switchbot IR device is unknow.

Here is [how to get API_KEY](https://support.switch-bot.com/hc/ja/articles/12822710195351-トークンの取得方法).

## How to setup Home Assistant
Suppose that these shell scripts are stored `/config/www/shell_command/`,
here is an example of `configure.yaml` setting;
```
shell_command:
  ceilingfan_low: "/config/www/shell_command/SwitchbotIR.sh switchbot_api switchbot-device lowSpeed"
  ceilingfan_middle: "/config/www/shell_command/SwitchbotIR.sh -s SwitchbotSecret.sh highSpeed"
```
and the secret.yaml file.
```
switchbot_api: "a*************7"
switchbot_device: "0****************2"
```

## Switchbot Commands
You can find the list of commands from [SwitchBotAPI](https://github.com/OpenWonderLabs/SwitchBotAPI). 
