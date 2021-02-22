%Задание 1. Реализовать предикат чтения списка с клавиатуры и предикат
%вывода списка на экран.
%
read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail). %Чтение списка

write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list(Tail).


%Задание 2. Реализовать предикат sum_list_down(+List, ?Summ), который
%проверяет, является ли Summ суммой элементов списка или записывает в
%эту переменную сумму элементов. Для построения воспользоваться
%рекурсией вниз. Реализовать программу, читающую список, считающую
%сумму элементов и выводящую сумму на экран, с использованием
%предикатов из задания 1 и построенного предиката sum_list_down /2.


sum_list_down(List,Sum):- sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([Head|Tail], S, Sum):- S1 is S+Head,sum_list_down(Tail,S1,Sum).

sum_list:-write("Введите количество элементов"),nl,read(N),read_list(N,List),sum_list_down(List,Sum),write(Sum).


%Задание 3. Построить предикат sum_list_up(+List, ?Summ), который
%проверяет, является ли Summ суммой элементов списка или записывает в
%эту переменную сумму элементов. Для построения воспользоваться
%рекурсией вверх.

sum_list_up([],0):-!.
sum_list_up([Head|Tail],Sum):-sum_list_up(Tail,Sum1),Sum is Sum1+Head.


% Задание 4_1. Построить предикат, list_el_numb(+List, ?Elem, ?Number).
% Если задано значение Elem, то предикат записывает в Number номер
% первого вхождения Elem. Если задано значение Number, то предикат
% записывает в Elem значение, находящееся в списке под номером Number.
% Если заданы оба значения, то предикат проверяет, находится ли элемент
% Elem в списке под номером Numb.

list_el_numb(List,Elem,Number):-list_el_numb(List,Elem,0,Number).
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):-I1 is I+1, list_el_numb(Tail,Elem,I1,Number).


% Задание 4_2. Реализовать программу, которая читает список, читает
% элемент и находит номер первого вхождения элемента в список. В случае,
% если элемент отсутствует, пользователю выводится соответствующее
% сообщение. Воспользоваться предикатами из заданий 1 и 3.

pr4_4:-write("Количество элементов списка: "),read(N),nl,write("Введите список"),read_list(N,List),nl,write("Введите элемент: "),read(Elem),nl,list_el_numb(List,Elem,Number),write(Number),!.

pr4_4:-write("Нет элемента").
