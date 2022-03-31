1	{	tower(I,X,Y):	X=1..8,	Y=1..8	}	1	:-	I=1..4.
1	{	bishop(I,X,Y):	X=1..8,	Y=1..8	}	1	:-	I=1..4.
occupied(Y)	:-	tower(_,_,Y),	Y=1..8.
occupied(Y)	:-	bishop(_,_,Y),	Y=1..8.
:-	tower(I,X,Y),	tower(J,X,Z),		I	!=	J.
:-	tower(I,X,Y),	tower(J,Z,Y),		I	!=	J.
:-	bishop(I,X,Y),	bishop(J,Z,W),	X-Z	==	Y-W,		I	!=	J.
:-	bishop(I,X,Y),	bishop(J,Z,W),	Z-X	==	Y-W,		I	!=	J.
:-	tower(I,X,Y),	bishop(J,X,W).
:-	tower(I,X,Y),	bishop(J,Z,Y).
:-	tower(I,X,Y),	bishop(J,Z,W),	Z-X	==	W-Y.
:-	tower(I,X,Y),	bishop(J,Z,W),	Z-X	==	Y-W.
:-	tower(I,X,Y),	bishop(J,Z,W),	X-Z	==	W-Y.
:-	tower(I,X,Y),	bishop(J,Z,W),	X-Z	==	Y-W.
:-	not	occupied(Y),	Y=1..8.
#show	tower/3.
#show	bishop/3.