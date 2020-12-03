% database

belongs_to(Elem, [Elem|Y]).
belongs_to(Elem, [X|Y]) :- belongs_to(Elem, Y).

concat([], X, X).
concat([A|B], X, [A|Y]) :- concat(B, X, Y). 

shared_elements([], C, []).
shared_elements([A|B], C, [A|D]) :- atomic(A), belongs_to(A, C), shared_elements(B, C, D), !.
shared_elements([A|B], C, D) :- shared_elements(B, C, D), !.

concat_shared_elements(A, B, C) :- shared_elements(A, B, X), shared_elements(B, A, Y), concat(X, Y, C).