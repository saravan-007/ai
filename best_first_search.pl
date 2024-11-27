% Define the graph as edges (node1, node2, cost).
edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(b, e, 6).
edge(c, f, 5).
edge(d, g, 3).
edge(e, g, 1).
edge(f, g, 2).

% Define the heuristic values for each node.
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 5).
heuristic(d, 3).
heuristic(e, 4).
heuristic(f, 2).
heuristic(g, 0).

% Define a bidirectional graph (edges can be traversed in both directions).
path(X, Y, Cost) :- edge(X, Y, Cost).
path(X, Y, Cost) :- edge(Y, X, Cost).

% Best First Search implementation.
best_first_search(Start, Goal, Path, Cost) :-
    bfs([[Start, 0]], Goal, [], Path, Cost).

% BFS helper function.
bfs([[Goal, Cost] | _], Goal, Visited, Path, Cost) :-
    reverse([Goal | Visited], Path).
bfs([[Current, CurrentCost] | Rest], Goal, Visited, Path, Cost) :-
    findall(
        [Next, NewCost],
        (path(Current, Next, StepCost),
         \+ member(Next, Visited),
         heuristic(Next, Heuristic),
         NewCost is CurrentCost + StepCost + Heuristic),
        Neighbors
    ),
    append(Rest, Neighbors, Queue),
    sort(2, @=<, Queue, SortedQueue), % Sort queue by cost
    bfs(SortedQueue, Goal, [Current | Visited], Path, Cost).

% Utility to run the search.
run(Start, Goal) :-
    best_first_search(Start, Goal, Path, Cost),
    write("Path: "), write(Path), nl,
    write("Total Cost: "), write(Cost), nl.
