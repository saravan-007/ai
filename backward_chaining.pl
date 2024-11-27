% Facts: Initial known facts
fact(vegetarian).
fact(has_apples).
fact(has_bananas).

% Rules: Conditions for making a fruit salad
rule(fruit_salad) :-
    fact(vegetarian),
    (fact(has_apples); fact(has_bananas)).

% Rule for healthy food
rule(healthy_food) :-
    rule(fruit_salad).

% Rule for being fit
rule(fit) :-
    rule(healthy_food).

% Backward Chaining: Query to check if a goal is achievable.
backward_chaining(Goal) :-
    write('Checking if goal: '), write(Goal), nl,
    (   rule(Goal)
    ->  write('Goal achieved: '), write(Goal), nl
    ;   write('Goal cannot be achieved: '), write(Goal), nl
    ).

% Query to start backward chaining and check for fit
start_backward_chaining :-
    backward_chaining(fit).

% You can also query for other goals like fruit_salad, healthy_food
start_backward_chaining_fruit_salad :-
    backward_chaining(fruit_salad).

start_backward_chaining_healthy_food :-
    backward_chaining(healthy_food).
