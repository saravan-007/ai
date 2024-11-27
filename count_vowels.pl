% Base case: if the list is empty, there are no vowels.
count_vowels([], 0).

% Case when the head of the list is a vowel.
count_vowels([Head|Tail], Count) :-
    (   Head == a; Head == e; Head == i; Head == o; Head == u
    ),
    count_vowels(Tail, TailCount),
    Count is TailCount + 1.

% Case when the head of the list is not a vowel.
count_vowels([Head|Tail], Count) :-
    \+ (Head == a; Head == e; Head == i; Head == o; Head == u),
    count_vowels(Tail, Count).
