       IDENTIFICATION DIVISION.
       PROGRAM-ID. CREAR-DATOS.

       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *SELECT DATOS ASSIGN TO DATASET.
       SELECT DATOS ASSIGN TO "dataset.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT NOMBRES ASSIGN TO 'nombres.txt'
           ORGANIZATION IS LINE SEQUENTIAL.
       SELECT ELEMENTOS ASSIGN TO 'elementos.txt'
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       
      ****************************************************************
      * FD SECTION
      ****************************************************************
       FILE SECTION.
       FD  NOMBRES.
           01  NOMBRES-REC         PIC X(50).
           
       FD  ELEMENTOS.
           01  ELEMENTOS-REC       PIC X(50).
           
      * FD  DATOS              
      *     RECORDING MODE IS F
      *     RECORD CONTAINS 101 CHARACTERS 
      *     DATA RECORD IS FD-REC-DATOS.
      *     01  FD-REC-DATOS            PIC X(101).
       FD  DATOS.  
           01  FD-REC-DATOS            PIC X(101).
       
      ****************************************************************
      * WS SECTION
      ****************************************************************
       WORKING-STORAGE SECTION.
       01  EOF                     PIC 9 VALUE 0.    
       01  I                       PIC 9(03) VALUE 1.
       01  NUM-ALE-DEC             PIC 9(01)V9(10). 
       01  MULTIPLICADOR           PIC 9(10).    
       01  NUM-ALE-INT             PIC 9(10).

       01  WS-VENTA.
           05  CLIENTE-ID          PIC 9(03).
           05  FILLER1             PIC X(01) VALUE ' '. 
           05  CLIENTE-NOMBRE      PIC X(50).  
           05  FILLER2             PIC X(01) VALUE ' '.
           05  PRODUCTO-ID         PIC 9(03).
           05  FILLER3             PIC X(01) VALUE ' '.
           05  PRODUCTO-NOMBRE     PIC X(30).
           05  FILLER4             PIC X(01) VALUE ' '.
           05  COSTO               PIC 9(10).
           05  FILLER5             PIC X(01) VALUE '|'.

       01  PRODUCTO OCCURS 100 TIMES.
           05  ID-PRODUCTO         PIC X(03).    
           05  NOMBRE-PRODUCTO     PIC X(30). 
           05  PRECIO              PIC 9(10).

       01  CLIENTE OCCURS 100 TIMES.
           05  ID-CLIENTE          PIC 9(03).
           05  NOMBRE-CLIENTE      PIC X(50).
       
       PROCEDURE DIVISION.
       PERFORM LEER-NOMBRES
       PERFORM LEER-ELEMENTOS
       PERFORM ESCRIBIR-DATOS
       STOP RUN.

       LEER-ELEMENTOS.
       OPEN INPUT ELEMENTOS
           PERFORM UNTIL EOF = 1
               READ ELEMENTOS 
                   AT END 
      *                 DISPLAY "FINALIZO LECTURA ELEMENTOS"
                       MOVE 1 TO EOF
                   NOT AT END
                       MOVE ELEMENTOS-REC TO NOMBRE-PRODUCTO (I)  
      *                 DISPLAY NOMBRE-PRODUCTO (I) 
                       MOVE 10000 TO MULTIPLICADOR
                       PERFORM GENERADOR-ALEATORIOS
                       MOVE NUM-ALE-INT TO PRECIO (I)
      *                 DISPLAY "PRECIO: ", PRECIO (I)      
                       MOVE I TO ID-PRODUCTO (I)
                       ADD 1 TO I 
               END-READ
               IF I > 100
                   MOVE 1 TO EOF
               END-IF
           END-PERFORM
       CLOSE ELEMENTOS
       MOVE 0 TO EOF
       MOVE 1 TO I.

       LEER-NOMBRES.
       OPEN INPUT NOMBRES
           PERFORM UNTIL EOF = 1
               READ NOMBRES 
                   AT END 
      *                 DISPLAY "FINALIZO LECTURA NOMBRES"
                       MOVE 1 TO EOF
                   NOT AT END
                       MOVE NOMBRES-REC TO NOMBRE-CLIENTE (I)
      *                 DISPLAY NOMBRE-CLIENTE  (I)                       
                       MOVE I TO ID-CLIENTE (I)
                       ADD 1 TO I 
               END-READ
               IF I > 100
                   MOVE 1 TO EOF
               END-IF
           END-PERFORM
       CLOSE NOMBRES
       MOVE 0 TO EOF
       MOVE 1 TO I.
       
       GENERADOR-ALEATORIOS.
       COMPUTE NUM-ALE-DEC = FUNCTION RANDOM 
      *DISPLAY "NUMERO ALEATORIO DECIMAL: ", NUM-ALE-DEC
      *DISPLAY "MULTIPLICADOR: ", MULTIPLICADOR
       MULTIPLY NUM-ALE-DEC BY MULTIPLICADOR GIVING NUM-ALE-INT
      *DISPLAY "NUMERO ALEATORIO ENTERO: ", NUM-ALE-INT
       IF NUM-ALE-INT = 0
           ADD 1 TO NUM-ALE-INT
       END-IF.
       
       ESCRIBIR-DATOS.
       OPEN OUTPUT DATOS
           PERFORM 1000 TIMES
               MOVE 100 TO MULTIPLICADOR        
               PERFORM GENERADOR-ALEATORIOS
               IF NUM-ALE-INT > 100
                   MOVE 100 TO NUM-ALE-INT
               END-IF
               MOVE ID-CLIENTE (NUM-ALE-INT) TO CLIENTE-ID
               MOVE NOMBRE-CLIENTE (NUM-ALE-INT) TO CLIENTE-NOMBRE
               PERFORM GENERADOR-ALEATORIOS
               IF NUM-ALE-INT > 100
                   MOVE 100 TO NUM-ALE-INT
               END-IF
               MOVE ID-PRODUCTO (NUM-ALE-INT) TO PRODUCTO-ID
               MOVE NOMBRE-PRODUCTO (NUM-ALE-INT) TO PRODUCTO-NOMBRE
               MOVE PRECIO (NUM-ALE-INT) TO COSTO
      *         DISPLAY WS-VENTA
               MOVE WS-VENTA TO FD-REC-DATOS
               WRITE FD-REC-DATOS
           END-PERFORM
       CLOSE DATOS.
       