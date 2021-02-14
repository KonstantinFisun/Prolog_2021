man(ivan).
man(stepan).
man(dima).
man(korney).
man(kirill).
man(ilya).
man(maksim).
man(vasya).
man(oleg).
man(lesha).
man(sergey).
man(andrew).
man(makar).
man(gleb).
man(mihail).

woman(galina).
woman(maria).
woman(marina).
woman(irina).
woman(olya).
woman(nina).
woman(alina).
woman(nastya).
woman(julia).
woman(anna).
woman(lisa).
woman(tanya).
woman(vera).
woman(sveta).

parent(gleb,ivan).
parent(vera,ivan).

parent(mihail,galina).
parent(sveta,galina).

parent(ivan, stepan).
parent(ivan, marina).
parent(ivan, maksim).
parent(ivan, oleg).
parent(ivan, nina).

parent(galina,stepan).
parent(galina,marina).
parent(galina,maksim).
parent(galina,oleg).
parent(galina,nina).

parent(stepan,dima).
parent(stepan,nastya).
parent(maria,dima).
parent(maria,nastya).

parent(korney,ilya).
parent(marina,ilya).

parent(maksim,vasya).
parent(maksim,lesha).
parent(maksim,anna).

parent(irina,vasya).
parent(irina,lesha).
parent(irina,anna).

parent(sergey,lisa).
parent(sergey,makar).
parent(sergey,tanya).
parent(nina,lisa).
parent(nina,makar).
parent(nina,tanya).

men(X):-man(X),write(X),nl,fail.
women(X):-woman(X),write(X),nl,fail.

children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).
mother(X):-mother(Y,X),write(Y).

son(X,Y):-parent(Y,X),man(X).
son(X):-son(Y,X),write(Y),!.

brother(X,Y):-man(X),mother(Z,X),mother(Z,Y),Y\=X.
brother(X):-brother(Y,X),write(Y),nl,fail.

sister(X,Y):-woman(X),mother(Z,X),mother(Z,Y),Y\=X.
sister(X):-sister(Y,X),write(Y),nl,fail.

b_s(X,Y):-mother(Z,X),mother(Z,Y),X\=Y.
b_s(X):-b_s(Y,X),write(Y),nl,fail.

grand_pa(X,Y):-parent(Z,Y),parent(X,Z),man(X).
grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.

grand_ma(X,Y):-parent(Z,Y),parent(X,Z),woman(X).
grand_mas(X):-grand_ma(Y,X),write(Y),nl,fail.

grand_pa_and_son(X,Y):-man(X),man(Y),(grand_pa(X,Y);grand_pa(Y,X)).

grand_pa_and_da(X,Y):-(woman(X);woman(Y)),(grand_pa(X,Y);grand_pa(Y,X)).

uncle(X,Y):-parent(Z,Y),b_s(Z,X),man(X).
uncle(X):-uncle(Y,X),write(Y),nl,fail.

aunt(X,Y):-parent(Z,Y),b_s(Z,X),woman(X).
aunt(X):-aunt(Y,X),write(Y),nl,fail.
