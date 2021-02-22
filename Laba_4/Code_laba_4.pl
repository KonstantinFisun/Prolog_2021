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
