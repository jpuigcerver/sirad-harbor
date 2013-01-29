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

Problems
--------