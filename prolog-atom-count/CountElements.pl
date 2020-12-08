removeAll(_,[],[],0):- !.
removeAll(Elem,[Elem|T],L,N):- removeAll(Elem,T,L,N1), N is N1+1, !.
removeAll(Elem,[X|T1],[X|T2],N):- removeAll(Elem,T1,T2,N).
countElem([],[]):- !.
countElem([X|T],[[X,N]|C]):- removeAll(X,[X|T],L,N), countElem(L,C).
