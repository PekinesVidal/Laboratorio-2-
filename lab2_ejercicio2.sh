#!/bin/bash 

# Verificar que se recibieron el nombre del proceso y el comando a ejecutar

if [ -z "$1" ] || [ -z "$2"]; then 
 
 echo "Uso: $0 <nombre del proceso> <comando para ejecutar>"

 exit 1 

fi 


Process_name=$1

command=$2

#Funcion para verificar el estado del proceso 

function check_process {
 
 pgrep -x "$process_name" > /dev/null
 
 
 return $?
}

# Bucle infinito para Monitoriar el proceso 

while true; do 
 
 #Verificar si el proceso esta corriendo

 if check_process; then
  
  echo "El proceso '$process_name' esta corriendo."

 else 

  echo "El Proceso '$process_name' no esta corriendo. INICIANDO..."

  # Ejecutar el comando proporcionado para reiniciar el proceso

  $command &

  echo "Proceso '$process_name' reiniciando con PID $!"

 fi

 # Esperar 5 segundos antes de volver a verificar 

  sleep 5

done
 





