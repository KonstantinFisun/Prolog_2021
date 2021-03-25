
% �������� read_str(-Str,-Lenght) - ������ ������ � ������� ����������
% �������� � ���
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.%���������
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

%�������� write_str(+Str) - ����� ������
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

% �������� read_str(-Str,-Lenght,+Flag) - ������ ������ � �������
% ���������� �������� � ���, � ������.
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.%���������
r_str(10,A,A,N,N,0):-!.%���������
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).


read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).





%������� ����, ���������� ����������,read_list_str - ������ ����� �����
pr:-	see('c:/Prolog/1111.txt'),read_list_str(List), seen, write_list_str(List),
		tell('c:/Prolog/111.txt'), write_list_str(List),told.


% ������� 1.1. ��������� �� ����� ������ � ������� ����� ����������
% ������.
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



% ������� 1.2. ��� ����. ����������, ������� � ����� �����, ��
% ���������� �������.
pr8_1_2:-  see('c:/Prolog/1111.txt'),read_list_str(List), seen, stroke_space(List,0,Num),nl,write(Num).

% �������� stroke_space(+List_str,+Num,-Num_space) - ������� ���� �����
% �������� ����
stroke_space([],Num,Num):-!.
stroke_space([Head|Tail],Num,Num_space):-(count_of_space(Head)->name(Head1,Head), write(Head1),nl,Num1 is Num+1,stroke_space(Tail,Num1,Num_space);stroke_space(Tail,Num,Num_space)).

%������� count_of_space(+Str) - ���� � ������ ���� ������ �� false
count_of_space([]):-!.
count_of_space([Head|_]):-Head is 32,!,fail.
count_of_space([_|Tail]):-count_of_space(Tail).



%1.3.��� ����, ����� � ������� �� ����� ������ �� ������, � ������� ����
%� ������, ��� � ������� �� ������

pr8_1_3:-see('c:/Prolog/1111.txt'),read_list_str(List), seen,
       count_of_A(List,[],List_Kolvo),average(List_Kolvo,Ave),a_bigger_ave(List,Ave).

% �������� count_of_A(+List_str,+I,-List_Kolvo) - ������� � ������
% ������ ���������� ���� A

count_of_A([],List_Kolvo_A,List_Kolvo_A):-!.
count_of_A([Head|Tail],I,List_Kolvo):-count_of_A_in_str(Head,0,Kolvo_A),append(I,[Kolvo_A],I1),count_of_A(Tail,I1,List_Kolvo).

% �������� count_of_A_in_str(+Str,I,-Kolvo_A) - ������� ���������� A �
% Str

count_of_A_in_str([],Kolvo_A,Kolvo_A):-!.
count_of_A_in_str([Head|Tail],I,Kolvo_A):-(Head is 65->I1 is I+1,count_of_A_in_str(Tail,I1,Kolvo_A);count_of_A_in_str(Tail,I,Kolvo_A)).

%�������� average(+List,-Ave) - ������� ������� � ������

average(List_Kolvo,Ave):-average(List_Kolvo,0,Sum,0,Num),Ave is Sum / Num.

% �������� average(+List,+I_Sum,-Sum,+I_Num,-Num) - ����������
% ���������� � ����� ��������� ������

average([],I_Sum,I_Sum,I_Num,I_Num):-!.
average([Head|Tail],I_Sum,Sum,I_Num,Num):-I1_Sum is I_Sum+Head,I1_Num is I_Num+1,average(Tail,I1_Sum,Sum,I1_Num,Num).

%�������� a_bigger_ave(+List_str,+Ave) - ������� ������ ���,����
%� ������, ��� � ������� �� ������

a_bigger_ave([],_):-!.
a_bigger_ave([Head|Tail],Ave):-count_of_A_in_str(Head,0,Kolvo_a),(Kolvo_a>Ave->name(Head1,Head),write(Head1),nl,a_bigger_ave(Tail,Ave);
	     a_bigger_ave(Tail,Ave)).


%1.4. ��� ����, ������� ����� ������ �����.

% ����� ������������ ������ �� ���� ���� � ����� � ��� ��������
% ����������
pr8_1_4:-see('c:/Prolog/1111.txt'),read_list_str(List), seen,words_in_all_str(List,[],List_frequent),unique_elems(List_frequent,Unique_words),counts(Unique_words,C,List_frequent),indOfMax(C,Ind),el_by_number(Unique_words,Ind,Word),name(Word1,Word),write("����� ���������� ����� : "),write(Word1).


% �������� words_in_all_str(+List_str,-List_frequent):-���������� ������
% ���� ����
words_in_all_str([],List_frequent,List_frequent):-!.
words_in_all_str([Head|Tail],I,List_frequent):-get_words(Head,Words),append(I,Words,I1),words_in_all_str(Tail,I1,List_frequent).

%�������� get_words(+Str,-Words) - �������� ������ ����
get_words(A,Words):-get_words(A,[],Words).

get_words([],List_words,List_words):-!.
get_words(Str,Words,List_words):-skip_space(Str,New_Str),get_word(New_Str,Word,New_Str_after_word),
    Word \=[],append(Words,[Word],New_list_word),get_words(New_Str_after_word,New_list_word,List_words),!.
get_words(_,List_words,List_words).

%��������, ������� �������� ��� ������� ��������
%���������� ���, ������� �� ����������� � ������. - ������� �������
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



% 1.5. ��� ����, ������� � ��������� ���� ������, ��������� �� ����, ��
%������������� � �������� �����.

%����� ��� �����, �������� ������ ����������
% ������������� ������, ���� � ��� ��� ����� ��������� � ���� ������� ��
% ������� ��� ������


pr8_1_5:-see('c:/Prolog/1111.txt'),read_list_str(List), seen, words_in_all_str(List,[],All_words),not_repeat(All_words,Unique_words),
	tell('c:/Prolog/111.txt'),�oincidence(List,Unique_words),told.

% �������� �oincidence(+List_str,+Unique_words,+Iter,-Correct_str)-
% �������, ����� ��� ����� ������ ���� � unique_words

�oincidence([],_):-!.
�oincidence([Head|Tail],Unique_words):-(get_words(Head,Words_Head),coin_str(Words_Head,Unique_words)->write_str(Head),nl,�oincidence(Tail,Unique_words);�oincidence(Tail,Unique_words)).

% �������� coin_str(+Words_Str,+Unique_words) - ���������� true, ����
% ��� ����� Str �������� � �����������
coin_str([],_):-!.
coin_str([Head|Tail],Unique_words):-m_list(Unique_words,Head),coin_str(Tail,Unique_words).

m_list([El|_],El):-!.
m_list([_|T],El):-m_list(T,El).

%��������� ������ �� ��������� ������� �� �����������(���� 4)?
del(_,[],[]):-!.
del(Head,[Head|Tail],Res) :- del(Head,Tail,Res),!.
del(Head,[Head1|Tail],[Head1|Res]) :- not(Head = Head1),del(Head,Tail,Res).

not_repeat([],[]):-!.
not_repeat([Head|Tail],[Head|Res]) :- not(m_list(Tail,Head)), not_repeat(Tail,Res),!.
not_repeat([Head|Tail],Res) :- del(Head,Tail,Head1), not_repeat(Head1,Res).


% 2.2. ���� ������, ��������� �� �������� ��������. ���������� ���������,
% ����������� �� �������� ������� ���� ������ �� �����������.


pr8_2_2:-read_str(A,_),check_lowercase(A).

% �������� check_lowercase(+Str,+Num_Pred_Head) - ����������� ��
% �������� ������� Str �� �����������

check_lowercase([Head|Tail]):-(Head>=97,Head=<122->check_lowercase(Tail,Head);check_lowercase(Tail)).
check_lowercase([],_):-!.
check_lowercase([Head|Tail],Num_Pred_Head):-(Head>=97,Head=<122->(Num_Pred_Head=<Head->check_lowercase(Tail,Head);!,fail);check_lowercase(Tail,Num_Pred_Head)).


% 10. ���� ������. ���������� ���������� ���������� ���� "�" � ����
%������

pr8_2_10:-read_str(A,_),count_of_A_in_str(A,0,Kolvo_A),write(Kolvo_A).



%17. ���� ������ � ������� ������� ���� � �����. ���������� ����� ���
%����� ��� ����������.

pr8_2_17:-read_str(A,_),reverse(A,Ar),to_dot(Ar,Ar_to_dot),before_slash(Ar_to_dot,[],Res),name(Res1,Res),write(Res1).

% �������� to_dot(+A,-Res) - ������� ������� ����� ������(�������
% ����������)

to_dot([46|Tail],Res):-append([],Tail,Res),!.
to_dot([_|Tail],Res):-to_dot(Tail,Res).

%�������� before_slash(+A,+Iter,-Res) - ������� ������� �� /

before_slash([47|_],Res,Res):-!.
before_slash([Head|Tail],I,Res):-append([Head],I,I1),before_slash(Tail,I1,Res).


%������� 3. ���� ������. ���������� ����� ��� ����, ������� ������� �
%���� "31 ������� 2007"

pr8_3:-read_str(A,_),append(A,[32],A1),date_time(A1).

%�������� date_time(+Str) - ������� ��� ���� � ������

date_time([]):-!.
date_time([32|Tail]):-date_time(Tail),!.
date_time([Head|Tail]):-(day([Head|Tail],[],Day,After_Day)->(month(After_Day,[],Month,After_Month)->(year(After_Month,[],Year,After_Year)->
	name(D,Day),write(D),write(" "),name(M,Month),write(M),write(" "),name(Y,Year),write(Y),nl,date_time(After_Year);date_time(After_Month));
							  date_time(After_Day));date_time(Tail)).

% �������� day(+Str,+I,-Day,-After_Day) - ���������� ���� � ����� ����
% ������
day([32|Tail],Day,Day,Tail):-!.
day([Head|Tail],I,Day,After_Day):-Head >=48,Head =<57,append(I,[Head],I1),day(Tail,I1,Day,After_Day),!.
day([_|_],_,_,_):-!,false.

% �������� month(+Str,+I,-Month,-After_Month) - ���������� ����� � �����
% ���� ������
month([32|Tail],Month,Month,Tail):-!.
month([Head|Tail],I,Month,After_Month):-Head >=97,Head =<122,append(I,[Head],I1),month(Tail,I1,Month,After_Month),!.
month([_|_],_,_,_):-!,false.

% �������� year(+Str,+I,-Year,-After_Year) - ���������� ��� � �����
% ���� ������
year([32|Tail],Year,Year,Tail):-!.
year([Head|Tail],I,Year,After_Year):-Head >=48,Head =<57,append(I,[Head],I1),year(Tail,I1,Year,After_Year),!.
year([_|_],_,_,_):-!,false.


%4.2 ���� ������. ���������� ����� ��� �������� ������� ��������,
%������� � ��� ������������.

pr8_4_2:-read_str(A,_),all_latin(A).

%�������� all_latin(+Str) - ����� ���� ��������� ��������

all_latin([]):-!.
all_latin([Head|_]):-Head >=97,Head =<122,put(Head),fail.
all_latin([_|Tail]):-all_latin(Tail).



%4.10 ���� ������. ���������� ����� ���������� ���������������
%�������� �������� � ���� ������ (��� ����������).

pr8_4_10:-read_str(A,_),all_latin(A,[],Latin),not_repeat(Latin,Unique),write(Unique),lenght(Unique,N),write(N).

%�������� all_latin(+Str,Res) - ����� ���� ��������� �������� � Res

all_latin([],Latin,Latin):-!.
all_latin([Head|Tail],I,Latin):-(Head >=97,Head =<122->append(I,[Head],I1),all_latin(Tail,I1,Latin);all_latin(Tail,I,Latin)).

%�������� lenght(+List,?Lenght)
lenght([],L,L):-!.
lenght([_|Tail],I,L):-I1 is I+1,lenght(Tail,I1,L).
lenght(List,L):-lenght(List,1,L).


%������� 5. ��������� ������ ����� �� �����. ����������� �� �����
%������.

pr8_5:-see('c:/Prolog/1111.txt'),read_list_str(A), seen,tell('c:/Prolog/111.txt'),list_lenght(A,[],List_Lenght),
	bubble_sort(List_Lenght,_,A,Sorted_A),write_sort(Sorted_A),told.

% �������� write_sort(+List_Str) - ������� ������ ����� �
% ������������� ����
write_sort([]):-!.
write_sort([Head|Tail]):-name(Head1,Head),write(Head1),nl,write_sort(Tail).


% �������� list_lenght(+List_Str,+I,-Res) - �������� ������ ���� ����
% �����

list_lenght([],Res,Res):-!.
list_lenght([Head|Tail],I,Res):-lenght(Head,Lenght_Head),append(I,[Lenght_Head],I1),list_lenght(Tail,I1,Res).


%?� ��������� ���������� ���������:
% �������� sorted(+List,-Res) - �������� ��� ������ �����������
% ���������� ������� � �����


sorted([], [],[],[]):-!.
sorted([Head], [Head],[HeadStr],[HeadStr]):-!.
sorted([First, Second|Tail], [Second|ListWithMaxEnd],[FirstStr, SecondStr|TailStr],[SecondStr|ListWithMaxEndStr]):-First > Second, !,
	sorted([First|Tail], ListWithMaxEnd,[FirstStr|TailStr],ListWithMaxEndStr).
sorted([First, Second|Tail], [First|ListWithMaxEnd],[FirstStr, SecondStr|TailStr], [FirstStr|ListWithMaxEndStr]):-sorted([Second|Tail], ListWithMaxEnd,[SecondStr|TailStr], ListWithMaxEndStr).


% �������� bubble_sort(+List,-Res) - ����������� �� ��� ���, ����
% ���������� ���������� �� ����� �������(������ ������������)
bubble_sort(SortedList, SortedList,SortedList_Str,SortedList_Str):-
	sorted(SortedList, DoubleSortedList,SortedList_Str,DoubleSortedList_Str),
	SortedList = DoubleSortedList,SortedList_Str = DoubleSortedList_Str,!.%��������� ����������

bubble_sort(List, SortedList,List_Str,SortedList_Str):-sorted(List, SortedPart,List_Str,SortedPart_List_Str),bubble_sort(SortedPart, SortedList,SortedPart_List_Str,SortedList_Str).


%������� 6. ��� ������ ����� �� �����. ����������� �� ���������� ���� �
%������.

pr8_6:-see('c:/Prolog/1111.txt'),read_list_str(A), seen,tell('c:/Prolog/111.txt'),list_word(A,[],List_Word),
	bubble_sort(List_Word,_,A,Sorted_A),write_sort(Sorted_A),told.

% �������� list_word(+List_Str,+I,-Res) - ������� � ������ ������ ���������� ����,
% ������������� ���������� get_words �� �������� �������

list_word([],Res,Res):-!.
list_word([Head|Tail],I,Res):-get_words(Head,Words),lenght(Words,Count_Words),append(I,[Count_Words],I1),list_word(Tail,I1,Res).
