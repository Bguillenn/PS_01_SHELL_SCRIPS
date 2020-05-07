#! /bin/bash

#Realizmos la validacion de haber ingresado minimo un parametro
if [ $# -le 0 ]; then
	echo "Debe ingresar al menos un parametro"
	exit 1
fi

#Crearemos una variable MENSAJE en la cual concatenaremos los
#demas parametros separados por comas

MENSAJE="Hola "

#UNA VARIABLE LLAMADA PRIMERO PARA COMPROBAR SI ES EL PRIMER
#PARAMETRO EN CONCATENAR Y NO PONERLE COMA
PRIMERO=1

#REALIZAMOS UN BUCLE PARA IR RECORRIENDO CADA UNO DE LOS
#PARAMETROS CON EL COMANDO -N PARA VALIDAR SI LO QUE ESTA EN EL
#PARAMETRO ES VACIO
while [ -n "$1" ]; do

	#UN IF CON LA VARIABLE PRIMERO PARA VER SI ES EL PRIMER PARAMETRO
	#INGRESADO
	if [ "$PRIMERO" -eq 1 ]; then
		MENSAJE="$MENSAJE $1"
		PRIMERO=0
	else
		MENSAJE="$MENSAJE, $1"
	fi

	#PARA AVANZAR AL SIGUIENTE PARAMETRO
	shift
done

#POR ULTIMO IMPRIMIMOS EL MENSAJE CON TODOS LOS PARAMETROS CONCATENADOS
echo "$MENSAJE !"
