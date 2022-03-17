house(1..5). col(r;g;b;w;y). man(n;b;s;d;g). drink(c;w;m;b;t). cigarettes(pm;d;b;bm;p). pet(c;d;b;f;h).

%Γεννήτρια πιθανών λύσεων
1{lives(X,Y):house(Y)}1:-man(X). %Ο Χ μένει στο Υ σπίτι
1{smokes(X,Y):cigarettes(Y)}1:-man(X). %Ο Χ καπνίζει την Υ μάρκα
1{drinks(X,Y):drink(Y)}1:-man(X). %Ο Χ πίνει το Υ είδος ποτού
1{hasPet(X,Y):pet(Y)}1:-man(X). %Ο Χ έχει το κατοικίδιο Υ
1{hasColor(X,Y):col(Y)}1:-house(X). %Το Χ σπίτι έχει Υ χρώμα

%Μοναδικότητα Επιλογών
:-lives(X,Y), lives(Z,Y), X!=Z.
:-smokes(X,Y), smokes(Z,Y), X!=Z.
:-drinks(X,Y), drinks(Z,Y), X!=Z.
:-hasPet(X,Y), hasPet(Z,Y), X!=Z.
:-hasColor(X,Y), hasColor(Z,Y), X!=Z.

%Περιορισμοί
%1.the Brit lives in the red house
:-lives(b,Y), hasColor(Y,Z),Z!=r.
%2.the Swede keeps dogs as pets
:-hasPet(s,Y), Y!=d.
%3.the Dane drinks tea
:-drinks(d,Y),Y!=t.
%4. the green house is on the left of the white house
:-hasColor(Y,w), hasColor(X,g), Y!=X+1.
%5. the green house's owner drinks coffee
:-lives(X,Y), hasColor(Y,g),drinks(X,Z), Z!=c.
%6.he person who smokes Pall Mall rears birds
:-smokes(X,pm), hasPet(X,Y), Y!=b.
%7. the owner of the yellow house smokes Dunhill
:-lives(X,Y), hasColor(Y,y), smokes(X,Z), Z!=d.
%8.the man living in the center house drinks milk
:-lives(X,3), drinks(X,Z), Z!=m.
%9. the Norwegian lives in the first house
:-lives(n,Z), Z!=1.
%10.the man who smokes blends lives next to the one who keeps cats
:-smokes(X,b), hasPet(Y,c), lives(X,Z), lives(Y,W), |Z-W|!=1.
%11.the man who keeps horses lives next to the man who smokes Dunhill
:-hasPet(X,h), lives(X,Z), smokes(Y,d), lives(Y,W), |Z-W|!=1.
%12.the owner who smokes BlueMaster drinks beer
:-smokes(X,bm), drinks(X,Z), Z!=b.
%13. the German smokes Prince
:-smokes(g,Y), Y!=p.
%14.the Norwegian lives next to the blue house
:-lives(n,X), hasColor(Y,b), |X-Y|!=1.
%15. the man who smokes blend has a neighbor who drinks water

%Αποτελέσματα
#show hasPet/2.
% #show hasColor/2.
% #show smokes/2.
% #show lives/2.
% #show drinks/2.
% :-lives(n,Y), Y!=1.