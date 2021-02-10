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

