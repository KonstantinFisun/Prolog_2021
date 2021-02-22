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
