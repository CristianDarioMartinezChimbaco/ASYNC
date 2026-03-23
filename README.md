# ASYNC (Esto fue hecho en linux, se recomienda usar en mismo SO Ubuntu 24.04 lts)

# Requisitos de Entorno de Desarrollo

## Windows
### GnuCOBOL
- https://gnucobol.sourceforge.io/
- https://sourceforge.net/projects/gnucobol/files/
### SBCL (Common Lisp)
- https://www.sbcl.org/platform-table.html
### Java JDK (OpenJDK recomendado)
- https://adoptium.net/
- https://www.oracle.com/java/technologies/downloads/
### g++ (MinGW-w64)
- https://www.mingw-w64.org/
- https://winlibs.com/

---

## Linux (Debian/Ubuntu)

### GnuCOBOL
```bash
sudo apt update
sudo apt install gnucobol
```
### SBCL Common Lisp
```bash
sudo apt install sbcl
```
### Java JDK
```bash
sudo apt install openjdk-17-jdk
```
### g++ (GCC)
```bash
sudo apt install g++
```

---

## 1. Ejercicio a desarrollar:
Objetivo: Dividir una lista de números en dos partes y calcular la suma de cada parte en paralelo usando async y finish.
Generar una lista de 1000 números enteros aleatorios entre 0 y 9999.
Partir la lista en 4 sublistas, una de pares entre 0 y 4999 y la otra entre 5000 y 9999, las otras dos similaes pero de números impares.
Calcular la suma de cada sublista en tareas independientes.
Mostrar la suma total al final.

### Solución: 
#### Requisitos para compilar y ejecutar este programa:
- [GnuCobol](https://gnucobol.sourceforge.io/) 
- C ++
Este desarrollo se realizo en LISP bajo el nombre ASYNC.lisp para ejecutarlo debe hacer uso de ***Common-lisp***, con el siguiente comando interpreta y ejecuta el programa (*recuerde estar en el directorio del mismo programa TALLER_1*):
#### Linux y Windows
```bash
sbcl --script ASYNC.lisp 
sbcl --script NO_ASYNC.lisp 
```
En su defecto puede usar un [interprete Online](https://onecompiler.com/commonlisp/44fkwuf6k). 
#### Resultado
Haciendo el proceso de manera secuencial se obtubo:

![image1](images/image1.png)

Haciendo el proceso con hilos:

![image1](images/image2.png)

---

## 2.1. Caso práctico: 
Supongamos que una empresa de retail quiere analizar los datos de ventas de 5 millones de transacciones para identificar:
- Total de ventas.
- Número de clientes únicos.
- Producto más vendido.

### Trabajo a desarrollar:
Implementar una solución en Java utilizando el Framework Fork/Join o otro lenguage de su gusto.
Dividir el dataset en partes y procesar en paralelo.
Comparar los tiempos de ejecución entre:

- Versión secuencial.
- Versión paralela con Fork/Join.
### Solución:
Debido a que COBOL no tiene hilos como tal, se uso tambien c++, c++ se encarga de ejecutar usando hilos los programas COBOL.
Para ejecutar este programa funcionaria en linux ya que el programa en c++ ejecuta comando directo en la terminal linux, de igual manera validar en macOS, en el mismo directirio usar para compilar y ejecutar:

#### Linux
```bash
g++ MAIN.cpp -o MAIN
./MAIN
g++ MAIN.cpp -o MAIN_2
./MAIN_2
```
#### Windows
```bash
g++ MAIN.cpp -o MAIN.exe
MAIN.exe
g++ MAIN.cpp -o MAIN_2.exe
MAIN_2.exe
```
#### Resultado
Haciendo el proceso con hilos:

![image1](images/image3.png)

Haciendo el proceso de manera secuencial se obtubo:

![image1](images/image4.png)

---

## 2.2. Desarrolle los siguientes temas de algoritmos de ordenación (trabajo de investigación en clase)
- Por qué los algoritmos de ordenación son importantes
- Compensaciones de los algoritmos de ordenación
- Cuales son los algoritmos de ordenación comunes (Minimo 10)
- Clasificación de un algoritmo de ordenación (Definicion de cada uno)
- Desarrollar Bucket Sort (Ordenación de cubo) con ejemplo en código de programacion
- Desarrollar Counting Sort (Ordenación de conteo) con ejemplo en código de programacion
- Desarrollar Insertion Sort (Ordenación de inserción)
- Desarrollar Heapsort (Ordenación por montones)
- Ordenación Radix
- Selection Sort (Ordenación de selección)
- Bubble Sort (Ordenación de burbuja)
- Ordenación rápida
- Timsort
- Merge Sort (Ordenar por fusión)

