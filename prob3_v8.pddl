(define (problem HARBOR_P03_V08)
(:domain HARBOR_V08)
(:objects
    C1 C2 - crane
    B1 B2 B5 B6 B8 B9 B10 B11 - block
    B3 B4 B7 - o_block
    S1 S2 S3 S4 S5 S6 - stack
    D1 D2 - dock
    T1 - tape
)
(:init
    (= MAX_HEIGHT 3)
    (EMPTY_CRANE C1)
    (EMPTY_CRANE C2)
    (EMPTY_TAPE T1)

    (AT_STACK S1 S1)
    (AT_STACK S2 S2)
    (AT_STACK S3 S3)
    (AT_STACK S4 S4)
    (AT_STACK S5 S5)
    (AT_STACK S6 S6)

    (AT_DOCK S1 D1)
    (AT_DOCK S2 D1)
    (AT_DOCK S3 D1)
    (AT_DOCK S4 D2)
    (AT_DOCK S5 D2)
    (AT_DOCK S6 D2)

    (HANDLE C1 S1)
    (HANDLE C1 S2)
    (HANDLE C1 S3)
    (HANDLE C1 T1)
    (HANDLE C2 S4)
    (HANDLE C2 S5)
    (HANDLE C2 S6)
    (HANDLE C2 T1)

    (ON B1 S1)
    (AT_STACK B1 S1)
    (AT_DOCK B1 D1)
    (ON B2 B3)
    (AT_STACK B2 S5)
    (TOP B2)
    (AT_DOCK B2 D2)
    (ON B3 B5)
    (AT_STACK B3 S5)
    (AT_DOCK B3 D2)
    (ON B4 S4)
    (AT_STACK B4 S4)
    (AT_DOCK B4 D2)
    (ON B5 S5)
    (AT_STACK B5 S5)
    (AT_DOCK B5 D2)
    (ON B6 S6)
    (AT_STACK B6 S6)
    (TOP B6)
    (AT_DOCK B6 D2)
    (ON B7 B1)
    (AT_STACK B7 S1)
    (TOP B7)
    (AT_DOCK B7 D1)
    (AVAILABLE B7)
    (ON B8 B4)
    (AT_STACK B8 S4)
    (TOP B8)
    (AT_DOCK B8 D2)
    (ON B9 S2)
    (AT_STACK B9 S2)
    (AT_DOCK B9 D1)
    (ON B10 B9)
    (AT_STACK B10 S2)
    (TOP B10)
    (AT_DOCK B10 D1)
    (ON B11 S3)
    (AT_STACK B11 S3)
    (TOP B11)
    (AT_DOCK B11 D1)

    (= (STACK_HEIGHT S1) 2)
    (= (STACK_HEIGHT S2) 2)
    (= (STACK_HEIGHT S3) 1)
    (= (STACK_HEIGHT S4) 2)
    (= (STACK_HEIGHT S5) 3)
    (= (STACK_HEIGHT S6) 1)
)

(:goal (and
  (AVAILABLE B7) (AVAILABLE B3) (AVAILABLE B4)
  (AT_DOCK B3 D1) (AT_DOCK B4 D1) (AT_DOCK B7 D1)
))

(:metric minimize (total-time))
)