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


%Задание 5. Реализовать программу, которая читает список, читает номер
%элемента и находит соответствующий элемент. В случае, если номер
%некорректный, пользователю выводится соответствующее сообщение.

pr4_5:-write("Количество элементов списка: "),read(N),nl,write("Введите список"),read_list(N,List),nl,write("Введите номер элемента: "),read(Number),nl,list_el_numb(List,Elem,Number),write(Elem),!.
pr4_5:-write("Нет элемента с таким номером").



%Задание 6. Реализовать предикат min_list_up(+List, ?Min), который
%записывает минимальный элемент списка List в переменную Min или
%проверяет, является ли значение в переменной Min минимальным
%элементом в списке List. Реализацию провести рекурсией вверх.

min_list_up([], 1000):-!.
min_list_up([Head|Tail], Min):-min_list_up(Tail,Min1),(Head<Min1 -> Min is Head;Min is Min1).


%Задание 7. Реализовать предикат min_list_down(+List, ?Min), который
%записывает минимальный элемент списка List в переменную Min или
%проверяет, является ли значение в переменной Min минимальным
%элементом в списке List. Реализацию провести рекурсией вниз.


min_list_down([],Min,Min):-!.
min_list_down([Head|Tail],M,Min):-(Head<M -> M1 is Head;M1 is M),min_list_down(Tail,M1,Min).
min_list_down(List,Min):- min_list_down(List,1000,Min).



%Задание 8. Реализовать программу, которая читает список, находит и
%выводит на экран его минимальный элемент. Воспользоваться
%предикатами из заданий 1, 6 или 7.

pr4_8:-write("Количество элементов списка: "),read(N),nl,write("Введите список"),read_list(N,List),min_list_down(List,Min),write("Минимальный элемент списка: "),write(Min),!.


%Задание 9. Построить предикат, который возвращает true, если элемент
%есть в списке.

m_list([El|_],El).
m_list([_|Tail],El):-m_list(Tail,El).


%Задание 10. Построить предикат, который переворачивает список.
append([],List2,List2).
append([H|T1],List2,[H|T2]):-append(T1,List2,T2).

%Оказывается reverse заблочен(
rever([],_):-!.
rever([Head|Tail],List):-reverse(Tail,List1),append(Head,List,List1).

