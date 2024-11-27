% Define bird facts
bird(sparrow).
bird(penguin).
bird(ostrich).
bird(eagle).

% Define flight ability rules
can_fly(sparrow).
can_fly(eagle).

% Birds that cannot fly
cannot_fly(Bird) :- bird(Bird), \+ can_fly(Bird).

% Queries for checking flight ability
is_flying(Bird) :-
    can_fly(Bird),
    format('~w can fly.~n', [Bird]).

is_flying(Bird) :-
    cannot_fly(Bird),
    format('~w cannot fly.~n', [Bird]).
