       IDENTIFICATION DIVISION.
       PROGRAM-ID. BUCKET-SORT.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NUMEROS              OCCURS 15   TIMES.
           05  WS-NUMERO           PIC 9(02)   VALUE ZEROS.
       
       01  WS-BUKETS               OCCURS 3    TIMES.
           05  WS-BUKET            OCCURS 5    TIMES.
               10  WS-BK-NUMERO    PIC 9(02)   VALUE ZEROS.

       01  I                       PIC 9(02)   VALUE 1.
       01  I-1                     PIC 9(02)   VALUE 1.
       01  I-2                     PIC 9(02)   VALUE 1.
       01  I-3                     PIC 9(02)   VALUE 1.
       
       

       PROCEDURE DIVISION.
      *AGREGO NUMEROS MANUALMENTE A LA TABLA 
       MOVE 15 TO WS-NUMERO(1).
       MOVE 6  TO WS-NUMERO(2).
       MOVE 1  TO WS-NUMERO(3).
       MOVE 13 TO WS-NUMERO(4).
       MOVE 9  TO WS-NUMERO(5).
       MOVE 8  TO WS-NUMERO(6).
       MOVE 12 TO WS-NUMERO(7).
       MOVE 7  TO WS-NUMERO(8).
       MOVE 5  TO WS-NUMERO(9).
       MOVE 11 TO WS-NUMERO(10).
       MOVE 2  TO WS-NUMERO(11).
       MOVE 3  TO WS-NUMERO(12).
       MOVE 10 TO WS-NUMERO(13).
       MOVE 14 TO WS-NUMERO(14).
       MOVE 4  TO WS-NUMERO(15).
       PERFORM P001-AGRUPAR.
       STOP RUN
       .

      *AGRUPAR DE 1 A 5
      *AGRUPAR DE 6 A 10
      *AGRUPAR DE 11 A 15 
       P001-AGRUPAR.      
       PERFORM 15 TIMES
           EVALUATE TRUE
               WHEN WS-NUMERO(I) >= 1 AND WS-NUMERO(I) <= 5
                   MOVE WS-NUMERO(I) TO WS-BK-NUMERO(1, I-1)
                   ADD 1 TO I-1
               WHEN WS-NUMERO(I) >= 6 AND WS-NUMERO(I) <= 10
                   MOVE WS-NUMERO(I) TO WS-BK-NUMERO(1, I-2)
                   ADD 1 TO I-2
               WHEN WS-NUMERO(I) >= 11 AND WS-NUMERO(I) <= 15
                   MOVE WS-NUMERO(I) TO WS-BK-NUMERO(1, I-3)
                   ADD 1 TO I-3
               WHEN OTHER 
                   DISPLAY 'NUMERO MAYOR A 15 O MENOR A 1'
           END-EVALUATE  
           ADD 1 TO I
       END-PERFORM
       MOVE 1 TO I
       MOVE 1 TO I-1
       MOVE 1 TO I-2
       MOVE 1 TO I-3
       .

       P002-ORGANIZAR-DATOS.
       