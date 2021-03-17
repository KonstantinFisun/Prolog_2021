%�������� write_str(+Str) - ����� ������
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

% �������� read_str(-Str,-Lenght,+Flag) - ������ ������ � �������
% ���������� �������� � ���, � ������.
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.%���������
r_str(10,A,A,N,N,0):-!.%���������
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

% �������� read_str(-Str,-Lenght) - ������ ������ � ������� ����������
% �������� � ���
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.%���������
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).


% ������� 1. ���� ������. ������� �� ��� ���� ����� ������� � ��������
% ���������� �������� � ���

pr_3_string:-read_str(Str,Lenght,0),write_str(Str),write(","),write_str(Str),write(","),write_str(Str),nl,write(Lenght).


%������� 2. ���� ������. ����� ���������� ����.

%�������� count_words(+Str,-Count) - ������� ���������� ���� � ������
count_words(A,K):-count_words(A,0,K).

%�������� count_words(+Str,+Iter,-Count)
%Iter - ���������� ���� �� ������������ ����
count_words([],K,K):-!.%���������
count_words(Str,I,K):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),Word \=[],I1 is I+1,count_words(New_Str_after_word,I1,K),!.
count_words(_,K,K).

%�������� skip_space(+Str,-New_Str) - ������� �������� � ������ ������
skip_space([32|Tail],New_Str):-skip_space(Tail,New_Str),!.
skip_space(New_Str,New_Str).%������� ������ ��� �������

% �������� get_word(+Str,-Word,-New_Str_after_word) - ��������� ��
% ������ �����
get_word([],[],[]):-!. %��������� ���� ������ ������ ������
get_word(Str,Word,New_Str_after_word):-get_word(Str,[],Word,New_Str_after_word).

get_word([],Word,Word,[]).%���������� ������ ������ ���� ����� ����� ������ ���
get_word([32|T],Word,Word,T):-!. % ��������� �� ������� � ���������� ������ ��� ����
get_word([H|T],W,Word,New_Str_after_word):-append(W,[H],W1),get_word(T,W1,Word,New_Str_after_word). % ��������� ������� �����



%������� 3. ���� ������, ���������� ����� ������ �����

% �������� frequent_word(+Str,-Word) - ���������� ����� ������ �����
% Word �� ������ Str
frequent_word(Str,Word):-get_words(Str,Words),unique_elems(Words,Unique_words),
		counts(Unique_words,C,Words),indOfMax(C,Ind),el_by_number(Unique_words,Ind,Word1),name(Word,Word1).



%�������� get_words(+Str,-Words) - �������� ������ ����
get_words(A,Words):-get_words(A,[],Words).

get_words([],List_words,List_words):-!.
get_words(Str,Words,List_words):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),
    Word \=[],append(Words,[Word],New_list_word),get_words(New_Str_after_word,New_list_word,List_words),!.
get_words(_,List_words,List_words).




%��������, ������� �������� ��� ������� ��������
%���������� ���, ������� �� ����������� � ������.
counts([],[],_):-!.
counts([Word|T_words],[Count|T_counts],Words):-
	count(Word,Words,Count),counts(T_words,T_counts,Words).

count(_, [], 0):-!.
count(Elem, List, X):- count(Elem, List, 0, X).
count(_, [], Count, Count):- !.
count(Elem, [Elem|T], Count, X):- Count1 is Count + 1, count(Elem, T, Count1, X), !.
count(Elem, [_|T], Count, X):- count(Elem, T, Count, X).



%������� ������� ��� ��������
el_by_number(A,Ind,El):-el_by_number(A,1,Ind,El).
el_by_number([],_,_,nil):-!.
el_by_number([El|_],Ind,Ind,El):-!.
el_by_number([_|T],I,Ind,El):-I1 is I+1,el_by_number(T,I1,Ind,El).

%�������� ���������� ������ �� ���������� ���������
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

%�������� ������ ������������� ��������
indOfMax(X,Y):-indexOfMin(X,Y).
indexOfMin([], -1):- !.
indexOfMin([H|T], X):-indexOfMin(T, 1, 1, X, H).
indexOfMin([], _, MinInd, MinInd, _):-!.
indexOfMin([H|T], CurInd, _, X, CurMin):-
	H > CurMin, NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, NewCurInd, X, H), !.
indexOfMin([_|T], CurInd, MinInd, X, CurMin):-
	NewCurInd is CurInd + 1, indexOfMin(T, NewCurInd, MinInd, X, CurMin).


% ������� 4. ���� ������. ������� ������ ��� ������� � ��������� ���
% �������, ���� ����� ������ ������ 5. ����� ������� ������ ������ �������
%���, ������ ����� ������.

pr7_4:-read_str(A,N),(N>5->write_3(A),reverse(A,A1),write_3(A1);write_first(A,N)).

% �������� write_first(+Str,+Num) - ������� �� ����� ������ ������� ������ Str Num ���
write_first(_,0,_):-!.
write_first(Head,I,N):-name(Head1,[Head]),write(Head1),I1 is I-1,write_first(Head,I1,N).
write_first([Head|_],N):-write_first(Head,N,N).

%�������� write_3(+Str) - ������� ������ ��� �������� ������ Str
write_3([Head1,Head2,Head3|_]):-name(Head11,[Head1]),write(Head11),name(Head22,[Head2]),write(Head22),name(Head33,[Head3]),write(Head33).








