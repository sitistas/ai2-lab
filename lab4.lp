#const m=4.
peg(a;b;c). disk(1..m). at(1..m,a,0).

goal(1..m,c).
:-goal(D,P), not at(D,P,n).
#const n=15.

%Effect Axiom
at(D,P,T+1):-move(D,P,T), T<n.

% Frame Axiom
at(D,P,T+1):-at(D,P,T), not move(D, _, T), T<n.

1{move(D,P,T): disk(D), peg(P)}1:-T = 0..n-1.

:- at(D,P1,T), move(D,P2,T), P1==P2.
:- at(D1,P,T), move(D2,P,T), D2>D1.
:- at(D1,P,T), at(D2, P, T), move(D2,_,T), D2>D1.

#show move/3.