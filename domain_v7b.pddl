(define (domain HARBOR_V07)
  (:requirements :strips :typing :durative-actions :fluents)
  (:types block o_block stack crane bottom dock tape)
  (:predicates
      (hold ?c - crane ?x - (either block o_block))
  	  (empty_crane ?c - crane)
	  (empty_tape ?t - tape)
	  (block_in_tape ?x - (either block o_block) ?t - tape)
	  (available ?x - o_block)
	  (on ?x - (either o_block block) ?y - (either o_block block bottom) )
	  (top ?x - (either block bottom o_block))
	  (at ?x - (either block bottom o_block) ?s - stack)
	  (at_dock ?x - (either block o_block bottom) ?d - dock)
	  (handle ?c - crane ?s - (either stack tape))
  )
  (:functions
      ;;(crane_velocity)
      (max_height)
      (stack_height ?s - stack)
  )

  (:durative-action pick-from-stack-bb
   :parameters (
       ?x - block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_crane ?c))
       (over all (handle ?c ?s))
       (over all (at ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (prev_h ?nh ?ch))
    )
    :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at ?x ?s)))
       (at end (not (top ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (decrease (stack_height ?s) 1))
    )
  )


  (:durative-action pick-from-stack-oo
   :parameters (
       ?x - o_block ?y - o_block ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_crane ?c))
       (over all (handle ?c ?s))
       (over all (at ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (prev_h ?nh ?ch))
   )
   :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at ?x ?s)))
       (at end (not (top ?x)))
       (at end (not (available ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (decrease (stack_height ?s) 1))
   )
  )


  (:durative-action pick-from-stack-ob
   :parameters (
       ?x - o_block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_crane ?c))
       (over all (handle ?c ?s))
       (over all (at ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (prev_h ?nh ?ch))
   )
   :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at ?x ?s)))
       (at end (not (top ?x)))
       (at end (not (available ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (decrease (stack_height ?s) 1))
   )
  )


  (:durative-action pick-from-stack-bo
   :parameters (
       ?x - block ?y - o_block ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_crane ?c))
       (over all (handle ?c ?s))
       (over all (at ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (prev_h ?nh ?ch))
   )
   :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at ?x ?s)))
       (at end (not (top ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
       (at end (available ?y))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (decrease (stack_height ?s) 1))
   )
  )


  (:durative-action put-on-stack-bb
   :parameters (
       ?x - block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (hold ?c ?x))
       (over all (handle ?c ?s))
       (over all (top ?y))
       (over all (at ?y ?s))
       (over all (at_dock ?y ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (next_h ?nh ?ch))
       ;;(over all (max_height ?mh))
       ;;(over all (not (next_h ?nh ?mh)))
       ;;(over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at start (empty_crane ?c))
       (at start (not (hold ?c ?x)))
       (at start (on ?x ?y))
       (at start (at ?x ?s))
       (at start (top ?x))
       (at start (not (top ?y)))
       (at start (at_dock ?x ?d))
       ;;(at start (not (height ?s ?ch)))
       ;;(at start (height ?s ?nh))
       (at end (increase (stack_height ?s) 1))
   )
  )


  (:durative-action put-on-stack-oo
   :parameters (
       ?x - o_block ?y - o_block ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (hold ?c ?x))
       (over all (handle ?c ?s))
       (over all (top ?y))
       (over all (at ?y ?s))
       (over all (at_dock ?y ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (next_h ?nh ?ch))
       ;;(over all (max_height ?mh))
       ;;(over all (not (next_h ?nh ?mh)))
       ;;(over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at end (empty_crane ?c))
       (at end (not (hold ?c ?x)))
       (at end (on ?x ?y))
       (at end (at ?x ?s))
       (at end (top ?x))
       (at end (not (top ?y)))
       (at end (at_dock ?x ?d))
       (at end (available ?x))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (increase (stack_height ?s) 1))
   )
  )


  (:durative-action put-on-stack-ob
   :parameters (
       ?x - o_block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (hold ?c ?x))
       (over all (handle ?c ?s))
       (over all (top ?y))
       (over all (at ?y ?s))
       (over all (at_dock ?y ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (next_h ?nh ?ch))
       ;;(over all (max_height ?mh))
       ;;(over all (not (next_h ?nh ?mh)))
       ;;(over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at end (empty_crane ?c))
       (at end (not (hold ?c ?x)))
       (at end (on ?x ?y))
       (at end (at ?x ?s))
       (at end (top ?x))
       (at end (not (top ?y)))
       (at end (at_dock ?x ?d))
       (at end (available ?x))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (increase (stack_height ?s) 1))
   )
  )


  (:durative-action put-on-stack-bo
   :parameters (
       ?x - block ?y - o_block ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (hold ?c ?x))
       (over all (handle ?c ?s))
       (over all (top ?y))
       (over all (at ?y ?s))
       (over all (at_dock ?y ?d))
       ;;(over all (height ?s ?ch))
       ;;(over all (next_h ?nh ?ch))
       ;;(over all (max_height ?mh))
       ;;(over all (not (next_h ?nh ?mh)))
       ;;(over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at end (empty_crane ?c))
       (at end (not (hold ?c ?x)))
       (at end (on ?x ?y))
       (at end (at ?x ?s))
       (at end (top ?x))
       (at end (not (top ?y)))
       (at end (at_dock ?x ?d))
       ;;(at end (not (available ?y)))
       ;;(at end (not (height ?s ?ch)))
       ;;(at end (height ?s ?nh))
       (at end (increase (stack_height ?s) 1))
   )
  )


  (:durative-action pick-from-tape
   :parameters (
       ?x - (either block o_block) ?c - crane ?t - tape
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (block_in_tape ?x ?t))
       (over all (empty_crane ?c))
       (over all (handle ?c ?t))
   )
   :effect (and
       (at end (not (block_in_tape ?x ?t)))
       (at end (not (empty_crane ?c)))
       (at end (empty_tape ?t))
       (at end (hold ?c ?x))
   )
  )


  (:durative-action put-on-tape
   :parameters (
       ?x - (either block o_block) ?c - crane ?t - tape
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_tape ?t))
       (over all (hold ?c ?x))
       (over all (handle ?c ?t))
   )
   :effect (and 
       (at end (block_in_tape ?x ?t))
       (at end (empty_crane ?c))
       (at end (not (empty_tape ?t)))
       (at end (not (hold ?c ?x)))
   )
  )
)
