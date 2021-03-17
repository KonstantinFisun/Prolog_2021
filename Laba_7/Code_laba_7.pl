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












