% Check if a list is a sublist of another list.
sublist([], _). % An empty list is a sublist of any list.
sublist([X|XS], [X|YS]) :- 
    prefix(XS, YS). % Check if XS is a prefix of YS.
sublist(X, [_|YS]) :- 
    sublist(X, YS). % Recursively check for the sublist.

% Check if a list is a prefix of another list.
prefix([], _). % An empty list is a prefix of any list.
prefix([X|XS], [X|YS]) :- 
    prefix(XS, YS). % Recursively match the rest.

% Check for matching patterns in two lists.
pattern_match([], []). % Two empty lists match.
pattern_match([X|XS], [Y|YS]) :- 
    X = Y,              % Match the head of both lists.
    pattern_match(XS, YS). % Match the rest of the list.

% Utility to test pattern matching.
run_pattern_matching :-
    write('Pattern matching examples:'), nl,
    write('1. Is [b, c] a sublist of [a, b, c, d]? '), 
    (sublist([b, c], [a, b, c, d]) -> write('Yes'); write('No')), nl,
    write('2. Does [a, b] match [a, b]? '), 
    (pattern_match([a, b], [a, b]) -> write('Yes'); write('No')), nl,
    write('3. Is [c, d] a sublist of [a, b, c, d]? '), 
    (sublist([c, d], [a, b, c, d]) -> write('Yes'); write('No')), nl.
