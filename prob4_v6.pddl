(define (problem HARBOR_P04_V06)
(:domain HARBOR_V06)
(:objects
    C1 C2 - crane
    T1 - tape
    B1 B2 B5 B6 B8 B9 B10 - block B3 B4 B7 - o_block
    S1 S2 S3 S4 S5 S6 - stack
    BOT1 BOT2 BOT3 BOT4 BOT5 BOT6 - bottom D1 D2 - dock
    H0 H1 H2 H3 H4 - height
)
(:init
    (MAX_HEIGHT H2)
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
    (AT BOT1 S1)
    (AT BOT2 S2)
    (AT BOT3 S3)
    (AT BOT4 S4)
    (AT BOT5 S5)
    (AT BOT6 S6)
    (AT_DOCK BOT1 D1)
    (AT_DOCK BOT2 D1)
    (AT_DOCK BOT3 D1)
    (AT_DOCK BOT4 D2)
    (AT_DOCK BOT5 D2)
    (AT_DOCK BOT6 D2)
    (HANDLE C1 S1)
    (HANDLE C1 S2)
    (HANDLE C1 S3)
    (HANDLE C1 T1)
    (HANDLE C2 S4)
    (HANDLE C2 S5)
    (HANDLE C2 S6)
    (HANDLE C2 T1)
    (HEIGHT S1 H2)
    (HEIGHT S2 H2)
    (HEIGHT S3 H1)
    (HEIGHT S4 H2)
    (HEIGHT S5 H2)
    (HEIGHT S6 H1)

    (ON B1 BOT1)
    (AT B1 S1)
    (AT_DOCK B1 D1)

    (ON B2 BOT3)
    (AT B2 S3)
    (TOP B2)
    (AT_DOCK B2 D1)

    (ON B3 B5)
    (AT B3 S5)
    (AT_DOCK B3 D2)
    (TOP B3)
    (AVAILABLE B3)
    (ON B4 BOT4)
    (AT B4 S4)
    (AT_DOCK B4 D2)

    (ON B5 BOT5)
    (AT B5 S5)
    (AT_DOCK B5 D2)

    (ON B6 BOT6)
    (AT B6 S6)
    (TOP B6)
    (AT_DOCK B6 D2)

    (ON B7 B1)
    (AT B7 S1)
    (TOP B7)
    (AT_DOCK B7 D1)
    (AVAILABLE B7)

    (ON B8 B4)
    (AT B8 S4)
    (TOP B8)
    (AT_DOCK B8 D2)

    (ON B9 BOT2)
    (AT B9 S2)
    (AT_DOCK B9 D1)

    (ON B10 B9)
    (AT B10 S2)
    (TOP B10)
    (AT_DOCK B10 D1)
)

(:goal (and
    (AVAILABLE B7) (AVAILABLE B3) (AVAILABLE B4)
    (AT_DOCK B3 D1) (AT_DOCK B4 D1) (AT_DOCK B7 D1)
))

(:metric minimize (total-time))
)
