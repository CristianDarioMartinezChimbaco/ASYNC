       IDENTIFICATION DIVISION.
       PROGRAM-ID. LEER-DATOS0.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT DATASET ASSIGN TO "dataset0.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT RESULTADO ASSIGN TO 'resultado.txt'
           ORGANIZATION IS LINE SEQUENTIAL. 

       DATA DIVISION.
       
      ****************************************************************
      * FD SECTION
      ****************************************************************
       FILE SECTION.
       FD  RESULTADO.
           01  RESULTADO-REC       PIC X(200).
       FD  DATASET.  
           01  FD-REC-DATASET      PIC X(101).
       
      ****************************************************************
      * WS SECTION
      ****************************************************************
       WORKING-STORAGE SECTION.
       01  EOF                     PIC 9 VALUE 0.    
       01  I                       PIC 9(03) VALUE 1.      
       01  PRODUCTO-MAS-VENDIDO. 
           05  NOMBRE              PIC X(30).
           05  NUMERO              PIC 9(07) VALUE 0.
       01  WS-VENTA.
           05  CLIENTE-ID          PIC 9(03) VALUE ZEROS.
           05  FILLER              PIC X(01) VALUE ' '. 
           05  CLIENTE-NOMBRE      PIC X(50).  
           05  FILLER              PIC X(01) VALUE ' '.
           05  PRODUCTO-ID         PIC 9(03) VALUE ZEROS.
           05  FILLER              PIC X(01) VALUE ' '.
           05  PRODUCTO-NOMBRE     PIC X(30).
           05  FILLER              PIC X(01) VALUE ' '.
           05  COSTO               PIC 9(10).
           05  FILLER              PIC X(01) VALUE '|'.         
       01  PRODUCTO OCCURS 1000 TIMES.
           05  ID-PRODUCTO         PIC X(03).   
           05  FILLER              PIC X(01) VALUE ' '. 
           05  NOMBRE-PRODUCTO     PIC X(30). 
           05  FILLER              PIC X(01) VALUE ' '.
           05  CANTIDAD            PIC 9(07) VALUE ZEROS.
       01  CLIENTE OCCURS 1000 TIMES.
           05  ID-CLIENTE          PIC 9(03) VALUE ZEROS.
           05  FILLER              PIC X(01) VALUE ' '.
           05  NOMBRE-CLIENTE      PIC X(50).
              
       PROCEDURE DIVISION.
       PERFORM LEER-DATOS
       PERFORM IMPRIMIR-CLIENTES.
       DISPLAY "EL PRODUCTO MAS VENDIDO ES: ", PRODUCTO-MAS-VENDIDO.
       STOP RUN.     

       LEER-DATOS.
       OPEN INPUT DATASET
           PERFORM UNTIL EOF = 1
               READ DATASET 
                   AT END
                       MOVE 1 TO EOF
                   NOT AT END
                       MOVE FD-REC-DATASET TO WS-VENTA 
                       DISPLAY "ID CL: ", CLIENTE-ID
                       PERFORM ORGANIZAR-CLIENTES
                       PERFORM CONTAR-PRODUCTOS          
               END-READ               
           END-PERFORM           
       CLOSE DATASET
       MOVE 0 TO EOF.

       ORGANIZAR-CLIENTES.       
           MOVE CLIENTE-ID TO I
           MOVE CLIENTE-ID TO ID-CLIENTE (I)
           MOVE CLIENTE-NOMBRE TO NOMBRE-CLIENTE (I)
       MOVE 1 TO I.

       CONTAR-PRODUCTOS.
           MOVE PRODUCTO-ID TO I
           MOVE PRODUCTO-ID TO ID-PRODUCTO (I)
           MOVE PRODUCTO-NOMBRE TO NOMBRE-PRODUCTO (I)
           ADD 1 TO CANTIDAD (I)
           IF NUMERO < CANTIDAD (I)
               MOVE NOMBRE-PRODUCTO (I) TO NOMBRE
               MOVE CANTIDAD (I) TO NUMERO
           END-IF        
       MOVE 1 TO I.  

       IMPRIMIR-CLIENTES.
       PERFORM 1000 TIMES 
           IF ID-CLIENTE (I) <> 0
               DISPLAY CLIENTE (I)
           END-IF
           ADD 1 TO I
       END-PERFORM
       MOVE 1 TO I. 
