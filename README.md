# How to disable MagSafe LED

## **Incompatibility** with [battery](https://github.com/actuallymentor/battery)
Battery seems to be constantly turning the LED on, so if you have it installed your LED will be blinking.

## Configure
Just run the configure.sh script
```bash
$ chmod +x configure.sh
$ sudo ./configure.sh $HOME
```
## Run a daemon that turns it off
My approach is pretty simple, just run a daemon every 10 seconds that turns the LED off.

## Using smc from [battery](https://github.com/actuallymentor/battery)
I just use [**battery**](https://github.com/actuallymentor/battery)'s smc command to turn the LED off. I don't know if I can provide it here, but here it is.

## Run interval
You can modify the interval by changing the .plist, now its 10 seconds
```plist
<key>StartInterval</key>
<integer>10</integer>
```
