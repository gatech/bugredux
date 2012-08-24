bugredux
========

A test repo for bugredux.

BugRedux is a general framework for supporting in-house debugging of field failures. BugRedux synthesizes, using execution data collected in the field, executions that mimic the observed field failures. Our approach is based on symbolic execution and has two key aspects. First, it uses the execution data from the field to identify a set of intermediate goals that can guide the exploration of the solution space. Second, it uses a heuristic based on distance to select which states to consider first when trying to reach an intermediate goal during the exploration. A technical report describing the work will be available soon.
