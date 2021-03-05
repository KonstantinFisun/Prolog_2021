% ������� 1. ����������� �������� max(+X,+Y,?Z), ��� Z ������������ ��
% ����� X � Y


max(X,Y,X):-X>Y,!.

max(_,Y,Y).

%������� 2. ����������� �������� max(X,Y,U,Z), ��� Z ������������ ��
%����� X,Y � U.
%�������� max_1(+X,+Y,+U,?Z)
max_1(X,Y,U,X):-X>Y,X>U,!.
max_1(_,Y,U,Y):-Y>U,!.
max_1(_,_,U,U).

%�������� max_2(+X,+Y,+U,?Z)
max_2(X,Y,U,Z):-max(X,Y,C),max(U,C,Z).


% ������� 3. ����������� �������� fact_up(+N,?X), ��� X � ��� ���������
% ������� ��������� � ������� �������� �����.

fact_up(0,1):-!.%��� ��������
fact_up(N,X):-N1 is N-1,fact_up(N1,X1), X is N*X1.

% ������� 4. ����������� �������� fact_down(+N,-X), ��� X � ���
% ��������� ������� ��������� � ������� �������� ����.

%�������� fact_down(+I,+Fact,+Num,-X)
%I - ������� �� 1 �� Num
%Fact - ��������� �� ������������ ����
%Num - �������� �����, �� �������� ������� ���������
%X - ���������
fact_down(N,X,N,X):-!.%���������
fact_down(I,F,N,X):- I1 is I+1,F1 is F*I1,fact_down(I1,F1,N,X).

fact_down(N,X):-fact_down(0,1,N,X).%��� ������������

% ������� 5. ����������� �������� fib(+N,?X), ��� X � ����� ��������� �
% ������� N, ������ 1 � 2 ������� ����� 1 � ������� �������� �����.

fib_up(1,1):-!.%��� ��������
fib_up(2,1):-!.
fib_up(N,X):-N1 is N-1,fib_up(N1,X1),N2 is N-2,fib_up(N2,X2), X is X1+X2.


% ������� 6. ����������� �������� fib_down(+N,-X), ��� X � �����
% ��������� � ������� N, ������ 1 � 2 ������� ����� 1 � ������� ��������
% ����.

%�������� fib_down(+I,+Fib1,+Fib2,+Num,-X)
%I - ������� �� 1 �� Num
%Fib1 - ������ ����� ���������
%Fib2 - ������ ����� ���������
%Num - ����� �������� ������������������ ���������
%X - ���������
fib_down(N,X,_,N,X):-!.%���������
fib_down(I,F1,F2,N,X):-I1 is I+1,F3 is F1+F2,fib_down(I1,F2,F3,N,X).

fib_down(N,X):-fib_down(1,1,1,N,X).%��� ������������


% ������� 7. ����� ����� ���� ����� � ������� �������� �����
% �������� sum_digit_up(+N,?X) - ��� X ����� ���� ����� N
sum_digit_up(0,0):-!.%��� ��������
sum_digit_up(N,X):-N1 is N div 10, sum_digit_up(N1,X1),X is X1+N mod 10.


% ������� 8. ����� ����� ���� ����� � ������� �������� ����.
% �������� sum_digit_down(+A,+Sum,-X)
% A - ���������� �����
% Sum - �����
% X - ���������
sum_digit_down(0,X,X):-!.%���������
sum_digit_down(A,Sum,X):-Am is A mod 10,Ad is A div 10,Sum1 is Sum+Am,sum_digit_down(Ad,Sum1,X).

sum_digit_down(N,X):-sum_digit_down(N,0,X).%��� ������������


% ������� 9. ����� ������������ ����� ����� � ������� �������� �����
% �������� max_digit_up(+N,X?)
max_digit_up(0,0):-!.%��� ��������
max_digit_up(N,X):-N1 is N div 10, max_digit_up(N1,X1), F is N mod 10, max(F,X1,X) .


%������� 10. ����� ������������ ����� ����� � ������� �������� ����.
%�������� max_digit_down(+N,-X) - ��� ������������
max_digit_down(N,X):-N1 is N mod 10,max_digit_down(N,N1,X). %��������� ����� ������ ������������

%max_digit_down(+A,+Max,-X)
%A - ���������� �����
%Max - �������� �� ������ ����
%X - ���������
max_digit_down(0,X,X):-!. %���������, ����� ��� ����
max_digit_down(A,Max,X):-Am is A mod 10,Ad is A div 10,max(Am,Max,U),max_digit_down(Ad,U,X).


% ������� 11.����� ����� ���� �����, ��������� �� 3 � ������� ��������
% ����� � �������� ����.

% �������� sum_digit_del3_up(+Num,?X) - �������� ����.
sum_digit_del3_up(0,0):-!.%��� ��������
sum_digit_del3_up(N,X):-N1 is N div 10, sum_digit_del3_up(N1,X1), del3(N,Y), X is X1+Y.

% �������� del3(+X,-Y) ���������� 0 , ���� ��������� ����� X �� �������
% �� 3, ����� ���������� ��������� �����
del3(X,Y):- X mod 10 mod 3 =:= 0 , Y is X mod 10,!.
del3(_,Y):-Y is 0.

% �������� sum_digit_del3_down(+A,+Sum,-X) - �������� ����
% % A - ���������� �����
% Sum - �����, ��������� �� 3
% X - ���������
sum_digit_del3_down(0,X,X):-!.%���������
sum_digit_del3_down(A,Sum,X):- Ad is A div 10,del3(A,Y),Sum1 is Sum+Y, sum_digit_del3_down(Ad,Sum1,X).

sum_digit_del3_down(N,X):-sum_digit_del3_down(N,0,X). %��� ������������


% ������� 12. ����� ��� ���� �����.
% �������� nod(+A,+B,-Nod).
nod(A,A,A):-A=\=0,!. % ���������
nod(0,B,B):-!.
nod(A,0,A):-!.
nod(A,B,Nod):-A>B,C is A mod B, nod(C,B,Nod),!.
nod(A,B,Nod):-C is B mod A, nod(A,C,Nod).

%��������� ����� �� ��������
%�������� prime(+Num,+X)
%Num - �������� �����
%X - ������� �� 2 �� Num
prime(N,N):-!.
prime(N,X):-N mod X =:= 0,!,fail. %���� �������, �� �������
prime(N,X):- X1 is X+1,prime(N,X1).

prime(1):-!.
prime(2):-!.
prime(N):-prime(N,2).%��� ������������


%����� ���������� ��������� �����
%�������� divisors(+N,+I,?X) - �������� ����
divisors(_,0,0):-!.%��� ��������
divisors(N,I,X):-N mod I =:= 0,I1 is I-1, divisors(N,I1,X1), X is X1+1,!; N mod I=\= 0, I1 is I -1, divisors(N,I1,X1), X is X1.
divisors(N,X):-divisors(N,N,X1),X is X1-1.%��� ������������, ������� �������� ������� ����� ������ �����



%������� 13.
% �������� kollanz(+Number) - ������� �����, ��� ������� �������
% �������� ����� ������������ �����
%������������������ ���������� � 1, �������� 1.
kollanz(Number):-kollanz(1,1,1,Number).

kollanz(1000000,Iteration,_,Iteration):-!. %������� ���������, ���� ����� ������ ��������

% �������� kollanz(+Number,+Iteration,+Max_Iteration,-Max_Number) - �������� ����
% Number - ������� �� 1 �� 1000000
% Iteration - �����, ��� ������� ���� �����������
% Lenght - ������������ ����� ������� �� ������ ������
% Max_Number - ��������� ����������

kollanz(Number,Iteration,Max_Iteration,Max_Number):-New_number is Number+1,kollanz_chain(New_number,1,Lenght),
    (Lenght>Max_Iteration -> kollanz(New_number,New_number,Lenght,Max_Number);
    kollanz(New_number,Iteration,Max_Iteration,Max_Number)).


% �������� kollanz_chain(+Number,+Lenght,-Result),���������� ����� �������,
% ������� ���������� � Number,
kollanz_chain(1,Result,Result):-!.
kollanz_chain(Number,Lenght,Result):-Lenght1 is Lenght+1,(Number mod 2 =:= 0 -> New_Number is Number/2,kollanz_chain(New_Number,Lenght1,Result);New_Number is (Number*3+1),kollanz_chain(New_Number,Lenght1,Result)).


% ������� 14. ����� ���������� �����, ������� ������� � ��������
% ��������� ����� � ��������� ����


%�������� kol_mutually_prime_up(+Num,+I,?X) - �������� �����
%Num - �������� �����
%I - ������� �� 1 �� Num
%X - ���������
kol_mutually_prime_up(_,0,0):-!.%��� ��������
kol_mutually_prime_up(N,I,X):-nod(N,I,Nod),Nod =:= 1,I1 is I-1,kol_mutually_prime_up(N,I1,X1),X is X1+1,!;I1 is I-1,kol_mutually_prime_up(N,I1,X1), X is X1.
kol_mutually_prime_up(N,X):-kol_mutually_prime_up(N,N,X).


% �������� mutually_prime(+X,+Y,-Z) - ���������� ���� ���� nod(X,Y,1),
% ����� 0
mutually_prime(X,Y,Z):-nod(X,Y,Nod),Nod =:= 1, Z is 1,!.
mutually_prime(_,_,Z):- Z is 0,!.

%�������� kol_mutually_prime_down(+Num,+I,+Kol,-X) - �������� ����
%Num - �������� �����
%I - ������� �� 1 �� Num
%Kol - ���������� �� ������ ����
%X - ���������
kol_mutually_prime_down(N,N,X,X):-!.%���������
kol_mutually_prime_down(N,I,Kol,X):- mutually_prime(N,I,Nod),I1 is I+1, Kol1 is Kol+Nod,kol_mutually_prime_down(N,I1,Kol1,X).

kol_mutually_prime_down(N,X):-kol_mutually_prime_down(N,1,0,X).


%������� 15. ����� �������� �����, ���������� ������� ������� � ���������� ����������� ���� ������� �����.

mutually(0,_,0):-!.
mutually(N,I,X):-N1 is N div 10, mutually(N1,I,X1), F is N mod 10,mutually_prime(F,I,Z), X is X1+Z. %� ���������� X ������������ ���������� ������� ������� � ������� ������� �����

% ������� ��� �������� � ������� �������� ����, �� ������ �������
% �������� ��������� �����, ��������� � ������� ��������� mutually
% ���������� ������� �������, ����� ��������� ����� ��� ���� ������
% ����������� ��������, ���������� ��� � ��� ��������.
delitel(0,_,_,Del,Del):-!.
delitel(I,N,Max_Mut,Del_Iteration,Del):-(N mod I =:= 0,mutually(N,I,Z),Z>Max_Mut -> Max is Z, Del_Iteration1 is I,I1 is I-1,
                                        delitel(I1,N,Max,Del_Iteration1,Del);
                                        I1 is I-1,delitel(I1,N,Max_Mut,Del_Iteration,Del)).


delitel(N,X):-delitel(N,N,0,0,X).%��� ������������: �������� delitel(+Number,-Delit), ��� Number �������� �����, Delit - ��������, ������� �������� ������� ������� � ������� ����������� ����



%������� 16. ������� ���������� �����, ������� 20000,
%������� ������ ����������� � ���� ����� ���� ����� � ��������.

%������� ����� ��������� �����

%�������� �������� divisors_sum(Number,I,Summ)
%Number - �����, �� �������� ���� ����� ���������
%I - �������
%Summ - ���������� �����

divisors_sum(_,0,0):-!.
divisors_sum(N,I,X):-N mod I =:= 0,I1 is I-1, divisors_sum(N,I1,X1), X is X1+I,!; N mod I=\= 0, I1 is I -1, divisors_sum(N,I1,X1), X is X1.
%�������� ��� ������������ divisors_sum(+Number,-Summ)
divisors_sum(N,X):-(N<0 -> N1 is N*(-1),divisors_sum(N1,N1,X1),X is X1-N1;divisors_sum(N,N,X1),X is X1-N).

%�������� �������� �� ������������ �����
redundant(Num):-divisors_sum(Num,Summ),Num<Summ.

%�������� �������� �� ��, ��� ����� ����� ��������� �� 2 ����������
summand(Num):-Number1 is 1,Number2 is Num-1,summand(Number1,Number2).
summand(Number1,Number2):-redundant(Number1),redundant(Number2),!.
summand(Number1,Number2):-Number1_1 is Number1 +1,Number2_1 is Number2-1,Number1=<Number2,summand(Number1_1,Number2_1).

%�������� �������� ���� ����� �� 1 �� 20000
kol_not_summand(Kol):-kol_not_summand(12,0,Kol).
kol_not_summand(20000,Kol,Kol):-!.
kol_not_summand(I,Kol,Kolvo):-(summand(I)->Kol1 is Kol;write(I),nl,Kol1 is Kol+1),I1 is I+1,kol_not_summand(I1,Kol1,Kolvo).


