1{tower(I,X,Y):X=1..8, Y=1..8}1:-I=1..4.
1{bishop(I,X,Y):X=1..8,Y=1..8}1:-I=1..4.

occupied(Y):-tower(_,_,Y), Y=1..8.
occupied(Y):-bishop(_,_,Y), Y=1..8.

%Ο Πύργος δε μπορεί να είναι στην ίδια γραμμή ή στήλη με άλλον πύργο ή αξιωματικό
:-tower(I,X,_), tower(J,X,_), I!=J.
:-tower(I,_,Y), tower(J,_,Y), I!=J.
:-tower(I,_,Y), bishop(J,_,Z), Y==Z.
:-tower(I,X,_), bishop(J,Z,_), X==Z.

%Ο αξιωματικός δε μπορεί να βρίσκεται στην ίδια διαγώνιο με άλλο πύργο ή αξιωματικό
:-bishop(I,X,Y), bishop(J,Z,W), (X,Y)!=(Z,W), X+Y==Z+W.
:-bishop(I,X,Y), bishop(J,Z,W), (X,Y)!=(Z,W), X+Y==Z-W.
:-bishop(I,X,Y), tower(J,Z,W), (X,Y)!=(Z,W), X+Y==Z+W.
:-bishop(I,X,Y), tower(J,Z,W), (X,Y)!=(Z,W), X+Y==Z-W.

%Δύο πιόνια δε μπορούν να βρίσκονται στην ίδια θέση
:-bishop(I,X,Y), bishop(J,X,Y),I!=J.
:-tower(I,X,Y), tower(J,X,Y),I!=J.


#show tower/3.
#show bishop/3.