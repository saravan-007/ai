% Facts: Parent relationships
parent(john, mary).   % John is a parent of Mary
parent(john, tom).    % John is a parent of Tom
parent(susan, mary).  % Susan is a parent of Mary
parent(susan, tom).   % Susan is a parent of Tom
parent(mary, alice).  % Mary is a parent of Alice
parent(mary, james).  % Mary is a parent of James
parent(peter, alice). % Peter is a parent of Alice
parent(peter, james). % Peter is a parent of James

% Facts: Gender
male(john).
male(tom).
male(peter).
male(james).
female(susan).
female(mary).
female(alice).

% Rules: Relationships
father(F, C) :- parent(F, C), male(F).        % F is the father of C
mother(M, C) :- parent(M, C), female(M).     % M is the mother of C
sibling(A, B) :- parent(P, A), parent(P, B), A \= B. % A and B are siblings
grandparent(GP, GC) :- parent(GP, P), parent(P, GC). % GP is the grandparent of GC
grandfather(GF, GC) :- grandparent(GF, GC), male(GF). % GF is the grandfather of GC
grandmother(GM, GC) :- grandparent(GM, GC), female(GM). % GM is the grandmother of GC
ancestor(A, D) :- parent(A, D).              % A is a direct ancestor of D
ancestor(A, D) :- parent(A, P), ancestor(P, D). % Recursive rule for ancestors

% Example queries
% - To find the father of Mary: ?- father(X, mary).
% - To find all siblings of Tom: ?- sibling(tom, X).
% - To find all grandparents of Alice: ?- grandparent(X, alice).
