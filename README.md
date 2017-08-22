Tips for installing Antergos on Dell Chromebook 13
=======

Various scripts to simplify life in an Unix world

UEFI boot with Coreboot
------------

Boot a first time and EFI shell appears. Type reset and restart into a live cd where you have to mount EFI partition and then:

```
mv BOOT/BOOTX64.efi BOOT/BOOTX64.efiOLD
cp antergos_grub/grubx64.efi BOOT/BOOTX64.efi
```


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

https://extensions.gnome.org/extension/1267/no-title-bar/  [before installation type this ```sudo pacman -S xorg-xprop```]



Gnome theme
------------
```
yaourt gtk-theme-minwaita
```

Keyboard backlight
------------

https://wiki.archlinux.org/index.php/Keyboard_backlight

DNS
------------

Create a file named ``` /etc/resolv.conf.head ``` with this content:

```
# OpenNIC IPv4 nameservers (Worldwide Anycast)
nameserver 185.121.177.177
nameserver 185.121.177.53

# OpenNIC IPv6 nameservers (Worldwide Anycast)
nameserver 2a05:dfc7:5::53
nameserver 2a05:dfc7:5::5353
```



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
        Option "ClickTime" "0"
        Option "SingleTapTimeout" "0"
        #Option "AccelFactor" "0.0400"
        #Option "MinSpeed" "0.7"
        #Option "MaxSpeed" "1.3"
        Option "FastTaps" "1"
```

VimRC
------------
```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```
Source: https://github.com/amix/vimrc

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
In alternative you can set 

1. Set font scaling factor to 1.5
2. Set cursor size to 32 (with dconf-editor under org.gnome.desktop.interface)

Keyboard backlight
------------

Follow this wiki: https://wiki.archlinux.org/index.php/Keyboard_backlight

Fix tearing
------------

Fix tearing due to xrandr scaling creating the file ```/etc/X11/xorg.conf.d/20-intel.conf``` with this content 

```
Section "Device"
    Identifier "Intel Graphics"
    Driver "intel"
    Option "AccelMethod" "sna"
    Option "TearFree" "true"
EndSection
```


  
