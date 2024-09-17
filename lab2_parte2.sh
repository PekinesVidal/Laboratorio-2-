#!/bin/bash

# Directorio que se va monitorear

DIR_TO_MONITOR="/home/user/monitor"

# Archivo de log 

LOF_FILE="/home/usuario/monitor_changes.log"

# Comando inotifywait para monitorear el directorio

inotify -m -r -e crate -e modify -e delete --format '%w%f %e %T' --timefmt '%Y-%m-%d %H:%M:%S' "$DIR_TO_MONITOR" | while read FILE EVENT TIME; do

 echo "$TIME - $EVENT en $FILE" >> "$LOG_FILE"

done 
