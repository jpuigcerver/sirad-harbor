;; This problem tests (at least):
;;   PICK-FROM-STACK-BB
;;   PICK-FROM-STACK-BO
;;   PICK-FROM-STACK-OANY
;;   PUT-ON-STACK-BB
;;   PUT-ON-STACK-OANY
;;   PUT-ON-TAPE
;;   PICK-FROM-TAPE
;;   Note: The only action not used is put-on-stack-bo
;;
;; No possible conflicts between cranes.
(define (problem HARBOR_P05_V08)
(:domain HARBOR_V08)
(:objects
    C1 C2 - crane
    B1 B2 - o_block
    B3 B4 - block
    S1 S2 - stack
    D1 D2 - dock
    T1 - tape
)
(:init
    (= (MAX_HEIGHT) 4)
    (EMPTY_CRANE C1)
    (EMPTY_CRANE C2)
    (EMPTY_TAPE T1)
    (HANDLE C1 S1)
    (HANDLE C1 T1)
    (HANDLE C2 S2)
    (HANDLE C2 T1)

    ;; STACK 1
    (= (STACK_HEIGHT S1) 4)
    (AT_STACK S1 S1)
    (AT_DOCK S1 D1)

    (ON B1 S1)
    (AT_STACK B1 S1)
    (AT_DOCK B1 D1)

    (ON B2 B1)
    (AT_STACK B2 S1)
    (AT_DOCK B2 D1)

    (ON B3 B2)
    (AT_STACK B3 S1)
    (AT_DOCK B3 D1)

    (ON B4 B3)
    (AT_STACK B4 S1)
    (AT_DOCK B4 D1)
    (TOP B4)

    ;; STACK 2
    (= (STACK_HEIGHT S2) 0)
    (AT_STACK S2 S2)
    (AT_DOCK S2 D2)
    (TOP S2)
)

(:goal (and
  (AVAILABLE B1) (AT_DOCK B1 D2)
  (AVAILABLE B2) (AT_DOCK B2 D2)
))

(:metric minimize (total-time))
)