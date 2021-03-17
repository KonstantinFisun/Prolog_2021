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












