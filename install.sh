#!/usr/bin/env bash

echo "Restaurando configuraciones de i3wm..."

# Crear carpeta de configuración si no existe
mkdir -p ~/.config

# Copiar configuraciones
cp -r config/i3 ~/.config/
cp -r config/rofi ~/.config/
cp -r config/polybar ~/.config/
cp bashrc ~/.bashrc

# Dar permisos de ejecución a los scripts
chmod +x ~/.config/rofi/scripts/*.sh 2>/dev/null

echo "¡Dotfiles instalados correctamente!"
