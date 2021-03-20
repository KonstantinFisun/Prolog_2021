%Предикат write_str(+Str) - вывод строки
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

% Предикат read_str(-Str,-Lenght,+Flag) - чтение строки и подсчет
% количества символов в ней, с флагом.
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.%Остановка
r_str(10,A,A,N,N,0):-!.%Остановка
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).


read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).





%Находит файл, записывает информацию,read_list_str - читает набор строк
pr:-	see('c:/Prolog/1111.txt'),read_list_str(List), seen, write_list_str(List),
		tell('c:/Prolog/111.txt'), write_list_str(List),told.


%Задание 1. Прочитать из файла строки и вывести длину наибольшей строки.
pr8_1:- see('c:/Prolog/1111.txt'), read_list_str(_, LengthList), seen, max(LengthList, Max), write(Max).


read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).

max(List, MaxEl):- max(List, 0, MaxEl).
max([],CurMax, CurMax):- !.
max([H|T], CurMax, X):- H > CurMax, NewMax is H, max(T,NewMax,X), !.
max([_|T], CurMax, X):- max(T, CurMax, X).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).



%Задание 2. Дан файл. Определить, сколько в файле строк, не содержащих пробелы.
pr8_2:-  see('c:/Prolog/1111.txt'),read_list_str(List), seen, stroke_space(List,0,Num),nl,write(Num).

% Предикат stroke_space(+List_str,+Num,-Num_space) - перебор всех строк
% рекурсия вниз
stroke_space([],Num,Num):-!.
stroke_space([Head|Tail],Num,Num_space):-(count_of_space(Head)->name(Head1,Head), write(Head1),nl,Num1 is Num+1,stroke_space(Tail,Num1,Num_space);stroke_space(Tail,Num,Num_space)).

%Предика count_of_space(+Str) - если в строке есть пробел то false
count_of_space([]):-!.
count_of_space([Head|_]):-Head is 32,!,fail.
count_of_space([_|Tail]):-count_of_space(Tail).



%3.Дан файл, найти и вывести на экран только те строки, в которых букв
%А больше, чем в среднем на строку

pr8_3:-see('c:/Prolog/1111.txt'),read_list_str(List), seen,
       count_of_A(List,[],List_Kolvo),average(List_Kolvo,Ave),a_bigger_ave(List,Ave).

% Предикат count_of_A(+List_str,+I,-List_Kolvo) - находим в каждой
% строке количество букв A

count_of_A([],List_Kolvo_A,List_Kolvo_A):-!.
count_of_A([Head|Tail],I,List_Kolvo):-count_of_A_in_str(Head,0,Kolvo_A),append(I,[Kolvo_A],I1),count_of_A(Tail,I1,List_Kolvo).

% Предикат count_of_A_in_str(+Str,I,-Kolvo_A) - считает количество A в
% Str

count_of_A_in_str([],Kolvo_A,Kolvo_A):-!.
count_of_A_in_str([Head|Tail],I,Kolvo_A):-(Head is 65->I1 is I+1,count_of_A_in_str(Tail,I1,Kolvo_A);count_of_A_in_str(Tail,I,Kolvo_A)).

%Предикат average(+List,-Ave) - считает среднее в списке

average(List_Kolvo,Ave):-average(List_Kolvo,0,Sum,0,Num),Ave is Sum / Num.

% Предикат average(+List,+I_Sum,-Sum,+I_Num,-Num) - возвращает
% количество и сумму элементов списка

average([],I_Sum,I_Sum,I_Num,I_Num):-!.
average([Head|Tail],I_Sum,Sum,I_Num,Num):-I1_Sum is I_Sum+Head,I1_Num is I_Num+1,average(Tail,I1_Sum,Sum,I1_Num,Num).

%Предикат a_bigger_ave(+List_str,+Ave) - выводит строки где,букв
%А больше, чем в среднем на строку

a_bigger_ave([],_):-!.
a_bigger_ave([Head|Tail],Ave):-count_of_A_in_str(Head,0,Kolvo_a),(Kolvo_a>Ave->name(Head1,Head),write(Head1),nl,a_bigger_ave(Tail,Ave);
	     a_bigger_ave(Tail,Ave)).


