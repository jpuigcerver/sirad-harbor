(define (problem HARBOR_P01_V01)
(:domain HARBOR_V01)
(:objects C1 C2 - crane B1 B2 B3 B4 B5 B6 B7 B8 B9 B10 B11 - block
          S1 S2 S3 S4 S5 S6 - stack BOT1 BOT2 BOT3 BOT4 BOT5 BOT6 - bottom)
(:init (EMPTY_CRANE C1)
       (EMPTY_CRANE C2)
       (EMPTY_TAPE)
       (AT BOT1 S1)
       (AT BOT2 S2)
       (AT BOT3 S3)
       (AT BOT4 S4)
       (AT BOT5 S5)
       (AT BOT6 S6)
       (HANDLE C1 S1)
       (HANDLE C1 S2)
       (HANDLE C1 S3)
       (HANDLE C2 S4)
       (HANDLE C2 S5)
       (HANDLE C2 S6)
       (ON B1 BOT1)
       (AT B1 S1)
       (ON B2 B3)
       (AT B2 S5)
       (TOP B2)
       (ON B3 B5)
       (AT B3 S5)
       (ON B4 BOT4)
       (AT B4 S4)
       (ON B5 BOT5)
       (AT B5 S5)
       (ON B6 BOT6)
       (AT B6 S6)
       (TOP B6)
       (ON B7 B1)
       (AT B7 S1)
       (TOP B7)
       (ON B8 B4)
       (AT B8 S4)
       (TOP B8)
       (ON B9 BOT2)
       (AT B9 S2)
       (ON B10 B9)
       (AT B10 S2)
       (TOP B10)
       (ON B11 BOT3)
       (AT B11 S3)
       (TOP B11)
)

(:goal (and 
       (AT B1 S5)  (AT B2 S5)  (AT B3 S5)  (AT B4 S5)  (AT B5 S5)  
       (AT B6 S5)  (AT B7 S5)  (AT B8 S5)  (AT B9 S5)  (AT B10 S5)  
       (AT B11 S5)
)))
