% Задание 1. Реализовать предикат max(+X,+Y,?Z), где Z максимальное из
% чисел X и Y


max(X,Y,X):-X>Y,!.

max(_,Y,Y).

%Задание 2. Реализовать предикат max(X,Y,U,Z), где Z максимальное из
%чисел X,Y и U.
%Предикат max_1(+X,+Y,+U,?Z)
max_1(X,Y,U,X):-X>Y,X>U,!.
max_1(_,Y,U,Y):-Y>U,!.
max_1(_,_,U,U).

%Предикат max_2(+X,+Y,+U,?Z)
max_2(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).


% Задание 3. Реализовать предикат fact_up(+N,?X), где X – это факториал
% первого аргумента с помощью рекурсии вверх.

fact_up(0,1):-!.%Дно рекурсии
fact_up(N,X):-N1 is N-1,fact_up(N1,X1), X is N*X1.

% Задание 4. Реализовать предикат fact_down(+N,-X), где X – это
% факториал первого аргумента с помощью рекурсии вниз.

%Предикат fact_down(+I,+Fact,+Num,-X)
%I - счетчик от 1 до Num
%Fact - факториал на определенном шаге
%Num - исходное число, от которого считаем факториал
%X - результат
fact_down(N,X,N,X):-!.%Остановка
fact_down(I,F,N,X):- I1 is I+1,F1 is F*I1,fact_down(I1,F1,N,X).

fact_down(N,X):-fact_down(0,1,N,X).%Для пользователя

% Задание 5. Реализовать предикат fib(+N,?X), где X – число Фибоначчи с
% номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии вверх.

fib_up(1,1):-!.%Дно рекурсии
fib_up(2,1):-!.
fib_up(N,X):-N1 is N-1,fib_up(N1,X1),N2 is N-2,fib_up(N2,X2), X is X1+X2.


% Задание 6. Реализовать предикат fib_down(+N,-X), где X – число
% Фибоначчи с номером N, причем 1 и 2 элемент равны 1 с помощью рекурсии
% вниз.

%Предикат fib_down(+I,+Fib1,+Fib2,+Num,-X)
%I - счетчик от 1 до Num
%Fib1 - первое число Фибоначчи
%Fib2 - второе число Фибоначчи
%Num - номер элемента последовательности Фибоначчи
%X - результат
fib_down(N,X,_,N,X):-!.%Остановка
fib_down(I,F1,F2,N,X):-I1 is I+1,F3 is F1+F2,fib_down(I1,F2,F3,N,X).

fib_down(N,X):-fib_down(1,1,1,N,X).%Для пользователя


% Задание 7. Найти сумму цифр числа с помощью рекурсии вверх
% Предикат sum_digit_up(+N,?X) - где X сумма цифр числа N
sum_digit_up(0,0):-!.%Дно рекурсии
sum_digit_up(N,X):-N1 is N div 10, sum_digit_up(N1,X1),X is X1+N mod 10.


% Задание 8. Найти сумму цифр числа с помощью рекурсии вниз.
% Предикат sum_digit_down(+A,+Sum,-X)
% A - оставшиеся число
% Sum - сумма
% X - результат
sum_digit_down(0,X,X):-!.%Остановка
sum_digit_down(A,Sum,X):-Am is A mod 10,Ad is A div 10,Sum1 is Sum+Am,sum_digit_down(Ad,Sum1,X).

sum_digit_down(N,X):-sum_digit_down(N,0,X).%Для пользователя


% Задание 9. Найти максимальную цифру числа с помощью рекурсии вверх
% Предикат max_digit_up(+N,X?)
max_digit_up(0,0):-!.%Дно рекурсии
max_digit_up(N,X):-N1 is N div 10, max_digit_up(N1,X1), F is N mod 10, max(F,X1,X) .


%Задание 10. Найти максимальную цифру числа с помощью рекурсии вниз.
%Предикат max_digit_down(+N,-X) - для пользователя
max_digit_down(N,X):-N1 is N mod 10,max_digit_down(N,N1,X). %Последнию цифру делаем максимальной

%max_digit_down(+A,+Max,-X)
%A - оставшиеся число
%Max - максимум на данном шаге
%X - результат
max_digit_down(0,X,X):-!. %остановка, когда нет цифр
max_digit_down(A,Max,X):-Am is A mod 10,Ad is A div 10,max(Am,Max,U),max_digit_down(Ad,U,X).


% Задание 11.Найти сумму цифр числа, делящихся на 3 с помощью рекурсии
% вверх и рекурсии вниз.

% Предикат sum_digit_del3_up(+Num,?X) - рекурсия вниз.
sum_digit_del3_up(0,0):-!.%Дно рекурсии
sum_digit_del3_up(N,X):-N1 is N div 10, sum_digit_del3_up(N1,X1), del3(N,Y), X is X1+Y.

% Предикат del3(+X,-Y) возвращает 0 , если последняя цифра X не делится
% на 3, иначе возвращает последнюю цифру
del3(X,Y):- X mod 10 mod 3 =:= 0 , Y is X mod 10,!.
del3(_,Y):-Y is 0.

% Предикат sum_digit_del3_down(+A,+Sum,-X) - рекурсия вниз
% % A - оставшиеся число
% Sum - сумма, делящихся на 3
% X - результат
sum_digit_del3_down(0,X,X):-!.%Остановка
sum_digit_del3_down(A,Sum,X):- Ad is A div 10,del3(A,Y),Sum1 is Sum+Y, sum_digit_del3_down(Ad,Sum1,X).

sum_digit_del3_down(N,X):-sum_digit_del3_down(N,0,X). %Для пользователя


% Задание 12. Найти НОД двух чисел.
% Предикат nod(+A,+B,-Nod).
nod(A,A,A):-A=\=0,!. % остановка
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,Nod):-A>B,C is A mod B, nod(C,B,Nod),!.
nod(A,B,Nod):-C is B mod A, nod(A,C,Nod).

%Проверить число на простоту
%Предикат prime(+Num,+X)
%Num - исходное число
%X - счетчик от 2 до Num
prime(N,N):-!.
prime(N,X):-N mod X =:= 0,!,fail. %Если делится, то выходим
prime(N,X):- X1 is X+1,prime(N,X1).

prime(1):-!.
prime(2):-!.
prime(N):-prime(N,2).%Для пользователя


%Найти количество делителей числа
%Предикат divisors(+N,+I,?X) - рекурсия вниз
divisors(_,0,0):-!.%Дно рекурсии
divisors(N,I,X):-N mod I =:= 0,I1 is I-1, divisors(N,I1,X1), X is X1+1,!; N mod I=\= 0, I1 is I -1, divisors(N,I1,X1), X is X1.
divisors(N,X):-divisors(N,N,X1),X is X1-1.%Для пользователя, убираем делитель который равен своему числу



%Задание 13.
% Предикат kollanz(+Number) - находит число, при котором цепочка
% Коллатца имеет максимальную длину
%Последовательность начинается с 1, размером 1.
kollanz(Number):-kollanz(1,1,1,Number).

kollanz(1000000,Iteration,_,Iteration):-!. %Условие остановки, если число больше миллиона

% Предикат kollanz(+Number,+Iteration,+Max_Iteration,-Max_Number) - рекурсия вниз
% Number - счетчик от 1 до 1000000
% Iteration - число, при котором цепь максимальна
% Lenght - максимальная длина цепочки на данный момент
% Max_Number - результат вычислений

kollanz(Number,Iteration,Max_Iteration,Max_Number):-New_number is Number+1,kollanz_chain(New_number,1,Lenght),
    (Lenght>Max_Iteration -> kollanz(New_number,New_number,Lenght,Max_Number);
    kollanz(New_number,Iteration,Max_Iteration,Max_Number)).


% Предикат kollanz_chain(+Number,+Lenght,-Result),возвращает длину цепочки,
% которая начинается с Number,
kollanz_chain(1,Result,Result):-!.
kollanz_chain(Number,Lenght,Result):-Lenght1 is Lenght+1,(Number mod 2 =:= 0 -> New_Number is Number/2,kollanz_chain(New_Number,Lenght1,Result);New_Number is (Number*3+1),kollanz_chain(New_Number,Lenght1,Result)).


% Задание 14. Найти количество чисел, взаимно простых с заданным
% рекурсией вверх и рекурсией вниз


%Предикат kol_mutually_prime_up(+Num,+I,?X) - рекурсия вверх
%Num - исходное число
%I - счетчик от 1 до Num
%X - результат
kol_mutually_prime_up(_,0,0):-!.%Дно рекурсии
kol_mutually_prime_up(N,I,X):-nod(N,I,Nod),Nod =:= 1,I1 is I-1,kol_mutually_prime_up(N,I1,X1),X is X1+1,!;I1 is I-1,kol_mutually_prime_up(N,I1,X1), X is X1.
kol_mutually_prime_up(N,X):-kol_mutually_prime_up(N,N,X).


% Предикат mutually_prime(+X,+Y,-Z) - возвращает один если nod(X,Y,1),
% иначе 0
mutually_prime(X,Y,Z):-nod(X,Y,Nod),Nod =:= 1, Z is 1,!.
mutually_prime(_,_,Z):- Z is 0,!.

%Предикат kol_mutually_prime_down(+Num,+I,+Kol,-X) - рекурсия вниз
%Num - исходное число
%I - счетчик от 1 до Num
%Kol - количество на данном шаге
%X - результат
kol_mutually_prime_down(N,N,X,X):-!.%Остановка
kol_mutually_prime_down(N,I,Kol,X):- mutually_prime(N,I,Nod),I1 is I+1, Kol1 is Kol+Nod,kol_mutually_prime_down(N,I1,Kol1,X).

kol_mutually_prime_down(N,X):-kol_mutually_prime_down(N,1,0,X).


%Задание 15. Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа.

mutually(0,_,0):-!.
mutually(N,I,X):-N1 is N div 10, mutually(N1,I,X1), F is N mod 10,mutually_prime(F,I,Z), X is X1+Z. %В переменную X записывается количество взаимно простые с цифрами данного числа

% Находим наш делитель с помощью рекурсии вниз, во первых находим
% делитель исходного числа, проверяем с помощью предиката mutually
% количество взаимно простых, далее проверяем чтобы оно было больше
% предыдущего значения, записываем его и его делитель.
delitel(0,_,_,Del,Del):-!.
delitel(I,N,Max_Mut,Del_Iteration,Del):-(N mod I =:= 0,mutually(N,I,Z),Z>Max_Mut -> Max is Z, Del_Iteration1 is I,I1 is I-1,
                                        delitel(I1,N,Max,Del_Iteration1,Del);
                                        I1 is I-1,delitel(I1,N,Max_Mut,Del_Iteration,Del)).


delitel(N,X):-delitel(N,N,0,0,X).%Для пользователя: предикат delitel(+Number,-Delit), где Number исходное число, Delit - делитель, который является взаимно простым с большим количеством цифр



%Задание 16. Найдите количество чисел, меньшее 20000,
%которые нельзя представить в виде суммы двух чисел с избытком.

%Находим сумму делителей числа

%Основной предикат divisors_sum(Number,I,Summ)
%Number - число, от которого ищем сумму делителей
%I - счетчик
%Summ - вычисление суммы

divisors_sum(_,0,0):-!.
divisors_sum(N,I,X):-N mod I =:= 0,I1 is I-1, divisors_sum(N,I1,X1), X is X1+I,!; N mod I=\= 0, I1 is I -1, divisors_sum(N,I1,X1), X is X1.
%Предикат для пользователя divisors_sum(+Number,-Summ)
divisors_sum(N,X):-(N<0 -> N1 is N*(-1),divisors_sum(N1,N1,X1),X is X1-N1;divisors_sum(N,N,X1),X is X1-N).

%Предикат проверки на избыточность числа
redundant(Num):-divisors_sum(Num,Summ),Num<Summ.

%Предикат проверки на то, что число можно разложить на 2 избыточных
summand(Num):-Number1 is 1,Number2 is Num-1,summand(Number1,Number2).
summand(Number1,Number2):-redundant(Number1),redundant(Number2),!.
summand(Number1,Number2):-Number1_1 is Number1 +1,Number2_1 is Number2-1,Number1=<Number2,summand(Number1_1,Number2_1).

%Предикат перебора всех чисел от 1 до 20000
kol_not_summand(Kol):-kol_not_summand(12,0,Kol).
kol_not_summand(20000,Kol,Kol):-!.
kol_not_summand(I,Kol,Kolvo):-(summand(I)->Kol1 is Kol;write(I),nl,Kol1 is Kol+1),I1 is I+1,kol_not_summand(I1,Kol1,Kolvo).


