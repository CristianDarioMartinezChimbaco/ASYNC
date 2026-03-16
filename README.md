# ASYNC

## 1. Ejercicio a desarrollar:
Objetivo: Dividir una lista de números en dos partes y calcular la suma de cada parte en paralelo usando async y finish.
Generar una lista de 1000 números enteros aleatorios entre 0 y 9999.
Partir la lista en 4 sublistas, una de pares entre 0 y 4999 y la otra entre 5000 y 9999, las otras dos similaes pero de números impares.
Calcular la suma de cada sublista en tareas independientes.
Mostrar la suma total al final.

### Solución: 
Este desarrollo se realizo en LISP bajo el nombre ASYNC.lisp para ejecutarlo debe hacer uso de Common-lisp, con el siguiente comando interpreta y ejecuta el programa (*recuerde estar en el directorio del mismo programa TALLER_1*):
```bash
sbcl --script ASYNC.lisp 
```
En su defecto puede usar un [interprete Online](https://onecompiler.com/commonlisp/44fkwuf6k). 

## 2. Caso práctico: 
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
## 3. Desarrolle los siguientes temas de algoritmos de ordenación (trabajo de investigación en clase)
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