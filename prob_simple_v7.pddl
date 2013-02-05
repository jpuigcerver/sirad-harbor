(define (problem HARBOR_SIMPLE_V07)
(:domain HARBOR_V07)
(:objects C1 C2 - crane
	  B1 - block
          B2 - o_block
          S1 S2 - stack
          BOT1 BOT2 - bottom
          D1 D2 - dock
          T1 - tape)
(:init
       (= (MAX_HEIGHT) 3)
       (EMPTY_CRANE C1)
       (EMPTY_CRANE C2)
       (EMPTY_TAPE T1)
       (HANDLE C1 S1)
       (HANDLE C2 S2)
       (HANDLE C1 T1) ; These were missing
       (HANDLE C2 T1)
       (= (STACK_HEIGHT S1) 1)
       (= (STACK_HEIGHT S2) 1)
       (ON B1 BOT1)
       (AT B1 S1)
       (AT_DOCK B1 D1)
       (AT_DOCK BOT1 D1)
       (AT BOT1 S1)
       (TOP B1)

       (ON B2 BOT2)
       (AT B2 S2)
       (AT_DOCK B2 D2)
       (AT_DOCK BOT2 D2)
       (AT BOT2 S2)
       (AVAILABLE B2)
       (TOP B2)
)

(:goal (and
    (AVAILABLE B2) (AT_DOCK B2 D1)
))

(:metric minimize (total-time))
)
