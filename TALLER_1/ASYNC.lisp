;///////////////////////////////////////////////////////////////
;       Grafo de ejecución del programa (flujo de hilos)
;
;                            main
;                           /    \
;                      hilo1      hilo2
;                    (llenar A) (llenar B)
;                           \    /
;                            join
;                              |
;           -------------------------------------
;           |			|			|			|
;         	hilo3  		hilo4     	hilo5   	hilo6
;        	(paresA)  	(imparesA) 	(paresB)	(imparesB)
;           |        	|         	|        	|
;           ---------------- join ---------------
;                          	   |
;                      imprimir resultados
;
;///////////////////////////////////////////////////////////////
;El objetivo era usar '() para crear una lista vacía pero no se pudo por el 
;comportamiento de las mismas, ya que los arreglos al tener un espacio en 
;memoria fijo al agregarlos al parámetro de la función sí modificaban un es-
;pacio en memoria del arreglo, pero con las listas lo único que modificaba 
;era el espacio de la lista de la función, la cual es local. Para lograr el 
;objetivo debía retornar la lista misma, se usaron arreglos 
;para guardar los pares e impares de cada lista por eso se ven 0 o nil al final
;de cada lista.
;Realmente el proceso es tan rapido que no alcanza a mostrar los tiempos de cada 
;hilo, pero se dejaron las funciones para medir el tiempo de cada hilo, aunque
;en ocaciones no se muestran en la salida.
;De hecho si anula algunos comentarios con codigo si se obseva una variacion en los 
;tiempos de casa hilo, demostrnado que lo que mas recurso gasta es imprimir en la consola
(defparameter listaA (make-array 500000))
(defparameter listaB (make-array 500000))
(defparameter listaIA (make-array 500000))
(defparameter listaIB (make-array 500000))
(defparameter listaPA (make-array 500000))
(defparameter listaPB (make-array 500000))
(defparameter listaImprIA '())
(defparameter listaImprIB '())
(defparameter listaImprPA '())
(defparameter listaImprPB '())
(defparameter rsAP 0)
(defparameter rsAI 0)
(defparameter rsBP 0)
(defparameter rsBI 0)
(defparameter timeH1 0.0)
(defparameter timeH2 0.0)
(defparameter timeH3 0.0)
(defparameter timeH4 0.0)
(defparameter timeH5 0.0)
(defparameter timeH6 0.0)
;///////////////////////////////////////////////////////////////////////
(defun main ()
;se declaran los hilos como variables locales	
	(let	
		(
			(hilo1 
				(sb-thread:make-thread
					(lambda ()
						(let ((inicio (get-internal-real-time)))
  							(llenarLista listaA 500000 0 5000 "A")
  							(let ((fin (get-internal-real-time)))
    							(setf timeH1 
    								(* (/ (- fin inicio) internal-time-units-per-second) 1000000000)
    							)
    						)
    					)
          			)
        		)
        	)                                    
   			(hilo2
				(sb-thread:make-thread
					(lambda ()
						(let ((inicio (get-internal-real-time)))
                          	(llenarLista listaB 500000 5000 5000 "B")
                            (let ((fin (get-internal-real-time)))
                               	(setf timeH2
                                  	(* (/ (- fin inicio) internal-time-units-per-second) 1000000000)
                               	)
                           	)
                      	)
					)
				)
   			)
   		)
   		(sb-thread:join-thread hilo1)
   		(sb-thread:join-thread hilo2)
   	)	
;segunda face de los hilos, aqui se suman los impares y pares de cada lista de 500   	
   	(let
		(
			(hilo3
				(sb-thread:make-thread
					(lambda()
						(let ((inicio (get-internal-real-time)))
							(setf rsAP (+ (sumaP listaA listaIA "A") 5000))
							(let ((fin (get-internal-real-time)))
								(setf timeH3
							 		(* (/ (- fin inicio) internal-time-units-per-second) 1000000000)
								)
							)
						)
					)
				)
			)
			(hilo4
				(sb-thread:make-thread
					(lambda ()
						(let ((inicio (get-internal-real-time)))
							(setf rsAI (+ (sumaI listaA listaPA "A") 5000))
							(let ((fin (get-internal-real-time)))
                            	(setf timeH4
                                  	(* (/ (- fin inicio) internal-time-units-per-second) 1000000000)
                                )
                            )
                        )
					)
				)
			)
			(hilo5
				(sb-thread:make-thread
					(lambda ()
						(let ((inicio (get-internal-real-time)))
							(setf rsBP (+ (sumaP listaB listaIB "B") 5000))
							(let ((fin (get-internal-real-time)))
                        		(setf timeH5
                        			(* (/ (- fin inicio) internal-time-units-per-second) 1000000000)
                       			)
                       		)
                        )
					)
				)
			)
			(hilo6 
				(sb-thread:make-thread
					(lambda ()
						(let ((inicio (get-internal-real-time)))
							(setf rsBI (+ (sumaI listaB listaPB "B") 5000))
							(let ((fin (get-internal-real-time)))
							   	(setf timeH6
							       	(* (/ (- fin inicio) internal-time-units-per-second) 1000000000)
								)
							)
						)
					)
				)
			)
		)
		(sb-thread:join-thread hilo3)
		(sb-thread:join-thread hilo5)
		(sb-thread:join-thread hilo4)
		(sb-thread:join-thread hilo6)
   	)
	(format t "*****************************************************************************************~%")
	(format t "****************************************** ASYNC ****************************************~%")
	(format t "*****************************************************************************************~%")
	(format t "LISTA A: ~a ~%" listaA)
	(format t "LISTA B: ~a ~%" listaB)
	(format t "Para A lista de impares: ~a ~%" (imprimirListas listaIA listaImprIA))
	(format t "Para A lista de pares: ~a ~%" (imprimirListas listaPA listaImprPA))
	(format t "Para B lista de impares: ~a ~%" (imprimirListas listaIB listaImprIB))
	(format t "Para B lista de pares: ~a ~%" (imprimirListas listaPB listaImprPB))
	(format t "Sumatoria de los impares para la lista A ~a ~%" rsAI)
	(format t "Sumatoria de los pares para la lista A ~a ~%" rsAP)
	(format t "Sumatoria de los impares para la lista B ~a ~%" rsBI)
	(format t "Sumatoria de los pares para la lista B ~a ~%" rsBP)
   	(format t "tiempo H1 ~a ns ~%" timeH1)
   	(format t "tiempo H2 ~a ns ~%" timeH2)
   	(format t "tiempo H3 ~a ns ~%" timeH3)
   	(format t "tiempo H4 ~a ns ~%" timeH4)
   	(format t "tiempo H5 ~a ns ~%" timeH5)
   	(format t "tiempo H6 ~a ns ~%" timeH6)
)
;///////////////////////////////////////////////////////////////////////
(defun imprimirListas (arreglo lista)
	(loop for i from 0 below 500000 do
		(if (/= (aref arreglo i) 0)
			(push (aref arreglo i) lista)
		)
	)
	lista
)
;///////////////////////////////////////////////////////////////////////
(defun llenarLista (a max inferior limite name)
	(loop for i from 0 below max do
 		(setf (aref a i) (+ inferior (random limite)) )
 		;(format t "valor aleatorio = ~a ,lista ~a ~%" (aref a i) name)
	)
	(format t "finalizo llenarLista ~a ~%" name)
)
;///////////////////////////////////////////////////////////////////////
;funcion para sumar los impares de cada lista y agregar a una lista de pares
(defun sumaI (a b name)
	(let ((return 0) (j 0))
		(loop for i from 0 below 500000 do
			(if (oddp (aref a i))
				(progn 
					(incf return (aref a i))
				)
				(progn
					(setf (aref b j) (aref a i))
					(incf j)
				)		
			)
			;(format t "sumaI = ~a ,lista ~a ~%" return name)
		)
		(format t "finalizo sumaI ~a ~%" name)
		return
	)
)
;///////////////////////////////////////////////////////////////////////
;funcion para sumar los pares de cada lista y agregar a una lista de impares
(defun sumaP (a b name)
   	(let ((return 0) (j 0))
      	(loop for i from 0 below 500000 do
          	(if (evenp (aref a i))
				(progn 
					(incf return (aref a i))
				)
				(progn
					(setf (aref b j) (aref a i))
					(incf j)
				)
          	)
          	;(format t "sumaP = ~a ,lista ~a ~%" return name)
        )
        (format t "finalizo sumaP ~a ~%" name)
        return
   	)
)
;///////////////////////////////////////////////////////////////////////
(main)
