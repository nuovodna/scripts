Tips for installing Antergos on Dell Chromebook 13
=======

Various scripts to simplify life in an Unix world

Chromebook remap keys
------------
Install with yaourt an useful package on AUR:

```
yaourt xkeyboard-config-chromebook
```


Fix HDPi on Gnome
------------
1. Set factor for windows scaling in Gnome
  
    ```
      gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "[{'Gdk/WindowScalingFactor', <2>}]"
    ```
    
1. Autostart this script (put in ```~/.config/autostart/``` folder)

```
[Desktop Entry]
Name=Xrandr
Exec=/usr/bin/xrandr --output eDP1 --scale 1.25x1.25 --panning 2400x1350
Icon=system-run
Path=
Terminal=false
Type=Application
X-GNOME-Autostart-Delay=10
```

1. Fix tearing due to xrandr scaling creating the file ```/etc/X11/xorg.conf.d/20-intel.conf``` with this content 

```
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "AccelMethod" "sna"
    Option "TearFree" "true"
EndSection
```


  
