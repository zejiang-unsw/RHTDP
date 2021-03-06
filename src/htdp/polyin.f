********************************************************
      SUBROUTINE  POLYIN (X0,Y0,X,Y,N,NPC)
C     SUBROUTINE TO DETERMINE IF A POINT AT (X0,Y0) IS INSIDE OR
C     OUTSIDE OF A CLOSED FIGURE DESCRIBED BY A SEQUENCE OF CONNECTED
C     STRAIGHT LINE SEGMENTS WITH VERTICES AT X, Y.
C
C     INPUT -
C         X0, Y0    COORDINATES OF A POINT TO BE TESTED
C                    Y0 corresponds to longitude and must be a number
C                    between 0.0 and 2*PI
C         X, Y      ARRAYS CONTAINING THE VERTICES, IN ORDER, OF A
C                   CLOSED FIGURE DESCRIBED BY STRAIGHT LINE SEGMNENTS.
C                   FOR EACH 'I', THE STRAIGHT LINE FROM (XI),Y(I)) TO
C                   TO (X(I+1),Y(I+1)), IS AN EDGE OF THE FIGURE.
C         N         DIMENSION OF X AND Y, NUMBER OF VERTICES, AND NUMBER
C                   OF STRAIGHT LINE SEGMENTS IN FIGURE.
C     OUTPUT -
C         NPC       NPC=0 WHEN X0,Y0 IS OUTSIDE OF FIGURE DESCRIBED
C                   BY X,Y
C                   NPC=1 WHEN X0,Y0 IS INSIDE FIGURE
C                   NPC=2 WHEN X0,Y0 IS ON BORDER OF FIGURE
C     METHOD -
C     A COUNT IS MADE OF THE NUMBER OF TIMES THE LINE FROM (X0,Y0) TO
C     (X0,+ INFINITY) CROSSES THE BORDER OF THE FIGURE. IF THE COUNT
C     IS ODD, THE POINT IS INSIDE; IF THE COUNT IS EVEN THE POINT
C     IS OUTSIDE.
C     LIMITATIONS -
C     NONE. THE PROGRAM LOGIC IS VALID FOR ALL CLOSED FIGURES,
C     NO MATTER HOW COMPLEX.
C     ACCURACY -
C     MAINTAINS FULL ACCURACY OF INPUT COORDINATES.
C
      IMPLICIT INTEGER(4) (I-N)
      IMPLICIT DOUBLE PRECISION (A-H,O-Z)
      DIMENSION X(N),Y(N)
      DATA I6/6/
      IS=0
      NPC=0
C
C     FIND STARTING POINT WHERE X(I).NE.X0
      IP=0
   10 IP=IP+1
      IF(X(IP)-X0) 15,12,16
   12 IF(IP.LE.N) GO TO 10
C     WRITE(I6,6001)
C6001 FORMAT('0  POLYGON INPUT ERROR - ALL POINTS ON LINE X = X0')
C     STOP
      CALL REXIT('Polygon input error in routine POLYIN')
   15 IL=-1
      GO TO 20
   16 IL=1
   20 XL=X(IP)
      YL=Y(IP)
C
C     SET UP SEARCH LOOP
C
      IP1=IP+1
      IPN=IP+N
      DO 100 II=IP1,IPN
      I=II
      IF(I.GT.N) I=I-N
      IF(IL) 30,50,40
   30 IF(X(I)-X0) 90,32,34
   32 IS=-1
      GO TO 60
   34 IL=1
      GO TO 80
   40 IF(X(I)-X0) 42,44,90
   42 IL=-1
      GO TO 80
   44 IS=1
      GO TO 60
   50 IF(X(I)-X0) 52,55,54
   52 IL=-1
      IF(IS) 90,140,80
   54 IL=1
      IF(IS) 80,140,90
   55 IF(Y(I)-Y0) 57,120,58
   57 IF(YL-Y0) 90,120,120
   58 IF(YL-Y0) 120,120,90
C
   60 IL=0
      IF(Y(I)-Y0) 90,120,90
   80 IF(YL-Y0+(Y(I)-YL)*(X0-XL)/(X(I)-XL)) 90,120,85
   85 NPC=NPC+1
   90 XL=X(I)
      YL=Y(I)
  100 CONTINUE
      NPC=MOD(NPC,2)
      RETURN
  120 NPC=2
      RETURN
C140  WRITE(I6,6002)
C6002 FORMAT('0  POLYGON LOGIC ERROR - PROGRAM SHOULD NOT REACH THIS',
C    .              ' POINT')
  140 CONTINUE
      CALL REXIT('Polygon logic error in routine POLYIN')
      RETURN
      END
