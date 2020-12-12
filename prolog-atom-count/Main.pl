empty([]).
removeSubList([],[]):- !.
removeSubList([X|Y],R):- is_list(X), not(empty(X)), removeSubList(X,Z), removeSubList(Y,W), append(Z,W,R), !.
removeSubList([X|Y],[X|Z]):- removeSubList(Y,Z).

removeVars([],[]):- !.
removeVars([X|Y],R):- var(X), removeVars(Y,R), !.
removeVars([X|Y],[X|Z]):- removeVars(Y,Z).

belongsTo(Elem, [Elem|_]):- !.
belongsTo(Elem, [_|Y]):- belongsTo(Elem, Y).

sharedElements([], _, []).
sharedElements([A|B], C, [A|D]):- atomic(A), belongsTo(A, C), sharedElements(B, C, D), !.
sharedElements([_|B], C, D):- sharedElements(B, C, D), !.

concatSharedElements(A, B, C):- sharedElements(A, B, X), sharedElements(B, A, Y), append(X, Y, C).

removeAll(_,[],[],0):- !.
removeAll(Elem,[Elem|T],L,N):- removeAll(Elem,T,L,N1), N is N1+1, !.
removeAll(Elem,[X|T1],[X|T2],N):- removeAll(Elem,T1,T2,N).
countElem([],[]):- !.
countElem([X|T],[[X,N]|C]):- removeAll(X,[X|T],L,N), countElem(L,C).

countAtoms(L1, L2, Lout):- removeSubList(L1,L1rem), removeSubList(L2,L2rem), removeVars(L1rem,L1mod), removeVars(L2rem,L2mod), concatSharedElements(L1mod, L2mod, L), countElem(L,Lout).
