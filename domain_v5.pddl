(define (domain HARBOR_V05)
  (:requirements :strips :typing :fluents)
  (:types block o_block stack crane bottom dock tape)
  (:predicates (hold ?c - crane ?x - (either block o_block))
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
    (stack_height ?s - stack)
    (max_height)
  )
  (:action pick-from-stack-bb
    :parameters (?x - block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock)
    :precondition (and (empty_crane ?c)
                       (handle ?c ?s)
		       (at ?x ?s)
		       (top ?x)
		       (on ?x ?y)
		       (at_dock ?x ?d))
    :effect (and (not (empty_crane ?c))
                 (hold ?c ?x)
		 (not (on ?x ?y))
		 (not (at ?x ?s))
		 (not (top ?x))
		 (top ?y)
		 (not (at_dock ?x ?d))
		 (decrease (stack_height ?s) 1))
  )

  (:action pick-from-stack-oo
    :parameters (?x - o_block ?y - o_block ?s - stack ?c - crane ?d - dock)
    :precondition (and (empty_crane ?c)
                       (handle ?c ?s)
		       (at ?x ?s)
		       (top ?x)
		       (on ?x ?y)
		       (at_dock ?x ?d))
    :effect (and (not (empty_crane ?c))
                 (hold ?c ?x)
		 (not (on ?x ?y))
		 (not (at ?x ?s))
		 (not (top ?x))
		 (not (available ?x))
		 (top ?y)
		 (not (at_dock ?x ?d))
		 (decrease (stack_height ?s) 1))
  )

  (:action pick-from-stack-ob
    :parameters (?x - o_block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock)
    :precondition (and (empty_crane ?c)
                       (handle ?c ?s)
		       (at ?x ?s)
		       (top ?x)
		       (on ?x ?y)
		       (at_dock ?x ?d))
    :effect (and (not (empty_crane ?c))
                 (hold ?c ?x)
		 (not (on ?x ?y))
		 (not (at ?x ?s))
		 (not (top ?x))
		 (not (available ?x))
		 (top ?y)
		 (not (at_dock ?x ?d))
		 (decrease (stack_height ?s) 1))
  )

  (:action pick-from-stack-bo
    :parameters (?x - block ?y - o_block ?s - stack ?c - crane ?d - dock)
    :precondition (and (empty_crane ?c)
                       (handle ?c ?s)
		       (at ?x ?s)
		       (top ?x)
		       (on ?x ?y)
		       (at_dock ?x ?d))
    :effect (and (not (empty_crane ?c))
                 (hold ?c ?x)
		 (not (on ?x ?y))
		 (not (at ?x ?s))
		 (not (top ?x))
		 (top ?y)
		 (not (at_dock ?x ?d))
		 (available ?y)
		 (decrease (stack_height ?s) 1))
  )

  (:action put-on-stack-bb
    :parameters (?x - block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock)
    :precondition (and (hold ?c ?x)
                       (handle ?c ?s)
    		       (top ?y)
		       (at ?y ?s)
		       (at_dock ?y ?d)
		       (< (stack_height ?s) (max_height)))
    :effect (and (empty_crane ?c)
                 (not (hold ?c ?x))
		 (on ?x ?y)
		 (at ?x ?s)
		 (top ?x)
		 (not (top ?y))
		 (at_dock ?x ?d)
		 (increase (stack_height ?s) 1))
  )

  (:action put-on-stack-oo
    :parameters (?x - o_block ?y - o_block ?s - stack ?c - crane ?d - dock)
    :precondition (and (hold ?c ?x)
                       (handle ?c ?s)
    		       (top ?y)
		       (at ?y ?s)
		       (at_dock ?y ?d)
		       (< (stack_height ?s) (max_height)))
    :effect (and (empty_crane ?c)
                 (not (hold ?c ?x))
		 (on ?x ?y)
		 (at ?x ?s)
		 (top ?x)
		 (not (top ?y))
		 (at_dock ?x ?d)
		 (available ?x)
		 (increase (stack_height ?s) 1))
  )



  (:action put-on-stack-ob
    :parameters (?x - o_block ?y - (either block bottom) ?s - stack ?c - crane ?d - dock)
    :precondition (and (hold ?c ?x)
                       (handle ?c ?s)
    		       (top ?y)
		       (at ?y ?s)
		       (at_dock ?y ?d)
		       (< (stack_height ?s) (max_height)))
    :effect (and (empty_crane ?c)
                 (not (hold ?c ?x))
		 (on ?x ?y)
		 (at ?x ?s)
		 (top ?x)
		 (not (top ?y))
		 (at_dock ?x ?d)
		 (available ?x)
		 (increase (stack_height ?s) 1))
  )

  (:action put-on-stack-bo
    :parameters (?x - block ?y - o_block ?s - stack ?c - crane ?d - dock)
    :precondition (and (hold ?c ?x)
                       (handle ?c ?s)
    		       (top ?y)
		       (at ?y ?s)
		       (at_dock ?y ?d)
		       (< (stack_height ?s) (max_height)))
    :effect (and (empty_crane ?c)
                 (not (hold ?c ?x))
		 (on ?x ?y)
		 (at ?x ?s)
		 (top ?x)
		 (not (top ?y))
		 (at_dock ?x ?d)
		 (not (available ?y))
		 (increase (stack_height ?s) 1))
  )

  (:action pick-from-tape
    :parameters (?x - (either block o_block) ?c - crane ?t - tape)
    :precondition (and (block_in_tape ?x ?t)
                       (empty_crane ?c)
		       (handle ?c ?t))

    :effect (and (not (block_in_tape ?x ?t)) (not (empty_crane ?c))
                 (empty_tape ?t) (hold ?c ?x))
  )

  (:action put-on-tape
    :parameters (?x - (either block o_block) ?c - crane ?t - tape)
    :precondition (and (empty_tape ?t)
                       (hold ?c ?x)
		       (handle ?c ?t))

    :effect (and (block_in_tape ?x ?t) (empty_crane ?c)
                 (not (empty_tape ?t)) (not (hold ?c ?x)))
  )
)
