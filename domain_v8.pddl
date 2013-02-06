(define (domain HARBOR_V08)
  (:requirements :strips :typing :durative-actions :fluents)
  (:types block o_block stack crane dock tape)
  (:predicates
      (hold ?c - crane ?x - (either block o_block))
      (empty_crane ?c - crane)
      (empty_tape ?t - tape)
      (block_in_tape ?x - (either block o_block) ?t - tape)
      (available ?x - o_block)
      (on ?x - (either o_block block) ?y - (either o_block block stack) )
      (top ?x - (either block stack o_block))
      (at_stack ?x - (either block o_block stack) ?s - stack)
      (at_dock ?x - (either block o_block stack) ?d - dock)
      (handle ?c - crane ?s - (either stack tape))
  )
  (:functions
      ;;(crane_velocity)
      (max_height)
      (stack_height ?s - stack)
  )


  ;; this supersedes pick-from-stack-oo and pick-from-stack-ob
  (:durative-action pick-from-stack-oANY
   :parameters (
       ?x - o_block ?y - (either o_block block stack) ?s - stack
       ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_crane ?c))
       (over all (handle ?c ?s))
       (over all (at_stack ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
   )
   :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at_stack ?x ?s)))
       (at end (not (top ?x)))
       (at end (not (available ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
       (at end (decrease (stack_height ?s) 1))
   )
  )


  (:durative-action pick-from-stack-bb
   :parameters (
       ?x - block ?y - (either block stack) ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (empty_crane ?c))
       (over all (handle ?c ?s))
       (over all (at_stack ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
    )
    :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at_stack ?x ?s)))
       (at end (not (top ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
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
       (over all (at_stack ?x ?s))
       (over all (top ?x))
       (over all (on ?x ?y))
       (over all (at_dock ?x ?d))
   )
   :effect (and
       (at end (not (empty_crane ?c)))
       (at end (hold ?c ?x))
       (at end (not (on ?x ?y)))
       (at end (not (at_stack ?x ?s)))
       (at end (not (top ?x)))
       (at end (top ?y))
       (at end (not (at_dock ?x ?d)))
       (at end (available ?y))
       (at end (decrease (stack_height ?s) 1))
   )
  )


  (:durative-action put-on-stack-bb
   :parameters (
       ?x - block ?y - (either block stack) ?s - stack ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (hold ?c ?x))
       (over all (handle ?c ?s))
       (over all (top ?y))
       (over all (at_stack ?y ?s))
       (over all (at_dock ?y ?d))
       (over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at end (empty_crane ?c))
       (at end (not (hold ?c ?x)))
       (at end (on ?x ?y))
       (at end (at_stack ?x ?s))
       (at end (top ?x))
       (at end (not (top ?y)))
       (at end (at_dock ?x ?d))
       (at end (increase (stack_height ?s) 1))
   )
  )

  ;; this supersedes put-on-stack-oo and put-on-stack-ob
  (:durative-action put-on-stack-oANY
   :parameters (
       ?x - o_block ?y - (either o_block block stack) ?s - stack
       ?c - crane ?d - dock
   )
   :duration (= ?duration 1)
   :condition (and
       (over all (hold ?c ?x))
       (over all (handle ?c ?s))
       (over all (top ?y))
       (over all (at_stack ?y ?s))
       (over all (at_dock ?y ?d))
       (over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at end (empty_crane ?c))
       (at end (not (hold ?c ?x)))
       (at end (on ?x ?y))
       (at end (at_stack ?x ?s))
       (at end (top ?x))
       (at end (not (top ?y)))
       (at end (at_dock ?x ?d))
       (at end (available ?x))
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
       (over all (at_stack ?y ?s))
       (over all (at_dock ?y ?d))
       (over all (< (stack_height ?s) (max_height)))
   )
   :effect (and
       (at end (empty_crane ?c))
       (at end (not (hold ?c ?x)))
       (at end (on ?x ?y))
       (at end (at_stack ?x ?s))
       (at end (top ?x))
       (at end (not (top ?y)))
       (at end (at_dock ?x ?d))
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
