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
append([],List2,List2).
append([H|T1],List2,[H|T2]):-append(T1,List2,T2).

%����������� reverse ��������(
rever([],_):-!.
rever([Head|Tail],List):-reverse(Tail,List1),append(Head,List,List1).

