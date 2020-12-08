empty([]).
removeSubList([],[]):- !.
removeSubList([X|Y],R):- is_list(X), not(empty(X)), removeSubList(X,Z), removeSubList(Y,W), append(Z,W,R), !.
removeSubList([X|Y],[X|Z]):- removeSubList(Y,Z).
