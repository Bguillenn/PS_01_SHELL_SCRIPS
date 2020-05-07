#!/bin/bash


#Utilizamos una condicional para verificar que almenos
#se haya enviado un parametro $# devuelve la cantidad
#de parametros mandados y -le es equivalente a <= entonces
#en caso de tener <= 0 parametros muestra un mensahe y termina
#el programa con codigo de error 1
if [ $# -le 0 ]; then
	echo "Debes ingresar al menos un parametro"
	exit 1
fi

echo "Hola $*!"
