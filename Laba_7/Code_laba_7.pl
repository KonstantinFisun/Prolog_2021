%Предикат write_str(+Str) - вывод строки
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

% Предикат read_str(-Str,-Lenght,+Flag) - чтение строки и подсчет
% количества символов в ней, с флагом.
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.%Остановка
r_str(10,A,A,N,N,0):-!.%Остановка
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

% Предикат read_str(-Str,-Lenght) - чтение строки и подсчет количества
% символов в ней
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.%Остановка
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).


% Задание 1. Дана строка. Вывести ее три раза через запятую и показать
% количество символов в ней

pr_3_string:-read_str(Str,Lenght,0),write_str(Str),write(","),write_str(Str),write(","),write_str(Str),nl,write(Lenght).


%Задание 2. Дана строка. Найти количество слов.

%Предикат count_words(+Str,-Count) - подсчет количества слов в строке
count_words(A,K):-count_words(A,0,K).

%Предикат count_words(+Str,+Iter,-Count)
%Iter - количество слов на определенном шаге
count_words([],K,K):-!.%Остановка
count_words(Str,I,K):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),Word \=[],I1 is I+1,count_words(New_Str_after_word,I1,K),!.
count_words(_,K,K).

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



%Задание 3. Дана строка, определить самое частое слово

% Предикат frequent_word(+Str,-Word) - возвращает самое частое слово
% Word из строки Str
frequent_word(Str,Word):-get_words(Str,Words),unique_elems(Words,Unique_words),
		counts(Unique_words,C,Words),indOfMax(C,Ind),el_by_number(Unique_words,Ind,Word1),name(Word,Word1).



%Предикат get_words(+Str,-Words) - получает список слов
get_words(A,Words):-get_words(A,[],Words).

get_words([],List_words,List_words):-!.
get_words(Str,Words,List_words):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),
    Word \=[],append(Words,[Word],New_list_word),get_words(New_Str_after_word,New_list_word,List_words),!.
get_words(_,List_words,List_words).




%Предикат, который получает для данного элемента
%количество раз, которое он встречается в списке.
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


% Задание 4. Дана строка. Вывести первые три символа и последний три
% символа, если длина строки больше 5. Иначе вывести первый символ столько
%раз, какова длина строки.

pr7_4:-read_str(A,N),(N>5->write_3(A),reverse(A,A1),write_3(A1);write_first(A,N)).

% Предикат write_first(+Str,+Num) - выводит на экран первый элемент строки Str Num раз
write_first(_,0,_):-!.
write_first(Head,I,N):-name(Head1,[Head]),write(Head1),I1 is I-1,write_first(Head,I1,N).
write_first([Head|_],N):-write_first(Head,N,N).

%Предикат write_3(+Str) - выводит первые три элемента строки Str
write_3([Head1,Head2,Head3|_]):-name(Head11,[Head1]),write(Head11),name(Head22,[Head2]),write(Head22),name(Head33,[Head3]),write(Head33).



%Задание 5. Показать номера символов, совпадающих с последним
%символом строки.

pr7_5:-read_str(A,_),last_simbol(A,Elem),show_match(A,Elem,0).

%Предикат last_simbol(+Str,-Elem) - в Elem получает последний символ
last_simbol([Head],Head):-!.
last_simbol([_|Tail],Elem):-last_simbol(Tail,Elem).


% Предикат show_match(+Str,+Elem,+I) - выводит номера элементов
% совпадающие с Elem, где I счетчик символов
show_match([_],_,_):-!.
show_match([Elem|Tail],Elem,I):-write(I),nl,I1 is I+1,show_match(Tail,Elem,I1),!.
show_match([_|Tail],Elem,I):-I1 is I+1,show_match(Tail,Elem,I1).



% Задание 6. Дана строка. Показать третий, шестой, девятый и так далее символы.

pr7_6:-read_str(A,_),show_every_3(A,0).

%Предикаты show_every_3(+Str,I) - показывает каждый 3 символ
show_every_3([],_):-!.
show_every_3([Head|Tail],I):-I1 is I+1,(I1 mod 3 =:= 0->name(Head1,[Head]),write(Head1),nl,show_every_3(Tail,I1);show_every_3(Tail,I1)).


% Задание 7. Дана строка. Определите общее количество символов '+' и '-' в ней. А
%так же сколько таких символов, после которых следует цифра ноль.

pr7_7:-read_str(A,_),kolvo_plus(A,Kolvo_plus),kolvo_minus(A,Kolvo_minus),kolvo_next_zero(A,Kolvo_zero),Sum is Kolvo_minus+Kolvo_plus+Kolvo_zero,
	write("Общее количество символов = "),write(Sum).

%Предикат kolvo_plus(+Str,-Kolvo_plus) - количество символов "+"
kolvo_plus(Str,Kolvo_plus):-kolvo_plus(Str,0,Kolvo_plus).
kolvo_plus([],Kolvo_plus,Kolvo_plus):-!.
kolvo_plus([Head|Tail],I,Kolvo_plus):-(Head =:= 43->I1 is I+1,kolvo_plus(Tail,I1,Kolvo_plus);kolvo_plus(Tail,I,Kolvo_plus)).


%Предикат kolvo_minus(+Str,-Kolvo_minus) - количество символов "-"
kolvo_minus(Str,Kolvo_minus):-kolvo_minus(Str,0,Kolvo_minus).
kolvo_minus([],Kolvo_minus,Kolvo_minus):-!.
kolvo_minus([Head|Tail],I,Kolvo_minus):-(Head =:= 45->I1 is I+1,kolvo_minus(Tail,I1,Kolvo_minus);kolvo_minus(Tail,I,Kolvo_minus)).

% Предикат kolvo_next_zero(+Str,-Kolvo_zero) - количество символов за которыми ноль
kolvo_next_zero([_|Tail],Kolvo_zero):-kolvo_next_zero(Tail,0,Kolvo_zero).
kolvo_next_zero([],Kolvo_zero,Kolvo_zero):-!.
kolvo_next_zero([Head|Tail],I,Kolvo_zero):-(Head =:= 48->I1 is I+1,kolvo_next_zero(Tail,I1,Kolvo_zero);kolvo_next_zero(Tail,I,Kolvo_zero)).


% Задание 8. Дана строка. Определите, какой символ в ней встречается
% раньше: 'x' или 'w'. Если какого-то из символов нет, вывести сообщение об этом.

pr7_8:-read_str(A,_),w(A,0,Indw),x(A,0,Indx),(Indw<Indx->write("w встретился раньше");write("x встретился раньше")).

% Предикат w(+A,+I,-Ind) - возвращает индекс вхождения "w", иначе
% выводит об ошибке

w([],_,_):-write("Не нашелся w"),!,fail.
w([Head|Tail],I,Ind):-(Head =:=119 -> Ind is I;I1 is I+1,w(Tail,I1,Ind)).

% Предикат x(+A,+I,-Ind) - возвращает индекс вхождения "x", иначе
% выводит об ошибке

x([],_,_):-write("Не нашелся x"),!,fail.
x([Head|Tail],I,Ind):-(Head =:=120 -> Ind is I;I1 is I+1,x(Tail,I1,Ind)).


% Задание 9. Даны две строки. Вывести большую по длине строку столько
% раз, на сколько символов отличаются строки.

pr7_9:-read_str(A1,N1),read_str(A2,N2),(N1>N2->N is N1-N2,write_bigger(A1,N);N is N2-N1,write_bigger(A2,N)).

%Предикат write_bigger(+Str,+Num) - выводит строки N раз

write_bigger(_,0):-!.
write_bigger(Str,Num):-name(A,Str),write(A),nl,Num1 is Num-1,write_bigger(Str,Num1).
