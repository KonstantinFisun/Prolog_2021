% Задание 1. Реализовать предикат max(X,Y,Z), где Z максимальное из
% чисел X и Y+


max(X,Y,X):-X>Y,!.

max(_,Y,Y).

%Задание 2. Реализовать предикат max(X,Y,U,Z), где Z максимальное из
%чисел X,Y и U.+
max_1(X,Y,U,X):-X>Y,X>U,!.
max_1(_,Y,U,Y):-Y>U,!.
max_1(_,_,U,U).


max_2(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).


% Задание 3. Реализовать предикат fact(N,X), где X – это факториал
% первого аргумента с помощью рекурсии вверх.+
fact_up(0,1):-!.
fact_up(N,X):-N1 is N-1,fact_up(N1,X1), X is N*X1.

% Задание 4. Реализовать предикат fact(N,X), где X – это факториал
% первого аргумента с помощью рекурсии вниз.+
fact_down(N,X,N,X):-!.
fact_down(I,F,N,X):- I1 is I+1,F1 is F*I1,fact_down(I1,F1,N,X).

fact_down(N,X):-fact_down(0,1,N,X).

% Задание 5. Реализовать предикат fib(N,X), где X – число Фибоначчи с
% номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вверх.+

fib_up(1,1):-!.
fib_up(2,1):-!.
fib_up(N,X):-N1 is N-1,fib_up(N1,X1),N2 is N-2,fib_up(N2,X2), X is X1+X2.


% Задание 6. Реализовать предикат fib(N,X), где X – число Фибоначчи с
% номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вниз.+

fib_down(N,X,_,N,X):-!.
fib_down(I,F1,F2,N,X):-I1 is I+1,F3 is F1+F2,fib_down(I1,F2,F3,N,X).

fib_down(N,X):-fib_down(1,1,1,N,X).


% Задание 7. Найти сумму цифр числа с помощью рекурсии вверх+
sum_digit_up(0,0):-!.
sum_digit_up(N,X):-N1 is N div 10, sum_digit_up(N1,X1),X is X1+N mod 10.


% Задание 8. Найти сумму цифр числа с помощью рекурсии вниз.+
sum_digit_down(N,X):-sum_digit_down(N,0,X).
sum_digit_down(0,X,X):-!.
sum_digit_down(A,Sum,X):-Am is A mod 10,Ad is A div 10,Sum1 is Sum+Am,sum_digit_down(Ad,Sum1,X).


% Задание 9. Найти максимальную цифру числа с помощью рекурсии вверх +
max_digit_up(0,0):-!.
max_digit_up(N,X):-N1 is N div 10, max_digit_up(N1,X1), F is N mod 10, max(F,X1,X) .

%Задание 10. Найти максимальную цифру числа с помощью рекурсии вниз.+
max_digit_down(N,X):-max_digit_down(N,0,X).
max_digit_down(0,X,X):-!. %остановка, когда нет цифр
max_digit_down(A,Max,X):-Am is A mod 10,Ad is A div 10,Am1 is Ad mod 10, max(Am,Am1,C),max(C,Max,U),max_digit_down(Ad,U,X).


% Задание 11.Найти сумму цифр числа, делящихся на 3 с помощью рекурсии
% вверх+ и рекурсии вниз+.
sum_digit_del3_up(0,0):-!.
sum_digit_del3_up(N,X):-N1 is N div 10, sum_digit_del3_up(N1,X1), del3(N,Y), X is X1+Y.

del3(X,Y):- X mod 10 mod 3 =:= 0 , Y is X mod 10,!.
del3(_,Y):-Y is 0,!.


sum_digit_del3_down(N,X):-sum_digit_del3_down(N,0,X).
sum_digit_del3_down(0,X,X):-!.
sum_digit_del3_down(A,Sum,X):- Ad is A div 10,del3(A,Y),Sum1 is Sum+Y, sum_digit_del3_down(Ad,Sum1,X).


% Задание 12. Найти НОД двух чисел. +
nod(A,A,A):-A=\=0,!. % остановка
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,Nod):-A>B,C is A mod B, nod(C,B,Nod).
nod(A,B,Nod):-A<B,C is B mod A, nod(A,C,Nod).

%Проверить число на простоту
prime(N,X):- N mod X =:= 0,!. % делится без остатка, выходим
prime(N,X):- X*X=<N,X1 is X+1,prime(N,X1).

prime(1):-!.
prime(N):-not(prime(N,2)).

%Найти количество делителей числа
divisors(_,0,0):-!.
divisors(N,I,X):-N mod I =:= 0,I1 is I-1, divisors(N,I1,X1), X is X1+1; N mod I=\= 0, I1 is I -1, divisors(N,I1,X1), X is X1.
divisors(N,X):-divisors(N,N,X).



%Задание 13.

% Задание 14. Найти количество чисел, взаимно простых с заданным
% рекурсией вверх+ и рекурсией вниз+



kol_mutually_prime_up(_,0,0):-!.
kol_mutually_prime_up(N,I,X):-nod(N,I,Nod),Nod =:= 1,I1 is I-1,kol_mutually_prime_up(N,I1,X1),X is X1+1; nod(N,I,Nod),Nod =\= 1, I1 is I-1,kol_mutually_prime_up(N,I1,X1), X is X1.
kol_mutually_prime_up(N,X):-kol_mutually_prime_up(N,N,X).



mutually_prime(X,Y,Z):-nod(X,Y,Nod),Nod =:= 1, Z is 1,!.
mutually_prime(_,_,Z):- Z is 0,!.

kol_mutually_prime_down(N,N,X,X):-!.
kol_mutually_prime_down(N,I,Kol,X):- mutually_prime(N,I,Nod),I1 is I+1, Kol1 is Kol+Nod,kol_mutually_prime_down(N,I1,Kol1,X).

kol_mutually_prime_down(N,X):-kol_mutually_prime_down(N,1,0,X).




