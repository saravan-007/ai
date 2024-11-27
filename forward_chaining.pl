% Facts: Initial known facts
fact(vegetarian).
fact(has_apples).
fact(has_bananas).

% Rules: If a person is vegetarian and has apples or bananas, they can make a fruit salad.
rule(fruit_salad) :-
    fact(vegetarian),
    (fact(has_apples); fact(has_bananas)).

% Rule: If a person has fruit salad, they have healthy food.
rule(healthy_food) :-
    rule(fruit_salad).

% Rule: If a person has healthy food, they are fit.
rule(fit) :-
    rule(healthy_food).

% Forward chaining: Apply rules to derive new facts.
forward_chaining :-
    rule(fruit_salad),
    write('Fruit salad can be made.'), nl,
    rule(healthy_food),
    write('You have healthy food.'), nl,
    rule(fit),
    write('You are fit.'), nl.

% Query to start forward chaining.
start_forward_chaining :-
    forward_chaining.
