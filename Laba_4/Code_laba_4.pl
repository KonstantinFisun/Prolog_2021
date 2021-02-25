%������� 1. ����������� �������� ������ ������ � ���������� � ��������
%������ ������ �� �����.
%
read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail). %������ ������

write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list(Tail).


%������� 2. ����������� �������� sum_list_down(+List, ?Summ), �������
%���������, �������� �� Summ ������ ��������� ������ ��� ���������� �
%��� ���������� ����� ���������. ��� ���������� ���������������
%��������� ����. ����������� ���������, �������� ������, ���������
%����� ��������� � ��������� ����� �� �����, � ��������������
%���������� �� ������� 1 � ������������ ��������� sum_list_down /2.


sum_list_down(List,Sum):- sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([Head|Tail], S, Sum):- S1 is S+Head,sum_list_down(Tail,S1,Sum).

sum_list:-write("������� ���������� ���������"),nl,read(N),read_list(N,List),sum_list_down(List,Sum),write(Sum).


%������� 3. ��������� �������� sum_list_up(+List, ?Summ), �������
%���������, �������� �� Summ ������ ��������� ������ ��� ���������� �
%��� ���������� ����� ���������. ��� ���������� ���������������
%��������� �����.

sum_list_up([],0):-!.
sum_list_up([Head|Tail],Sum):-sum_list_up(Tail,Sum1),Sum is Sum1+Head.


% ������� 4_1. ��������� ��������, list_el_numb(+List, ?Elem, ?Number).
% ���� ������ �������� Elem, �� �������� ���������� � Number �����
% ������� ��������� Elem. ���� ������ �������� Number, �� ��������
% ���������� � Elem ��������, ����������� � ������ ��� ������� Number.
% ���� ������ ��� ��������, �� �������� ���������, ��������� �� �������
% Elem � ������ ��� ������� Numb.

list_el_numb(List,Elem,Number):-list_el_numb(List,Elem,0,Number).
list_el_numb([Head|_],Head,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):-I1 is I+1, list_el_numb(Tail,Elem,I1,Number).


% ������� 4_2. ����������� ���������, ������� ������ ������, ������
% ������� � ������� ����� ������� ��������� �������� � ������. � ������,
% ���� ������� �����������, ������������ ��������� ���������������
% ���������. ��������������� ����������� �� ������� 1 � 3.

pr4_4:-write("���������� ��������� ������: "),read(N),nl,write("������� ������"),read_list(N,List),nl,write("������� �������: "),read(Elem),nl,list_el_numb(List,Elem,Number),write(Number),!.

pr4_4:-write("��� ��������").


%������� 5. ����������� ���������, ������� ������ ������, ������ �����
%�������� � ������� ��������������� �������. � ������, ���� �����
%������������, ������������ ��������� ��������������� ���������.

pr4_5:-write("���������� ��������� ������: "),read(N),nl,write("������� ������"),read_list(N,List),nl,write("������� ����� ��������: "),read(Number),nl,list_el_numb(List,Elem,Number),write(Elem),!.
pr4_5:-write("��� �������� � ����� �������").



%������� 6. ����������� �������� min_list_up(+List, ?Min), �������
%���������� ����������� ������� ������ List � ���������� Min ���
%���������, �������� �� �������� � ���������� Min �����������
%��������� � ������ List. ���������� �������� ��������� �����.

min_list_up([], 1000):-!.
min_list_up([Head|Tail], Min):-min_list_up(Tail,Min1),(Head<Min1 -> Min is Head;Min is Min1).


%������� 7. ����������� �������� min_list_down(+List, ?Min), �������
%���������� ����������� ������� ������ List � ���������� Min ���
%���������, �������� �� �������� � ���������� Min �����������
%��������� � ������ List. ���������� �������� ��������� ����.


min_list_down([],Min,Min):-!.
min_list_down([Head|Tail],M,Min):-(Head<M -> M1 is Head;M1 is M),min_list_down(Tail,M1,Min).
min_list_down(List,Min):- min_list_down(List,1000,Min).



%������� 8. ����������� ���������, ������� ������ ������, ������� �
%������� �� ����� ��� ����������� �������. ���������������
%����������� �� ������� 1, 6 ��� 7.

pr4_8:-write("���������� ��������� ������: "),read(N),nl,write("������� ������"),read_list(N,List),min_list_down(List,Min),write("����������� ������� ������: "),write(Min),!.


%������� 9. ��������� ��������, ������� ���������� true, ���� �������
%���� � ������.

m_list([El|_],El).
m_list([_|Tail],El):-m_list(Tail,El).


%������� 10. ��������� ��������, ������� �������������� ������.
append1([],List2,List2).
append1([H|T1],List2,[H|T2]):-append1(T1,List2,T2).

%����������� reverse ��������(
rever([],_):-!.
rever([Head|Tail],List):-reverse(Tail,List1),append1(Head,List,List1).



%������� 11. ��������� �������� p(Sublist,List), ������� ���������� true,
%���� �������� Sublist ����������� � List � ��� �� �������.

p([],_):-!.
p([Head|Tail],List):-m_list(List,Head),p(Tail,List).


%������� 12. ��������� ��������, ������� ������� ������� � ��������
%������� �� ������.

delete_num(0,[_|Z],Z):- !.
delete_num(X,[Head|Y],[Head|Z]) :- X1 is X-1,delet(X1,Y,Z).

%������� 13. ��������� ��������, ������� ������� ��� ��������, ������
%�������.

delete_elem(Head,[Head|Z],Z):-!.
delete_elem(X,[Head|Y],[Head|Z]):-delete_elem(X,Y,Z).

%������� 14. ��������� ��������, ������� ���������, ����������� �� ���
%�������� � ������ ����� 1 ���.

replay(_,[]):-!.
replay(X,[Head|Tail]):- X =\= Head,replay(X,Tail).
replay([Head|Tail]):-replay(Head,Tail),replay(Tail).
replay([]):-!.


%������� 15.so ��������� ��������, ������� ������ ����� ������,
%������������ �� ���������� ��������� ����������, �� ���� ������� ���
%�������, �������� �� ������ [1,1,2,3,3,3] �������� ������ [1,2,3].


members(H,[H|_]).
members(H,[_|T]):-members(H,T).
no_duble([H|T],T1):-members(H,T),no_duble(T,T1).
no_duble([H|T],[H|T1]):-not(members(H,T)),no_duble(T,T1).
no_duble([],[]).


%������� 16. ��������� ��������, ������� �������� ��� ������� ��������
%���������� ���, ������� �� ����������� � ������.

counter([],_,0).
counter([Head|Tail],Head,Num) :- counter(Tail,Head,Num1), Num is Num1+1.
counter([X|Tail],Head,Num) :- X =\= Head, counter(Tail,Head,Num).

%������� 17. ��������� ��������, ���������� ����� ������.
lenght([],L,L):-!.
lenght([_|Tail],I,L):-I1 is I+1,lenght(Tail,I1,L).
lenght(List,L):-lenght(List,0,L).


%������ 1.1 ��� ������������� ������. ���������� ����� ����������
%���������, ������������� ����� ���������� �������������.

num_after_max([],0,0,_):-!.
num_after_max([Head|Tail], Max,I,Num):-num_after_max(Tail,Max1,I1,Num1),I is I1+1,(Head>Max1-> Max is Head,Num is I1;Max is Max1,Num is Num1).
num_after_max([Head|Tail],Num):- num_after_max([Head|Tail],_,_,Num).


pr18_1:-write("���������� ��������� ������: "),read(N),nl,write("������� ������"),read_list(N,List),num_after_max(List,Num),write("���������� ���������, ������������� ����� ���������� �������������: "),write(Num),!.


%������ 1.2 ��� ������������� ������. ���������� ����� ������
%������������ ��������.

index_min(List,Num):-min_list_up(List,Min),list_el_numb(List,Min,Num).

pr18_2:-write("���������� ��������� ������: "),read(N),nl,write("������� ������"),read_list(N,List),index_min(List,Num),write("������ ������������ ��������: "),write(Num),!.


%1.14 ��� ������������� ������ � �������� a..b. ���������� �����
%���������� ��������� � ���� ���������.

kol_sym_interval(_,[],0):-!.
kol_sym_interval(List,[Head|Tail],Num):-kol_sym_interval(List,Tail,Num1),counter(List,Head,Kol), Num is Num1+Kol.

pr18_14:-write("���������� ��������� ������: "),read(N1),nl,write("������� ������"),read_list(N1,List1),
    write("���������� ��������� ���������: "),read(N2),nl,write("������� ��������"),read_list(N2,List2),
    kol_sym_interval(List1,List2,Num),write("���������� �������� �� ���������: "),write(Num),!.


%1.16 ��� ������������� ������. ���������� ����� ��������,
%������������� ����� ������ � ������ ������������.

%������� ������ ������������
max_list_up([], 0,0):-!.
max_list_up([Head|Tail], Max,Max_2):-max_list_up(Tail,Max1,Max1_2),(Head>Max1 -> Max is Head,Max_2 is Max1; Head<Max1,Head>Max1_2 -> Max is Max1,Max_2 is Head; Max is Max1, Max_2 is Max1_2).



%�������� �������� �� ���������
interval([],_,_,[],_):-!.
interval([Head|Tail],Number1,Number2,List2,I):-I1 is I+1,interval(Tail,Number1,Number2,List3,I1),(I<Number2,I>Number1 -> append1([Head],List3,List2);append1([],List3,List2)).
interval(List1,Number1,Number2,List2):-interval(List1,Number1,Number2,List2,0).

%�������� ��������
elem_between_max(List1,List2):-max_list_up(List1,Max,Max_2),list_el_numb(List1,Max,Number1),list_el_numb(List1,Max_2,Number2),(Number2>Number1 -> interval(List1,Number1,Number2,List2);interval(List1,Number2,Number1,List2)).



%1.26 ��� ������������� ������. ���������� ����� ����������
%��������� ����� ������ � ��������� �����������.

num_min([],10000,_,_):-!.
num_min([Head|Tail], Min,I,Num):-I1 is I+1,num_min(Tail,Min1,I1,Num1),(Head<Min1-> Min is Head,Num is I1-2;Min is Min1,Num is Num1).
num_min([Head|Tail],Num):- num_min([Head|Tail],_,0,Num).

%1.29 ��� ������������� ������ � �������� a..b. ���������� ���������
%������� ������������� �������� ������� � ���� ���������.
%������� ������� ���������
inter(List,Number1,Number2):-list_el_numb(List,Number1,0),list_el_numb(List,Number2,1).

max_in_interval(List,Interval):-inter(Interval,Num1,Num2),max_list_up(List,Max,_), Max<Num2,Max>Num1.




%1.38 ��� ������������� ������ � ������� a..b. ���������� �����
%���������� ���������, �������� ������� ����������� ����� �������.

kol_belongs_otrezok(List,Otrezok,Kol):-inter(Otrezok,Num1,Num2),kol_belongs(List,Kol,Num1,Num2).
kol_belongs([],0,_,_):-!.
kol_belongs([Head|Tail],Kol,Num1,Num2):-kol_belongs(Tail,Kol1,Num1,Num2),(Head>=Num1,Head=<Num2 -> Kol is Kol1+1; Kol is Kol1).


%1.44 ��� ������ �����. ���������� ���������, ���������� �� � ���
%����� � ������������ �����.

alternates(_,[]):-!.
alternates([Head|Tail],[Head1|Tail1]):-( (integer(Head),not(integer(Head1))) ; ( not(integer(Head)),integer(Head1)) ) ,alternates(Tail,Tail1).
alternates([Head|Tail]):-alternates([Head|Tail],Tail).



% 1.50. ��� ���� ��������� ������� L1 � L2 ��������� ����� ������,
% ��������� �� ���������, ������������� ������ � ����� �� ���� ������� �
% �� ������������� � ���.
%1 ��������� ����� �� ���� ��������


%��������� ������ �� ��������� ������� �� �����������

not_repeat([],[]):-!. %����������
not_repeat([Head|Tail],Ys):-member(Head,Tail),!,not_repeat(Tail,Ys).
not_repeat([Head|Tail1],[Head|Tail2]):-member(Head,Tail1),!,not_repeat(Tail1,Tail2).

subtra_ct([],_,[]):-!.
subtra_ct([E|T],D,R):-memberchk(E,D),!,subtract(T,D,R).
subtra_ct([H|T],D,[H|R]):-subtract(T,D,R).

%unique([Head1|Tail1],[Head2|Tail2],List4):-

