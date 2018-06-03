DECLARE FUNCTION getSala$ (row!, col!)
DECLARE SUB drawRoomInfo ()
DECLARE FUNCTION arrowToWASD$ (var$)
DECLARE FUNCTION canMoveTo! (newLine!, newCol!)
DECLARE FUNCTION getCharAt! (lin!, col!)
DECLARE SUB clearCurrentPosition ()
DECLARE SUB drawNewPosition (newLine!, newCol!)
DECLARE SUB updatePosition (newLine!, newCol!)
DECLARE SUB CLEARInfo (backgroundColor!)
DECLARE SUB move (direction$)
DECLARE SUB PaintBackground ()




KEY OFF: WIDTH 80, 25: SCREEN 0, 0, 0
COLOR 0, 0: CLS

PaintBackground

COLOR 15, 1
LOCATE 10, 23, 0: PRINT "ÚÄÄÄÄÄÄÄÄÄ Carregando mapa ÄÄÄÄÄÄÄÄ¿"
LOCATE 11, 23, 0: PRINT "³                                  ³"
LOCATE 12, 23, 0: PRINT "³                                  ³"
LOCATE 13, 23, 0: PRINT "³                                  ³"
LOCATE 14, 23, 0: PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"

COLOR 2, 1
LOCATE 12, 27, 0: PRINT "°°°°°°°°°°°°°°°°°°°°°°°°°°°"

SLEEP 1
SOUND 440, 1
LOCATE 12, 27, 0: PRINT "²²²²²²°°°°°°°°°°°°°°°°°°°°°": SOUND 440 * 3, 1
LOCATE 12, 27, 0: PRINT "²²²²²²²²²²²°°°°°°°°°°°°°°°°": SOUND 440 * 5, 1
LOCATE 12, 27, 0: PRINT "²²²²²²²²²²²²²²²²²°°°°°°°°°°": SOUND 440 * 6, 1
LOCATE 12, 27, 0: PRINT "²²²²²²²²²²²²²²²²²²²²²²²²²²²": SOUND 440 * 9, 1
PaintBackground

COLOR 15, 6
LOCATE 13, 43, 0: PRINT "ÚÄÄÄÄÄÄÄÄÄÄÄ WiFi ÄÄÄÄÄÄÄÄÄÄÄÄ¿";
LOCATE 14, 43, 0: PRINT "³ SSID: LHC   Senha: tijolo22 ³";
LOCATE 15, 43, 0: PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ";

COLOR 15, 4
LOCATE 17, 43, 0: PRINT "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿";
LOCATE 18, 43, 0: PRINT "³   ÛÛÛ     ÛÛÛ     ÛÛÛßÛÛÛ   ³";
LOCATE 19, 43, 0: PRINT "³   ÛÛÛ ÜÜÜ ÛÛÛßÛÛÛ ÛÛÛ       ³";
LOCATE 20, 43, 0: PRINT "³   ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ   ³";
LOCATE 21, 43, 0: PRINT "³   ßßßßßßß ßßß ÛÛÛ ßßßßßßß   ³";
LOCATE 22, 43, 0: PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ";

COLOR 15, 1
LOCATE 2, 14, 0: PRINT "ÚÄÄ   ÄÄÄÄÄÄÄÄÄÄÄ¿";
LOCATE 3, 14, 0: PRINT "³                ³";
LOCATE 4, 14, 0: PRINT "³                ³";
LOCATE 5, 14, 0: PRINT "³                ³";
LOCATE 6, 14, 0: PRINT "ÃÄÄ          ÄÄÄÄ´";
LOCATE 7, 14, 0: PRINT "³                ³";
LOCATE 8, 14, 0: PRINT "³                ³";
LOCATE 9, 14, 0: PRINT "³                ³";
LOCATE 10, 8, 0: PRINT "ÚÄÄÄÄÄÁÄÄÄÄÄÄÄÂÄ     ÄÂÁÄÄÄÄÄÄÄÄ¿";
LOCATE 11, 8, 0: PRINT "³             ³       ³         ³";
LOCATE 12, 8, 0: PRINT "³                               ³";
LOCATE 13, 8, 0: PRINT "³             ³       ³         ³";
LOCATE 14, 8, 0: PRINT "³             ÃÄ     ÄÁÄÄÄÄÄÄÄÄÄ´";
LOCATE 15, 8, 0: PRINT "³             ³                 ³";
LOCATE 16, 8, 0: PRINT "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄ´                 ³";
LOCATE 17, 8, 0: PRINT "³             ³                 ³";
LOCATE 18, 8, 0: PRINT "³                               ³";
LOCATE 19, 8, 0: PRINT "³             ³                 ³";
LOCATE 20, 8, 0: PRINT "³             ÃÄÄ   ÄÄÄÄÄÄÄÄÄÄÄÄ´";
LOCATE 21, 8, 0: PRINT "³             ³                 ³";
LOCATE 22, 8, 0: PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄ   ÄÄÄÄÄÄÄÄÙ";

COLOR 19
LOCATE 17, 23, 0: PRINT CHR$(1)
DIM SHARED errorFlag
errorFlag = -1
DIM SHARED currentLine
currentLine = 17
DIM SHARED currentCol
currentCol = 23
DIM SHARED prevChar
prevChar = 32
DIM SHARED lastRoom$
lastRoom$ = ""

COLOR 14, 1
LOCATE 4, 18, 0: PRINT "Cozinha"
LOCATE 8, 18, 0: PRINT "Copa"
LOCATE 13, 11, 0: PRINT "Lab"
LOCATE 12, 34, 0: PRINT "W.C."
LOCATE 19, 11, 0: PRINT "Coringa"
LOCATE 17, 30, 0: PRINT "Sala"
LOCATE 21, 30, 0: PRINT "Jaula"

REM COLOR 15, 2
REM LOCATE 2, 55, 0: PRINT "ÚÄÄÄÄÄÄ WiFi ÄÄÄÄÄ¿";
REM LOCATE 3, 55, 0: PRINT "³ SSID:  LHC      ³";
REM LOCATE 4, 55, 0: PRINT "³ Senha: tijolo22 ³";
REM LOCATE 5, 55, 0: PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ";
      
COLOR 15, 1
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT " <WASD/Setas=Movimenta‡ao>";

LOCATE 1, 1

drawRoomInfo
DO
        var$ = INKEY$
        IF var$ = CHR$(98) THEN
                CLEARInfo (3)
                CLEARInfo (1)
        ELSE
                m$ = arrowToWASD$(var$)
                IF m$ <> "" THEN
                        move (m$)
                        drawRoomInfo
                END IF
        END IF
LOOP UNTIL var$ = CHR$(27)


END

ErrorHandler:
        errorFlag = ERR
        RESUME NEXT

FUNCTION arrowToWASD$ (var$)
        IF var$ = CHR$(115) OR var$ = CHR$(97) OR var$ = CHR$(119) OR var$ = CHR$(100) THEN
                arrowToWASD = var$
        ELSE
                r$ = RIGHT$(var$, 1)
                IF r$ = "K" THEN
                        arrowToWASD = "a"
                ELSEIF r$ = "M" THEN
                        arrowToWASD = "d"
                ELSEIF r$ = "H" THEN
                        arrowToWASD = "w"
                ELSEIF r$ = "P" THEN
                        arrowToWASD = "s"
                ELSE
                        arrowToWASD = ""
                END IF
        END IF
END FUNCTION

FUNCTION canMoveTo (newLine, newCol)
        ca = getCharAt(newLine, newCol)
        canMoveTo = (ca = ASC(" ") OR ca = ASC(".") OR (ca >= ASC("A") AND ca <= ASC("Z")) OR (ca >= ASC("a") AND ca <= ASC("z")))
END FUNCTION

SUB clearCurrentPosition
        COLOR 14, 1
        LOCATE currentLine, currentCol, 0: PRINT CHR$(prevChar);
END SUB

SUB CLEARInfo (backgroundColor)
        COLOR backgroundColor, 0

        FOR i% = 10 TO 22
                FOR j% = 48 TO 78
                        LOCATE i%, j%: PRINT "°";
                NEXT j%
        NEXT i%
END SUB

SUB drawNewPosition (newLine, newCol)
        COLOR 19
        prevChar = getCharAt(newLine, newCol)
        LOCATE newLine, newCol, 0: PRINT CHR$(1);
END SUB

SUB drawRoomInfo
        room$ = getSala(currentLine, currentCol)
        IF room$ = lastRoom$ THEN EXIT SUB
        lastRoom$ = room$

        COLOR 15, 3
        LOCATE 2, 43, 0: PRINT "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿";
        LOCATE 3, 43, 0: PRINT "³                             ³";
        LOCATE 4, 43, 0: PRINT "³                             ³";
        LOCATE 5, 43, 0: PRINT "³                             ³";
        LOCATE 6, 43, 0: PRINT "³                             ³";
        LOCATE 7, 43, 0: PRINT "³                             ³";
        LOCATE 8, 43, 0: PRINT "³                             ³";
        LOCATE 9, 43, 0: PRINT "³                             ³";
        LOCATE 10, 43, 0: PRINT "³                             ³";
        LOCATE 11, 43, 0: PRINT "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ";
                                
        IF room$ = "" THEN room$ = "Porta"

        COLOR 1, 3: LOCATE 2, 57 - LEN(room$) / 2: PRINT " " + room$ + " "
        COLOR 15, 3
        name$ = LEFT$(room$, 8) + ".txt"
       
        ON ERROR GOTO ErrorHandler
        errorFlag = -1
        OPEN name$ FOR INPUT AS #1
        IF errorFlag > 0 THEN
                LOCATE 3, 44: PRINT name$ + " not found"
        ELSE
                l = 3
                DO WHILE NOT EOF(1) AND l < 11
                        INPUT #1, line$
                        LOCATE l, 44
                        l = l + 1
                        PRINT LEFT$(line$, 29);
                LOOP

                CLOSE #1
        END IF
END SUB

FUNCTION getCharAt (lin, col)
        DEF SEG = &HB800
        offset = 160 * (lin - 1) + (col - 1) * 2
        getCharAt = PEEK(offset)
END FUNCTION

FUNCTION getSala$ (row, col)
        IF row >= 3 AND row <= 5 THEN
                getSala$ = "Cozinha"
        ELSEIF row >= 7 AND row <= 9 THEN
                getSala$ = "Copa"
        ELSEIF row >= 11 AND row <= 15 AND col <= 21 THEN
                getSala$ = "Lab"
        ELSEIF row >= 17 AND row <= 21 AND col <= 21 THEN
                getSala$ = "Coringa"
        ELSEIF row >= 15 AND row <= 19 AND col > 22 THEN
                getSala$ = "Sala"
        ELSEIF row = 21 AND col > 22 THEN
                getSala$ = "Jaula"
        ELSEIF row > 10 AND row < 14 AND col > 22 AND col < 30 THEN
                getSala$ = "Corredor"
        ELSEIF row > 10 AND row < 14 AND col > 30 THEN
                getSala$ = "Banheiro"
        END IF
END FUNCTION

SUB move (direction$)
        newCurrentLine = currentLine
        newCurrentCol = currentCol
        IF direction$ = CHR$(119) THEN
               newCurrentLine = currentLine - 1
        ELSEIF direction$ = CHR$(100) THEN
                newCurrentCol = currentCol + 1
        ELSEIF direction$ = CHR$(115) THEN
                newCurrentLine = currentLine + 1
        ELSEIF direction$ = CHR$(97) THEN
                newCurrentCol = currentCol - 1
        END IF
        IF canMoveTo(newCurrentLine, newCurrentCol) THEN
                clearCurrentPosition
                drawNewPosition newCurrentLine, newCurrentCol
                updatePosition newCurrentLine, newCurrentCol
        ELSE
                SOUND 200, 2
                SOUND 300, 1
        END IF
END SUB

SUB PaintBackground
        DEF SEG = &HB800
        FOR offset = 0 TO 4000 STEP 4
                POKE offset, 177
                POKE offset + 1, &H13
        NEXT offset
        FOR offset = 2 TO 4000 STEP 4
                POKE offset, 177
                POKE offset + 1, &H13
        NEXT offset

END SUB

SUB updatePosition (newLine, newCol)
        currentLine = newLine
        currentCol = newCol

END SUB

