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
append1([],List2,List2).
append1([H|T1],List2,[H|T2]):-append1(T1,List2,T2).

%Оказывается reverse заблочен(
rever([],_):-!.
rever([Head|Tail],List):-reverse(Tail,List1),append1(Head,List,List1).



%Задание 11. Построить предикат p(Sublist,List), который возвращает true,
%если элементы Sublist встречается в List в том же порядке.

p([],_):-!.
p([Head|Tail],List):-m_list(List,Head),p(Tail,List).


%Задание 12. Построить предикат, который удаляет элемент с заданным
%номером из списка.

delete_num(0,[_|Z],Z):- !.
delete_num(X,[Head|Y],[Head|Z]) :- X1 is X-1,delet(X1,Y,Z).

%Задание 13. Построить предикат, который удаляет все элементы, равные
%данному.

delete_elem(Head,[Head|Z],Z):-!.
delete_elem(X,[Head|Y],[Head|Z]):-delete_elem(X,Y,Z).

%Задание 14. Построить предикат, который проверяет, встречаются ли все
%элементы в списке ровно 1 раз.

replay(_,[]):-!.
replay(X,[Head|Tail]):- X =\= Head,replay(X,Tail).
replay([Head|Tail]):-replay(Head,Tail),replay(Tail).
replay([]):-!.


%Задание 15.so Построить предикат, который строит новый список,
%составленный из уникальных элементов введенного, то есть убирает все
%повторы, например из списка [1,1,2,3,3,3] получает список [1,2,3].


members(H,[H|_]).
members(H,[_|T]):-members(H,T).
no_duble([H|T],T1):-members(H,T),no_duble(T,T1).
no_duble([H|T],[H|T1]):-not(members(H,T)),no_duble(T,T1).
no_duble([],[]).


%Задание 16. Построить предикат, который получает для данного элемента
%количество раз, которое он встречается в списке.

counter([],_,0).
counter([Head|Tail],Head,Num) :- counter(Tail,Head,Num1), Num is Num1+1.
counter([X|Tail],Head,Num) :- X =\= Head, counter(Tail,Head,Num).

%Задание 17. Построить предикат, получающий длину списка.
lenght([],L,L):-!.
lenght([_|Tail],I,L):-I1 is I+1,lenght(Tail,I1,L).
lenght(List,L):-lenght(List,0,L).


%Задача 1.1 Дан целочисленный массив. Необходимо найти количество
%элементов, расположенных после последнего максимального.

num_after_max([],0,0,_):-!.
num_after_max([Head|Tail], Max,I,Num):-num_after_max(Tail,Max1,I1,Num1),I is I1+1,(Head>Max1-> Max is Head,Num is I1;Max is Max1,Num is Num1).
num_after_max([Head|Tail],Num):- num_after_max([Head|Tail],_,_,Num).


pr18_1:-write("Количество элементов списка: "),read(N),nl,write("Введите список"),read_list(N,List),num_after_max(List,Num),write("Количество элементов, расположенных после последнего максимального: "),write(Num),!.


%Задача 1.2 Дан целочисленный массив. Необходимо найти индекс
%минимального элемента.

index_min(List,Num):-min_list_up(List,Min),list_el_numb(List,Min,Num).

pr18_2:-write("Количество элементов списка: "),read(N),nl,write("Введите список"),read_list(N,List),index_min(List,Num),write("Индекс минимального элемента: "),write(Num),!.


%1.14 Дан целочисленный массив и интервал a..b. Необходимо найти
%количество элементов в этом интервале.

kol_sym_interval(_,[],0):-!.
kol_sym_interval(List,[Head|Tail],Num):-kol_sym_interval(List,Tail,Num1),counter(List,Head,Kol), Num is Num1+Kol.

pr18_14:-write("Количество элементов списка: "),read(N1),nl,write("Введите список"),read_list(N1,List1),
    write("Количество элементов интервала: "),read(N2),nl,write("Введите интервал"),read_list(N2,List2),
    kol_sym_interval(List1,List2,Num),write("Количество символов из интервала: "),write(Num),!.


%1.16 Дан целочисленный массив. Необходимо найти элементы,
%расположенные между первым и вторым максимальным.

%Находим номера максимальных
max_list_up([], 0,0):-!.
max_list_up([Head|Tail], Max,Max_2):-max_list_up(Tail,Max1,Max1_2),(Head>Max1 -> Max is Head,Max_2 is Max1; Head<Max1,Head>Max1_2 -> Max is Max1,Max_2 is Head; Max is Max1, Max_2 is Max1_2).



%предикат удаления на интервале
interval([],_,_,[],_):-!.
interval([Head|Tail],Number1,Number2,List2,I):-I1 is I+1,interval(Tail,Number1,Number2,List3,I1),(I<Number2,I>Number1 -> append1([Head],List3,List2);append1([],List3,List2)).
interval(List1,Number1,Number2,List2):-interval(List1,Number1,Number2,List2,0).

%Основной предикат
elem_between_max(List1,List2):-max_list_up(List1,Max,Max_2),list_el_numb(List1,Max,Number1),list_el_numb(List1,Max_2,Number2),(Number2>Number1 -> interval(List1,Number1,Number2,List2);interval(List1,Number2,Number1,List2)).



%1.26 Дан целочисленный массив. Необходимо найти количество
%элементов между первым и последним минимальным.

num_min([],10000,_,_):-!.
num_min([Head|Tail], Min,I,Num):-I1 is I+1,num_min(Tail,Min1,I1,Num1),(Head<Min1-> Min is Head,Num is I1-2;Min is Min1,Num is Num1).
num_min([Head|Tail],Num):- num_min([Head|Tail],_,0,Num).

%1.29 Дан целочисленный массив и интервал a..b. Необходимо проверить
%наличие максимального элемента массива в этом интервале.
%Находим границы интервала
inter(List,Number1,Number2):-list_el_numb(List,Number1,0),list_el_numb(List,Number2,1).

max_in_interval(List,Interval):-inter(Interval,Num1,Num2),max_list_up(List,Max,_), Max<Num2,Max>Num1.




%1.38 Дан целочисленный массив и отрезок a..b. Необходимо найти
%количество элементов, значение которых принадлежит этому отрезку.

kol_belongs_otrezok(List,Otrezok,Kol):-inter(Otrezok,Num1,Num2),kol_belongs(List,Kol,Num1,Num2).
kol_belongs([],0,_,_):-!.
kol_belongs([Head|Tail],Kol,Num1,Num2):-kol_belongs(Tail,Kol1,Num1,Num2),(Head>=Num1,Head=<Num2 -> Kol is Kol1+1; Kol is Kol1).


%1.44 Дан массив чисел. Необходимо проверить, чередуются ли в нем
%целые и вещественные числа.

alternates(_,[]):-!.
alternates([Head|Tail],[Head1|Tail1]):-( (integer(Head),not(integer(Head1))) ; ( not(integer(Head)),integer(Head1)) ) ,alternates(Tail,Tail1).
alternates([Head|Tail]):-alternates([Head|Tail],Tail).



% 1.50. Для двух введенных списков L1 и L2 построить новый список,
% состоящий из элементов, встречающихся только в одном из этих списков и
% не повторяющихся в них.
%1 проверить чтобы не было повторов


%Формируем список из элементов которые не повторяются

not_repeat([],[]):-!. %Завершение
not_repeat([Head|Tail],Ys):-member(Head,Tail),!,not_repeat(Tail,Ys).
not_repeat([Head|Tail1],[Head|Tail2]):-member(Head,Tail1),!,not_repeat(Tail1,Tail2).

subtra_ct([],_,[]):-!.
subtra_ct([E|T],D,R):-memberchk(E,D),!,subtract(T,D,R).
subtra_ct([H|T],D,[H|R]):-subtract(T,D,R).

%unique([Head1|Tail1],[Head2|Tail2],List4):-

