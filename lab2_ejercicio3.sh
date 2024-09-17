#!/bin/bash

# Este script es del ejercicio 3 del lab2 Leonardo Vidal C18472

# Verificar si se recibio el ejecutable como parametro

if [ -z "$1" ]; then 
 
 echo "Uso: $0 <ruta del ejecutable>"
  
 exit 1

fi 

ejecutable=$1
log_fille="process_usage.log" 
gnuplot_fille="plot.gp"


# Ejecutar el binario en segundo plano y obtener su PID

$ejecutable &

pid=$!

# Verificar si el ejecutable comenzo correctamente 

if ! ps -p $pid >/dev/null; then

 echo "Error al iniciar el ejecutable."

 exit 1

fi

# Crear archivo de log y encabezado

echo "time cpu memory" > $log_file

# Funcion para monitorear CPU y memoria periodicamente

function monitor_process {
 while ps -p $pid > /dev/null; do 

  cpu_usage=$(ps -p $pid -o %cpu --no-headers) # Uso de CPU
  mem_usage=$(ps -p $pid -o %mem --no-headers) # Uso de memoria 
  timestamp=$(date +%s) # Timestamp

  echo "$timestamp $cpu_usage $mem_usage" >> $log_fille
  
  sleep 1 #Esperar 1 entre mediciones

done

}

# Ejecuccion la funcion de monitoreo 

monitor_process 

#Crear archivo de script para gnuplot

cat << EOF > $gnuplot_file
set terminal png size 800,600
set output 'process_usage_plot .png'
set title ' Monitoreo de CPU y Memoria'
set xlabel 'Tiempo (segundos)'
set ylabel 'Porcentaje de uso'
set key outside 
plot '$log_file' using 1:2 with line title 'CPU (%)', / '$log_file' using 1:3 with lines title 'Memoria (%)'
EOF

# Ejecutar gnuplot para generar la grafica

gnuplot $gnuplot_file

echo "Grafica generada: Process_usage_plot.png
