# Controling Switchbot IR devices 
This is a shell scripts to control Switchbot IR virttual devices which are connected via Switchbot Hub (mini).
The current version is designed to be simple, and only device commands can be post. A complex command having parameter(s) cannot be handled.

## Preparation
1. Download all files.
2. Edit the `SwitchbotSecrets.sh` file to replace the <<Switchbot API key>> words with your Switchbit API key.
   ([How to obtain API key](https://support.switch-bot.com/hc/ja/articles/12822710195351-トークンの取得方法))
4. run the command `./SwitchbitIR.sh` and you will get list of devices associated with device ID.
5. Edit SwitchbotIR.sh to have a correct device ID.

## How to use
Run the shell script as `./SwitchbitIR.sh <command>`.

## How to setup Home Assistant
Suppose that these shell scripts are stored `/config/www/shell_command/`,
here is an example of `configure.yaml` setting;
```
shell_command:
  ceilingfan_low: "/config/www/shell_command/SwitchbotIR.sh lowSpeed"
  ceilingfan_middle: "/config/www/shell_command/SwitchbotIR.sh middleSpeed"
  ceilingfan_high: "/config/www/shell_command/SwitchbotIR.sh highSpeed"
```
