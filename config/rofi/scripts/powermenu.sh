#!/usr/bin/env bash

# Estilo general con márgenes internos y bordes redondeados
TEMA_BASE="window {width: 400px; padding: 16px; border-radius: 12px;} \
mainbox {padding: 0px;} \
listview {lines: 5; spacing: 6px; padding: 6px 0px;} \
element {padding: 8px 12px; border-radius: 9px;} \
element-text {vertical-align: 0.5;}"

# Función para solicitar confirmación en horizontal (Sí / No) con márgenes y bordes impecables
confirmar() {
    local accion="$1"
    local tema_confirm="window {width: 380px; padding: 16px; border-radius: 12px;} \
mainbox {padding: 0px;} \
listview {lines: 2; layout: horizontal; spacing: 10px; padding: 10px 0px;} \
element {padding: 8px 30px; border-radius: 8px;} \
element-text {horizontal-align: 0.5; vertical-align: 0.5;}"

    local respuesta=$(echo -e "Sí\nNo" | rofi -dmenu -i -p "¿Confirmar $accion?" -theme-str "$tema_confirm")
    [[ "$respuesta" == "Sí" ]]
}

# Opciones principales
opciones="󰐥 Apagar\n󰜉 Reiniciar\n󰍃 Cerrar Sesión\n󰏤 Suspender\n󰷛 Bloquear"

eleccion=$(echo -e "$opciones" | rofi -dmenu -i -p "Power" -theme-str "$TEMA_BASE")

case "$eleccion" in
    *Apagar)
        confirmar "Apagar" && systemctl poweroff ;;
    *Reiniciar)
        confirmar "Reiniciar" && systemctl reboot ;;
    *Cerrar*)
        confirmar "Cerrar Sesión" && i3-msg exit ;;
    *Suspender)
        confirmar "Suspender" && systemctl suspend ;;
    *Bloquear)
        confirmar "Bloquear" && (betterlockscreen -l blur || i3lock) ;;
esac
