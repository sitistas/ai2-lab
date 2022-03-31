fixed(1,1,1).
fixed(2,4,2).
fixed(3,2,4).
fixed(4,1,3).


1{value(X,Y,I): I=1..4}1:-X=1..4, Y=1..4.
window(X,Y,A,B) :-fixed(X,Y,I1), value(A,B,I2), (X-1)/2== (A-1)/2, (Y-1)/2 == (B-1)/2.
window(X,Y,A,B) :-value(X,Y,I1), value(A,B,I2), (X-1)/2== (A-1)/2, (Y-1)/2 == (B-1)/2.

:-fixed(X,Y,I1), value(X,Y,I2), I1!=I2.
:-value(X,Y,I1), value(X,Y,I2), I1!=I2.
:-fixed(X,Y,I1), value(X,Z,I2), Y!=Z, I1=I2.
:-value(X,Y,I1), value(X,Z,I2), Y!=Z, I1=I2.
:-fixed(X,Y,I1), value(Z,Y,I2), X!=Z, I1=I2.
:-value(X,Y,I1), value(Z,Y,I2), X!=Z, I1=I2.
:-window(X,Y,A,B), fixed(X, Y, I), value(A, B, I), X!=A, Y!=B.
:-window(X,Y,A,B), value(X, Y, I), value(A, B, I), X!=A, Y!=B.

% https://ddmler.github.io/asp/2018/07/10/answer-set-programming-sudoku-solver.html#:~:text=Answer%20set%20programming%20is%20a,9).
#show value/3.