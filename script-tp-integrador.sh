# Escribir un script que muestre un menu y haga lo siguiente:
#     1) Mostrar cantidad de elementos de la sucesion Fibonacci.
#     2) Pedir un numero entero y mostrar por pantalla ese numero en forma invertida.
#     3) Pedir una cadena de caracteres y evaluar si es un palindromo o no.
#     4) Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene.
#     5) Pedir el ingreso de 5 numero enteros y mostrarlos por pantalla en forma ordenada
#     6) Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene.
#     7) Salir (Saludando al usuario que ejecuto el programa).
# Si se presiona otra tecla, mostrar "Opcion incorrecta".

#!/bin/bash

# ---------- FUNCIONES ---------- #
function mostrar_menu(){
    clear
    echo "1) Mostrar cantidad de elementos sucesion Fibonacci"
    echo "2) Pedir un numero entero y mostrar por pantalla ese numero en forma invertida"
    echo "3) Pedir una cadena de caracteres y evaluar si es palindromo o no"
    echo "4) Pedir el path a un archivo de texto y mostrar por pantalla la cantidad de lineas que tiene"
    echo "5) Pedir el ingreso de 5 numero enteros y mostrarlos por pantalla en forma ordenada"
    echo "6) Pedir el path a un directorio y mostrar por pantalla cuantos archivos de cada tipo contiene"
    echo "7) Salir"
    echo "-------------------------------------------------------------"
}

function salir_saludando(){
    NOMBRE=$1 # Guardo el parametro nro. 1 que recibe la function
    echo "Chau $NOMBRE"
    sleep 2
}

# ---------------------------- PROGRAMA PRINCIPAL ---------------------------- #
OPCION=0
mostrar_menu
while true; do
    read -p "Ingrese una opcion: " OPCION # Mensaje y read en la misma linea
    case $OPCION in
        1)  # Program for Fibonacci 
            # Serie
            echo "Ingrese un numero: "
            read N
            a=0
            b=1
            cont=0
            for (( i=0; i<N; i++  ))
            do
            echo -n "$a "
            fn=$((a + b)) 
            a=$b 
            b=$fn 
            cont=$((cont + 1))
            echo $cont
            done 
            echo "cantidad de elementos:" $cont  ;;
      2)

        echo "Ingrese un Numero"

            read input
            reverse=""

         len=${#input}
         for (( i=$len-1; i>=0; i-- ))
         do
         reverse="$reverse${input:$i:1}"
         done

         echo "$reverse";;

        3)  
            LEN=0
            I=1
            read -p "Ingrese una cadena de caracteres: " STR
            LEN=`echo $STR | wc -m`
            LEN=`expr $LEN - 1`
            if [ ! $LEN -eq 0 ]; then
                MITAD=`expr $LEN / 2`
                while [ $I -le $MITAD ]; do
                   C1=`echo $STR|cut -c$I`
                   C2=`echo $STR|cut -c$LEN`
                        I=`expr $I + 1`
                        LEN=`expr $LEN - 1`
                done

               if [ $C1 != $C2 ]; then
               echo "no es un palidormo"
               elif [ $C1 = $C2 ]; then
               echo "es un palidormo"
               fi

            else
             echo "La cadena es incorrecta"
            fi
                 ;;





        4) read -p " ingrese la ruta del archivo en cuestion: "  A
            echo "Cantidad de lineas del archivo"
            wc -l $A
            ;;

        5) echo "Ingrese 5 Numeros Enteros"
          read -p "Primero: " n1
          read -p "Segundo: " n2
          read -p "Tercero: " n3
          read -p "Cuarto: "  n4
          read -p "Quinto: "  n5
          echo "$n1,$n2,$n3,$n4,$n5" | tr ',' '\n' | sort -n
          ;;

        6) read -p "ingrese el PATH del directorio en cuestion " RUTA
          echo "Cantidad de DIRECTORIOS: "
          find $RUTA -type d | wc -l
          echo "Cantidad de ARCHIVOS: "
          find $RUTA -type f | wc -l
          echo "Cantidad de LINKS: "
          find $RUTA -type l | wc -l
          echo "Cantidad de PIPES: "
          find $RUTA -type p | wc -l
          echo "Cantidad de BLOCK: "
          find $RUTA -type b | wc -l
          echo "Cantidad de CHARACTER: "
          find $RUTA -type c | wc -l
             ;;

        7)  salir_saludando `whoami` # Ejecuto whoami y lo paso como parametro
            break;;

        *)  echo "Opcion incorrecta";;
    esac
done
exit 0
