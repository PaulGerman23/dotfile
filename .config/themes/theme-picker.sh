#!/bin/bash
theme=$(find /home/sudoman/.config/themes -mindepth 1 -maxdepth 1 -type d -printf "%f\n" | rofi -dmenu -p "Selecciona Tema" -theme-str 'window {width: 300px;}')
if [ -n "$theme" ]; then
    cp /home/sudoman/.config/themes/$theme/polybar.ini /home/sudoman/.config/polybar/colors.ini
    cp /home/sudoman/.config/themes/$theme/alacritty.toml /home/sudoman/.config/alacritty/colors.toml
    touch /home/sudoman/.config/alacritty/alacritty.toml
    polybar-msg cmd restart
fi
