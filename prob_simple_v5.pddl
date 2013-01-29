(define (problem HARBOR_SIMPLE_V05)
(:domain HARBOR_V5)
(:objects C1 C2 - crane
	  B1 - block
          B2 - o_block
          S1 S2 - stack
          BOT1 BOT2 - bottom
          D1 D2 - dock
          T1 - tape)
(:init
       (= (max_height) 3)
       (empty_crane C1)
       (empty_crane C2)
       (empty_tape T1)
       (handle C1 S1)
       (handle C2 S2)
       (handle C1 T1)
       (handle C2 T1)
       (= (stack_height S1) 1)
       (= (stack_height S2) 1)
       (on B1 BOT1)
       (at B1 S1)
       (at_dock B1 D1)
       (at_dock BOT1 D1)
       (at BOT1 S1)
       (top B1)

       (on B2 BOT2)
       (at B2 S2)
       (at_dock B2 D2)
       (at_dock BOT2 D2)
       (at BOT2 S2)
       (available B2)
       (top B2)
)

(:goal (and (available B2) (at_dock B2 D1))))
