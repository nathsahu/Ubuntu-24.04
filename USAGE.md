# Termux:X11-Setup
1. Download termux:X11 apk from [github](https://github.com/termux/termux-x11/releases/latest) and install
2. Install termux-x11 package in termux:

```bash
pkg update && pkg install x11-repo termux-x11-nightly -y
```

3. Allow external apps access in termux
```bash
sed -i s/'# allow-external-apps = true'/'allow-external-apps = true'/g ~/.termux/termux.properties
```

4. Start termux-x11 in termux and open ubuntu
```bash
termux-x11 :1
# Open another session and login to ubuntu
ubuntu --shared-tmp
```

5. Export DISPLAY and start desktop
```bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
# start desktop using commands in sections below
# to stop the desktops just use Ctrl+C 
```

- **XFCE**
```bash
dbus-launch xfce4-session
```
