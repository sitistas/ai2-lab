fixed(1,1,5). fixed(1,2,3). fixed(1,5,7).
fixed(2,1,6). fixed(2,4,1). fixed(2,5,9). fixed(2,6,5).
fixed(3,2,9). fixed(3,3,8). fixed(3,8,6).
fixed(4,1,8). fixed(4,5,6). fixed(4,9,3).
fixed(5,1,4). fixed(5,4,8). fixed(5,6,3). fixed(5,9,1).
fixed(6,1,7). fixed(6,5,2). fixed(6,9,6).
fixed(7,2,6). fixed(7,7,2). fixed(7,8,8).
fixed(8,4,4). fixed(8,5,1). fixed(8,6,9). fixed(8,9,5).
fixed(9,5,8). fixed(9,8,7). fixed(9,9,9).

1{value(X,Y,I): I=1..9}1:-X=1..9, Y=1..9.
window(X,Y,A,B) :-value(X,Y,I1), value(A,B,I2), (X-1)/3== (A-1)/3, (Y-1)/3 == (B-1)/3.
window(X,Y,A,B) :-fixed(X,Y,I1), value(A,B,I2), (X-1)/3== (A-1)/3, (Y-1)/3 == (B-1)/3.

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