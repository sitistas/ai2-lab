node(1..3).
edge(1,2). edge(1,3). edge(2,1).
edge(2,3). edge(3,1). edge(3,2).
col(r). col(b). col(g).

1 {color(X,Z):col(Z)} 1:-node(X).
:-color(X,Z), color(Y,Z), edge(X,Y).

#show color/2.