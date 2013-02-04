;; This problem tests (at least):
;;   PICK-FROM-STACK-BB
;;   PICK-FROM-STACK-BO
;;   PICK-FROM-STACK-OB
;;   PICK-FROM-STACK-OO
;;   PUT-ON-STACK-BB
;;   PUT-ON-STACK-OB
;;   PUT-ON-STACK-OO
;;   PUT-ON-TAPE
;;   PICK-FROM-TAPE
;;   Note: The only action not used is put-on-stack-bo
;;
;; No possible conflicts between cranes.
(define (problem HARBOR_P05_V06)
(:domain HARBOR_V06)
(:objects
    C1 C2 - crane 
    B1 B2 - o_block
    B3 B4 - block
    S1 S2 - stack 
    BOT1 BOT2 - bottom 
    D1 D2 - dock
    T1 - tape
    H0 H1 H2 H3 H4 - height)
(:init 
    (MAX_HEIGHT H4)
    (NEXT_H H1 H0)
    (NEXT_H H2 H1)
    (NEXT_H H3 H2)
    (NEXT_H H4 H3)
    (PREV_H H0 H1)
    (PREV_H H1 H2)
    (PREV_H H2 H3)
    (PREV_H H3 H4)
    (EMPTY_CRANE C1)
    (EMPTY_CRANE C2)
    (EMPTY_TAPE T1)
    (HANDLE C1 S1)
    (HANDLE C1 T1)
    (HANDLE C2 S2)
    (HANDLE C2 T1)
    (HEIGHT S1 H4)
    (HEIGHT S2 H0)

    ;; STACK 1
    (AT BOT1 S1)
    (AT_DOCK BOT1 D1)

    (ON B1 BOT1)
    (AT B1 S1)
    (AT_DOCK B1 D1)

    (ON B2 B1)
    (AT B2 S1)
    (AT_DOCK B2 D1)

    (ON B3 B2)
    (AT B3 S1)
    (AT_DOCK B3 D1)

    (ON B4 B3)
    (AT B4 S1)
    (AT_DOCK B4 D1)
    (TOP B4)

    ;; STACK 2
    (AT BOT2 S2)
    (AT_DOCK BOT2 D2)
    (TOP BOT2)
)

(:goal (and 
  (AVAILABLE B1) (AT_DOCK B1 D2)
  (AVAILABLE B2) (AT_DOCK B2 D2)
))

(:metric minimize (total-time))
)