
% Предикат read_str(-Str,-Lenght) - чтение строки и подсчет количества
% символов в ней
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.%Остановка
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

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


% Задание 1.1. Прочитать из файла строки и вывести длину наибольшей
% строки.
pr8_1_1:- see('c:/Prolog/1111.txt'), read_list_str(_, LengthList), seen, max(LengthList, Max), write(Max).


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



% Задание 1.2. Дан файл. Определить, сколько в файле строк, не
% содержащих пробелы.
pr8_1_2:-  see('c:/Prolog/1111.txt'),read_list_str(List), seen, stroke_space(List,0,Num),nl,write(Num).

% Предикат stroke_space(+List_str,+Num,-Num_space) - перебор всех строк
% рекурсия вниз
stroke_space([],Num,Num):-!.
stroke_space([Head|Tail],Num,Num_space):-(count_of_space(Head)->name(Head1,Head), write(Head1),nl,Num1 is Num+1,stroke_space(Tail,Num1,Num_space);stroke_space(Tail,Num,Num_space)).

%Предика count_of_space(+Str) - если в строке есть пробел то false
count_of_space([]):-!.
count_of_space([Head|_]):-Head is 32,!,fail.
count_of_space([_|Tail]):-count_of_space(Tail).



%1.3.Дан файл, найти и вывести на экран только те строки, в которых букв
%А больше, чем в среднем на строку

pr8_1_3:-see('c:/Prolog/1111.txt'),read_list_str(List), seen,
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


%1.4. Дан файл, вывести самое частое слово.

% Нужно сформировать список из всех слов а потом в нем находить
% популярное
pr8_1_4:-see('c:/Prolog/1111.txt'),read_list_str(List), seen,words_in_all_str(List,[],List_frequent),unique_elems(List_frequent,Unique_words),counts(Unique_words,C,List_frequent),indOfMax(C,Ind),el_by_number(Unique_words,Ind,Word),name(Word1,Word),write("Самое популярное слово : "),write(Word1).


% Предикат words_in_all_str(+List_str,-List_frequent):-возвращает список
% всех слов
words_in_all_str([],List_frequent,List_frequent):-!.
words_in_all_str([Head|Tail],I,List_frequent):-get_words(Head,Words),append(I,Words,I1),words_in_all_str(Tail,I1,List_frequent).

%Предикат get_words(+Str,-Words) - получает список слов
get_words(A,Words):-get_words(A,[],Words).

get_words([],List_words,List_words):-!.
get_words(Str,Words,List_words):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),
    Word \=[],append(Words,[Word],New_list_word),get_words(New_Str_after_word,New_list_word,List_words),!.
get_words(_,List_words,List_words).

%Предикат, который получает для данного элемента
%количество раз, которое он встречается в списке. - убирает повторы
counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-
	count(Word,Words,Count),counts(T_words,T_counts,Words).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count, X):- Count1 is Count + 1, count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).

%Находим элемент под индексом
el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([],_,_,nil):-!.
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

%Предикат построения списка из уникальных элементов
unique_elems([], []):- !.
unique_elems([H|T], List2):- unique_elems([H|T], List2, []).
unique_elems([], CurList, CurList):- !.
unique_elems([H|T], List, []):- unique_elems(T, List, [H]), !.
unique_elems([H|T], List, CurList):-
	not(contains(CurList, H)), append(CurList, [H], NewList), unique_elems(T, List, NewList), !.
unique_elems([_|T], List, CurList):- unique_elems(T, List, CurList).

contains([], _):- !, fail.
contains([H|_], H):- !.
contains([_|T], N):- contains(T, N).

%Получаем индекс максимального элемента
indOfMax(X,Y):-indexOfMin(X,Y).
indexOfMin([], -1):- !.
indexOfMin([H|T], X):-indexOfMin(T, 1, 1, X, H).
indexOfMin([], _, MinInd, MinInd, _):-!.
indexOfMin([H|T], CurInd, _, X, CurMin):-
	H > CurMin, NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, NewCurInd, X, H), !.
indexOfMin([_|T], CurInd, MinInd, X, CurMin):-
	NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, MinInd, X, CurMin).

%Предикат skip_space(+Str,-New_Str) - пропуск пробелов в начале строки
skip_space([32|Tail],New_Str):-skip_space(Tail,New_Str),!.
skip_space(New_Str,New_Str).%Возврат строки без пробела

% Предикат get_word(+Str,-Word,-New_Str_after_word) - считывает из
% строки слово
get_word([],[],[]):-!. %Остановка если пришла пустая строка
get_word(Str,Word,New_Str_after_word):-get_word(Str,[],Word,New_Str_after_word).

get_word([],Word,Word,[]).%Возвращаем пустую строку если после слова ничего нет
get_word([32|T],Word,Word,T):-!. % Считываем до пробела и возвращаем строку без него
get_word([H|T],W,Word,New_Str_after_word):-append(W,[H],W1),get_word(T,W1,Word,New_Str_after_word). % Считываем символы слова



% 1.5. Дан файл, вывести в отдельный файл строки, состоящие из слов, не
%повторяющихся в исходном файле.

%Берем все слова, оставлем только уникальные
% Рассматриваем строку, если в ней все слова совпадают с этим списком то
% выводим эту строку


pr8_1_5:-see('c:/Prolog/1111.txt'),read_list_str(List), seen, words_in_all_str(List,[],All_words),not_repeat(All_words,Unique_words),
	tell('c:/Prolog/111.txt'),сoincidence(List,Unique_words),told.

% Предикат сoincidence(+List_str,+Unique_words,+Iter,-Correct_str)-
% смотрит, чтобы все слова строки были в unique_words

сoincidence([],_):-!.
сoincidence([Head|Tail],Unique_words):-(get_words(Head,Words_Head),coin_str(Words_Head,Unique_words)->write_str(Head),nl,сoincidence(Tail,Unique_words);сoincidence(Tail,Unique_words)).

% Предикат coin_str(+Words_Str,+Unique_words) - возвращает true, если
% все слова Str сопадают с уникальными
coin_str([],_):-!.
coin_str([Head|Tail],Unique_words):-m_list(Unique_words,Head),coin_str(Tail,Unique_words).

m_list([El|_],El):-!.
m_list([_|T],El):-m_list(T,El).

%Формируем список из элементов которые не повторяются(Лаба 4)?
del(_,[],[]):-!.
del(Head,[Head|Tail],Res) :- del(Head,Tail,Res),!.
del(Head,[Head1|Tail],[Head1|Res]) :- not(Head = Head1),del(Head,Tail,Res).

not_repeat([],[]):-!.
not_repeat([Head|Tail],[Head|Res]) :- not(m_list(Tail,Head)), not_repeat(Tail,Res),!.
not_repeat([Head|Tail],Res) :- del(Head,Tail,Head1), not_repeat(Head1,Res).


% 2.2. Дана строка, состоящая из символов латиницы. Необходимо проверить,
% упорядочены ли строчные символы этой строки по возрастанию.


pr8_2_2:-read_str(A,_),check_lowercase(A).

% Предикат check_lowercase(+Str,+Num_Pred_Head) - упорядочены ли
% строчные символы Str по возрастанию

check_lowercase([Head|Tail]):-(Head>=97,Head=<122->check_lowercase(Tail,Head);check_lowercase(Tail)).
check_lowercase([],_):-!.
check_lowercase([Head|Tail],Num_Pred_Head):-(Head>=97,Head=<122->(Num_Pred_Head=<Head->check_lowercase(Tail,Head);!,fail);check_lowercase(Tail,Num_Pred_Head)).


% 10. Дана строка. Необходимо подсчитать количество букв "А" в этой
%строке

pr8_2_10:-read_str(A,_),count_of_A_in_str(A,0,Kolvo_A),write(Kolvo_A).
