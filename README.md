Tips for installing Antergos on Dell Chromebook 13
=======

Various scripts to simplify life in an Unix world

Replace LightDM with GdM
------------

```
sudo pacman -S gdm
sudo systemctl disable lightdm && sudo systemctl enable gdm
```

Gnome Extensions
------------
https://extensions.gnome.org/extension/945/cpu-power-manager/

https://extensions.gnome.org/extension/723/pixel-saver/

https://extensions.gnome.org/extension/307/dash-to-dock/

Gnome theme
------------
```
yaourt gtk-theme-minwaita
```

Keyboard backlight
------------

https://wiki.archlinux.org/index.php/Keyboard_backlight

Synaptics
------------
```
        Option "VertEdgeScroll" "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizEdgeScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option "CircularScrolling" "on"
        Option "CircScrollTrigger" "2"
        Option "EmulateTwoFingerMinZ" "40"
        Option "EmulateTwoFingerMinW" "8"
        Option "CoastingSpeed" "0"
        Option "FingerLow" "30"
        Option "FingerHigh" "50"
        Option "MaxTapTime" "125"
    Option      "VertScrollDelta"          "-111"
    Option      "HorizScrollDelta"         "-111"
```

VimRC
------------
https://github.com/amix/vimrc

Chromebook remap keys
------------
Install with yaourt an useful package on AUR:

```
gpg --recv-keys 0661D98FC933A145
gpg --edit-key 0661D98FC933A145
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


Fix tearing
------------

1. Fix tearing due to xrandr scaling creating the file ```/etc/X11/xorg.conf.d/20-intel.conf``` with this content 

```
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "AccelMethod" "sna"
    Option "TearFree" "true"
EndSection
```


  
