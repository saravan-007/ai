% Base case: If there's only one disk, move it directly from Source to Destination
hanoi(1, Source, Destination, _) :-
    format('Move disk 1 from ~w to ~w~n', [Source, Destination]).

% Recursive case: Solve the problem for N disks
hanoi(N, Source, Destination, Auxiliary) :-
    N > 1,
    N1 is N - 1,                      % Reduce the problem to N-1 disks
    hanoi(N1, Source, Auxiliary, Destination),  % Move N-1 disks from Source to Auxiliary
    format('Move disk ~w from ~w to ~w~n', [N, Source, Destination]),  % Move the largest disk
    hanoi(N1, Auxiliary, Destination, Source). % Move N-1 disks from Auxiliary to Destination