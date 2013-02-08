sirad-harbor
============

SIRAD Harbor problem

Domains
-------
The final domain was built incrementaly from a very simple first stage. The
following domain definitions should be seen as a sequential process, unless the
opposite is indicated.

- __domain_v1.pddl__: Simple domain to check stacking of blocks with the crane.
- __domain_v2.pddl__: Same as before, but now there are objective blocks, one tape and two docks. Blocks can move from one dock to the other one.
- __domain_v3.pddl__: Stack height control added. First complete solution: Limited to 1 tape.
- __domain_v4.pddl__: Multiple tapes allowed, more than 2 docks allowed.
- __domain_v5.pddl__: Using PDDL functions to handle the stack heights. THIS DOES NOT WORK ON LPG (SEGMENTATION FAULT).
- __domain_v6.pddl__: Temporal domain using durative actions. This derives from __domain_v4.pddl__ and correctly works on LPG.
- __domain_v7.pddl__: This domain merges the functionality of __domain_v5.pddl__ and __domain_v6.pddl__. This only works for small problems in LPG. __domain_v7b.pddl__ removes the height constraints on the stacks.
- __domain_v8.pddl__: A simplified version of __domain_v7.pddl__. Some actions were merged and the BOTTOM type was removed. __domain_v8b.pddl__ removes the height constraints on the stacks. This only works in LPG for small problems.
- __domain_v9.pddl__: The duration of the actions is computed dynamically based on fluents. It also removes the predicate AT_STACK from __domain_v8.pddl__ which is not necessary. This only works in LPG for small problems.

Problems
--------
- __prob1_v1.pddl__: Very simple problem checking the first domain definition. Basically, some blocks have to be stacked in some given order at some given position.
- __prob2_v2.pddl__: Very simple problem checking domain_v2.pddl. It is basically the statement problem without the max. height restriction.
- __prob3_v3.pddl__: Statement problem for domain 3.
- __prob3_v4.pddl__: Statement problem for domain 4.
- __prob3_v5.pddl__: Statement problem for domain 5.
- __prob3_v6.pddl__: Statement problem for domain 6.
- __prob3_v7.pddl__: Statement problem for domain 7 and 7b.
- __prob3_v8.pddl__: Statement problem for domain 8 and 8b.
- __prob3_v9.pddl__: Statement problem for domain 9.
- __prob4_v3.pddl__: A more complex problem similar to the statement problem, but max. height restriction is forced.
- __prob4_v4.pddl__: Max. height restriction forced for domain 4.
- __prob4_v5.pddl__: Max. height restriction forced for domain 5.
- __prob4_v6.pddl__: Max. height restriction forced for domain 6.
- __prob5_v6.pddl__: Tests all actions except from PUT-ON-STACK-BO for domain 6.
- __prob5_v8.pddl__: Tests all actions except from PUT-ON-STACK-BO for domain 8 and 8b.
- __prob5_v9.pddl__: Tests all actions except from PUT-ON-STACK-BO for domain 9.
- __prob_simple_v4.pddl__: Simple problem for domain 4.
- __prob_simple_v5.pddl__: Simple problem for domain 5.
- __prob_simple_v7.pddl__: Simple problem for domain 7 and 7b.
- __prob_simple_v8.pddl__: Simple problem for domain 8 and 8b.
- __prob_simple_v9.pddl__: Simple problem for domain 9.

IMPORTANT: 
- Domain v5 problems produce a SEGMENTATION FAULT in LPG...
- Domain v6 only works for LPG, since Metric-FF does not support durative actions.
- Domains v7, v8 and v9 only work in LPG for small problems, for big problems LPG hangs at 'Computing mutexes...' step. Domains 7b and 8b work for any problem by removing the maximum stack height constraint.