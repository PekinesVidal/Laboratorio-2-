#!/bin/bash

# Este es el ejericio 1 del laboratorio 2 

# Elaborado por Leonardo Vidal Alfaro C18472

# Verificar que se recibio el PID como argunmento 

if [ -z "$1" ]; then 
 
 echo "Uso: $0 <PID>"

 exit 1 

fi 

pid=$1


# parte 2 Verificar el proceso si existe 

if ! ps -p $pid > /dev/null 2>&1; then 

 echo "El proceso con $pid no existe."

 exit 1 

fi 

# Nombre del proceso 
process_name=$(ps -p $pid -o comm=)

# ID del proceso 

process_id=$pid

# Parent Process ID (PPID)

ppid=$(ps -p $pid -o ppid=)

# Usuario Propetiario 

user=$(ps -p $pid -o %cpu=)

# Porcentaje de CPU 

cpu_usage=$(ps -p $pid -o %cpu=)

#Consumo de Memoria 

mem_usage=$(ps -p $pid -o mem=)

#Estado (status)

status=$(ps -p $pid -o stat=)

# Path 

exe_path=$(readlink -f /proc/$pid/exe)

# Mostrar la informacion obtenida

echo "Informacion del proceso con PID $pid:"
echo " Nombre del proceso: $process_name"
echo " ID del proceso: $process_id"
echo " Parent Process ID (PPID): $ppid"
echo " Usuario Propetario: $user" 
echo " Porcentaje de uso de CPU: $cpu_usage%"
echo " Consumo de memoria: $mem_usage"
echo " Estado: $status"
echo " Path: $exe_path"















