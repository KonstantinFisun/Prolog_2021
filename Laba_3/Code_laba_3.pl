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




