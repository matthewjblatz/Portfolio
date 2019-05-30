IDENTIFICATION DIVISION.
PROGRAM-ID. conv.
ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT STANDARD-OUTPUT ASSIGN TO DISPLAY.

DATA DIVISION.
FILE SECTION.
FD STANDARD-OUTPUT.
    01 STDOUT-RECORD  PICTURE X(80).

WORKING-STORAGE SECTION.
77  I    PICTURE S99 USAGE IS COMPUTATIONAL.
77  PREV PICTURE S9(8) USAGE IS COMPUTATIONAL.
77  D    PICTURE S9(4) USAGE IS COMPUTATIONAL.
01 ERROR-MESS.
    02 FILLER PICTURE X(22) VALUE ' ILLEGAL ROMAN NUMERAL'.

LINKAGE SECTION.
77  M    PICTURE S99 USAGE IS COMPUTATIONAL.
77  ERR  PICTURE S9 USAGE IS COMPUTATIONAL-3.
77  SUM1 PICTURE S9(8) USAGE IS COMPUTATIONAL.
01  ARRAY-AREA.
    02 S PICTURE X(1) OCCURS 30 TIMES.

PROCEDURE DIVISION USING ARRAY-AREA, M, ERR, SUM1.
    MOVE ZERO TO SUM1. MOVE 1001 TO PREV.
    PERFORM LOOP THRU END-LOOP VARYING I FROM 1 BY 1
       UNTIL I IS GREATER THAN M.
    MOVE 1 TO ERR. 
    GOBACK.

*>Same function as original just restructured to avoid goto
LOOP.
    IF S(I) IS EQUAL TO 'I' OR 'i' THEN
        MOVE 1 TO D
        PERFORM DOMATH
    ELSE
        IF S(I) IS EQUAL TO 'V' OR 'v' THEN
            MOVE 5 TO D
            PERFORM DOMATH
        ELSE
            IF S(I) IS EQUAL TO 'X' OR 'x' THEN
                MOVE 10 TO D
                PERFORM DOMATH
            ELSE
                IF S(I) IS EQUAL TO 'L' OR 'l' THEN 
                    MOVE 50 TO D
                    PERFORM DOMATH
                ELSE 
                    IF S(I) IS EQUAL TO 'C' OR 'c' THEN 
                        MOVE 100 TO D
                        PERFORM DOMATH
                    ELSE 
                        IF S(I) IS EQUAL TO 'D' OR 'd' THEN 
                            MOVE 500 TO D
                            PERFORM DOMATH
                        ELSE 
                            IF S(I) IS EQUAL TO 'M' OR 'm' THEN 
                                MOVE 1000 TO D
                                PERFORM DOMATH
                            ELSE
                                OPEN OUTPUT STANDARD-OUTPUT
                                WRITE STDOUT-RECORD FROM ERROR-MESS AFTER ADVANCING 1 LINE
                                MOVE 2 TO ERR
                                CLOSE STANDARD-OUTPUT
                            END-IF
                        END-IF
                    END-IF
                END-IF
            END-IF
        END-IF
    END-IF.
END-LOOP. MOVE D TO PREV.

*>Calculates sum
DOMATH.
    ADD D TO SUM1.
    IF D IS GREATER THAN PREV
        COMPUTE SUM1 = SUM1 - 2 * PREV.
END-DOMATH.
GOBACK.
