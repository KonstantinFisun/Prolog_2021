% ������� 1. ����������� �������� max(X,Y,Z), ��� Z ������������ ��
% ����� X � Y+


max(X,Y,X):-X>Y,!.

max(_,Y,Y).

%������� 2. ����������� �������� max(X,Y,U,Z), ��� Z ������������ ��
%����� X,Y � U.+
max_1(X,Y,U,X):-X>Y,X>U,!.
max_1(_,Y,U,Y):-Y>U,!.
max_1(_,_,U,U).


max_2(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).


% ������� 3. ����������� �������� fact(N,X), ��� X � ��� ���������
% ������� ��������� � ������� �������� �����.+
fact_up(0,1):-!.
fact_up(N,X):-N1 is N-1,fact_up(N1,X1), X is N*X1.









