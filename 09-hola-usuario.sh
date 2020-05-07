#!/bin/bash

#CREAREMOS UNA FUNCION PARA QUE NOS MUESTRE EL MENSAJE DE AYUDA

ayuda() {

cat << AYUDA
SYNTAXIS DEL COMANDO
	$0 NOMBRE_01 [NOMBRE_02] ... [NOMBRE_N]
DESCRIPCION
	Imprime en pantalla "Hola NOMBRE_1, NOMBRE_2, ..., NOMBRE_N" por pantalla
CODIGOS DE RETORNO
	1: ERROR =>  Si el número de parámetros es menor que 1
	2: ERROR =>  El usuario ingresado no esta conectado
AYUDA

}

#VERIFICAMOS QUE EL USUARIO HAYA INTRODUCIDO AL MENOS UN PARAMETRO
if [ $# -le 0 ]; then
	echo "Debes introducir mas de un parametro"
	ayuda
	exit 1
fi

#UTILIZAMOS LA VARIABLE MENSAJE PARA CONCATENAR LOS PARAMETROS
MENSAJE="Hola "
PRIMERO=1

#CON EL BUCLE RECORREMOS TODOS LOS PARAMETROS INTRODUCIDOS
while [ -n "$1" ]; do
	
	#UTILIZAMOS AHORA NUESTRO ARCHIVO USUARIO CONECTADO QUE NOS
	#VALIDA SI EL USUARIO ENVIADO ESTA CONECTADO Y LO GUARDA
	#EN USUARIO_CONECTADO
	USUARIO_CONECTADO=`./usuarioconectado.sh $1`
	#VALIDAMOS EL RESULTADO EN CASO SEA NEGATIVO
	#MANDAMOS EL MENSAJE DEL ERROR
	if [ "$USUARIO_CONECTADO" = "NO" ]; then
		echo "El usuario $1 no esta conectado"
		ayuda
		exit 2
	fi
	if [ $PRIMERO -eq 1 ]; then
		MENSAJE="$MENSAJE $1"
		PRIMERO=0
	else
		MENSAJE="$MENSAJE, $1"
	fi
	
	#PASAMOS AL SIGUIENTE REGISTRO
	shift
done

#MOSTRAMOS EL MENSAJE CONCATENADO EN CASO TODO SALGA BIEN
echo "$MENSAJE !"