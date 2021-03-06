
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

print_list([]).
print_list([Head|Tail]):-write(Head),print_list(Tail).

read_list_str(List, LengthList):-read_str(A,N,Flag),read_list_str([A],List,[N],LengthList,Flag).
read_list_str(List,List,LengthList, LengthList,1):-!.
read_list_str(Cur_list,List,CurLengthList,LengthList,0):-
	read_str(A,N,Flag),append(Cur_list,[A],C_l),append(CurLengthList, [N], NewLengthList),read_list_str(C_l,List,NewLengthList,LengthList,Flag).



in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

in_list_end([El|_],El):-!.
in_list_end([_|T],El):-in_list(T,El).

%������� 1:

%�������� build_all_razm_p -������ ��� ���������� � ������������ ����� k
build_all_razm_p:-read_str(A,_),read(K),b_a_rp(A,K,[]).

b_a_rp(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

build_all_perm:-read_str(A,_),b_a_p(A,[]).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_p([],Perm1):-write_str(Perm1),nl,!,fail.
b_a_p(A,Perm):-in_list_exlude(A,El,A1),b_a_p(A1,[El|Perm]).

build_all_razm:-read_str(A,_),read(K),b_a_r(A,K,[]).

b_a_r(_,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_r(A,N,Perm):-in_list_exlude(A,El,A1),N1 is N-1,b_a_r(A1,N1,[El|Perm]).


sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).
pr_subset:-read_str(A,_),sub_set(B,A),write_str(B),nl,fail.
%�������� sub_set(-B,+A) - ��� B ��� ����� ��������

sochet([],0,_):-!.
sochet([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet(Sub_set,K1,Set).
sochet(Sub_set,K,[_|Set]):-sochet(Sub_set,K,Set).
pr_sochet:-read_str(A,_),read(K),sochet(B,K,A),write_str(B),nl,fail.

sochet_p([],0,_):-!.
sochet_p([H|Sub_set],K,[H|Set]):-K1 is K-1,sochet_p(Sub_set,K1,[H|Set]).
sochet_p(Sub_set,K,[_|Set]):-sochet_p(Sub_set,K,Set).
pr_sochet_p:-read_str(A,_),read(K),sochet_p(B,K,A),write_str(B),nl,fail.




%������� 2. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, �
%������� ����� ��� ����� a. ����� � ����.

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

pr9_2_start:-tell('c:/Prolog/9_2.txt'),not(pr9_2),told.
pr9_2:-make_ar(5,Positions),sochet(A_Positions,2,Positions),put_sim(Itog_slovo,A_Positions,[97]),
	in_list([b,c,d,e,f],El11),
	name(El11,El1),
	put_tofree(Itog_slovo,El1),
	in_list([b,c,d,e,f],El22),
	name(El22,El2),
	put_tofree(Itog_slovo,El2),
	in_list([b,c,d,e,f],El33),
	name(El33,El3),
	put_tofree(Itog_slovo,El3),
	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

% �������� put_sim(-Itog_slovo,+Sim_positions,Simbol) - ������
% ���������� 2 ����� ��� �����
put_sim(Itog_Slovo,[Head1,Head2],[Sim]):-put_(Itog_Slovo,Head1,Sim),put_(Itog_Slovo,Head2,Sim).

%������� put_(-Itog_Slovo,Num,Sim) - ������ �� ������� Num ����� Sim
put_(Itog_slovo,Head,Sim):-

	(Head is 1->Itog_slovo=[Sim,_,_,_,_],!);
	(Head is 2->Itog_slovo=[_,Sim,_,_,_],!);
	(Head is 3->Itog_slovo=[_,_,Sim,_,_],!);
	(Head is 4->Itog_slovo=[_,_,_,Sim,_],!);
	(Head is 5->Itog_slovo=[_,_,_,_,Sim]).


%�������� put_tofree(Itog_slovo,Sim) - ������ �� ��������� ����� ������

put_tofree([H1,H2,H3,H4,H5],Sim):-
	(var(H1)->H1 is Sim),!;
	(var(H2)->H2 is Sim),!;
	(var(H3)->H3 is Sim),!;
	(var(H4)->H4 is Sim),!;
	(var(H5)->H5 is Sim),!.



% ������� 3. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, �
%������� ����� 2 ����� a, ��������� ����� �� �����������. ����� � ����.

pr9_3_start:-tell('c:/Prolog/9_3.txt'),not(pr9_3),told.
pr9_3:-Alfavit=[b,c,d,e,f],make_ar(5,Positions),sochet(A_Positions,2,Positions),put_sim(Itog_slovo,A_Positions,[97]),

	in_list(Alfavit,El11),
	delete(Alfavit,El11,Alfavit_without1),
	name(El11,El1),
	put_tofree(Itog_slovo,El1),
	in_list(Alfavit_without1,El22),
	delete(Alfavit_without1,El22,Alfavit_without2),
	name(El22,El2),
	put_tofree(Itog_slovo,El2),
	in_list(Alfavit_without2,El33),
	name(El33,El3),
	put_tofree(Itog_slovo,El3),
	name(Itog,Itog_slovo),
	write(Itog),nl,fail.


% ������� 4. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 5, �
%������� ����� ���� ����� ����������� 2 ����, ��������� ����� ��
%�����������. ����� � ����.

pr9_4_start:-tell('c:/Prolog/9_4.txt'),not(pr9_4),told.
pr9_4:-Alfavit=[a,b,c,d,e,f],make_ar(5,Positions),sochet(Sim_Positions,2,Positions),
	in_list(Alfavit,El_when_2), %������� ����� ������� ����������� 2 ����
	delete(Alfavit,El_when_2,Alvavit_without),
	name(El_when_2,El),
	put_sim(Itog_slovo,Sim_Positions,El),

	in_list(Alvavit_without,El11),
	delete(Alvavit_without,El11,Alfavit_without1),
	name(El11,El1),
	put_tofree(Itog_slovo,El1),
	in_list(Alfavit_without1,El22),
	delete(Alfavit_without1,El22,Alfavit_without2),
	name(El22,El2),
	put_tofree(Itog_slovo,El2),
	in_list(Alfavit_without2,El33),
	name(El33,El3),
	put_tofree(Itog_slovo,El3),
	name(Itog,Itog_slovo),
	write(Itog),nl,fail.


%������� 5. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 6, �
%������� ����� 2 ����� ����������� 2 ����, ��������� ����� ��
%�����������. ����� � ����.

pr9_5_start:-tell('c:/Prolog/9_5.txt'),not(pr9_5),told.
pr9_5:-Alfavit=[a,b,c,d,e,f],make_ar(6,Positions),

	sochet(Sim1_Positions,2,Positions),%�������� 2 ������� ��� ������ �����
	in_list(Alfavit,El1_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit,El1_when_2,Alfavit_without_first),
	name(El1_when_2,El1_when),
	put_sim_6(Itog_slovo,Sim1_Positions,El1_when),%����������� �


	delete_position(Positions,Sim1_Positions,New_Position), %������� ������������� �������
	sochet(Sim2_Positions,2,New_Position), %�������� 2 ������� ��� ������ �����

	in_list(Alfavit_without_first,El2_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit_without_first,El2_when_2,Alvavit_without_second),
	name(El2_when_2,El2_when),
	put_sim_6(Itog_slovo,Sim2_Positions,El2_when),%����������� �


	in_list(Alvavit_without_second,El11), %�������� ���������� �����
	delete(Alvavit_without_second,El11,Alfavit_without_three),
	name(El11,El1),
	put_tofree_6(Itog_slovo,El1),


	in_list(Alfavit_without_three,El22),
	delete(Alfavit_without_three,El22,_),
	name(El22,El2),
	put_tofree_6(Itog_slovo,El2),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.


%������������ ��� 6 ����
% �������� put_sim_6(-Itog_slovo,+Sim_positions,Simbol) - ������
% ���������� 2 ����� ��� �����
put_sim_6(Itog_Slovo,[Head1,Head2],[Sim]):-put_6(Itog_Slovo,Head1,Sim),put_6(Itog_Slovo,Head2,Sim).

%������� put_6(-Itog_Slovo,Num,Sim) - ������ �� ������� Num ����� Sim
put_6(Itog_slovo,Head,Sim):-

	(Head is 1->Itog_slovo=[Sim,_,_,_,_,_],!);
	(Head is 2->Itog_slovo=[_,Sim,_,_,_,_],!);
	(Head is 3->Itog_slovo=[_,_,Sim,_,_,_],!);
	(Head is 4->Itog_slovo=[_,_,_,Sim,_,_],!);
	(Head is 5->Itog_slovo=[_,_,_,_,Sim,_],!);
	(Head is 6->Itog_slovo=[_,_,_,_,_,Sim]).


% �������� put_tofree_6(Itog_slovo,Sim) - ������ �� ��������� �����
% ������

put_tofree_6([H1,H2,H3,H4,H5,H6],Sim):-
	(var(H1)->H1 is Sim),!;
	(var(H2)->H2 is Sim),!;
	(var(H3)->H3 is Sim),!;
	(var(H4)->H4 is Sim),!;
	(var(H5)->H5 is Sim),!;
	(var(H6)->H6 is Sim),!.

% �������� delete_position(Position,Sim_Positions,Other_Position) -
% ������� ������������� �������

delete_position(Position,[Head1,Head2],New_Position):-delete(Position,Head1,I),delete(I,Head2,New_Position).
delete_position(Position,[Head1,Head2,Head3],New_Position):-delete(Position,Head1,I1),delete(I1,Head2,I),delete(I,Head3,New_Position).

%������� 6. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 7, �
%������� ����� 1 ����� ����������� 2 ����, ����� ���� ����� �����������
%3 ���� ��������� ����� �� �����������. ����� � ����.

pr9_6_start:-tell('c:/Prolog/9_6.txt'),not(pr9_6),told.
pr9_6:-Alfavit=[a,b,c,d,e,f],make_ar(7,Positions),

	sochet(Sim1_Positions,2,Positions),%�������� 2 ������� ��� ������ �����
	in_list(Alfavit,El1_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit,El1_when_2,Alfavit_without_first),
	name(El1_when_2,El1_when),
	put_sim_7(Itog_slovo,Sim1_Positions,El1_when),%����������� �


	delete_position(Positions,Sim1_Positions,New_Position), %������� ������������� �������
	sochet(Sim2_Positions,3,New_Position), %�������� 3 ������� ��� ������ �����


	in_list(Alfavit_without_first,El2_when_3), %������� ������ ����� ������� ����������� 3 ����
	delete(Alfavit_without_first,El2_when_3,Alvavit_without_second),
	name(El2_when_3,El2_when),
	put_sim_7(Itog_slovo,Sim2_Positions,El2_when),%����������� �

	in_list(Alvavit_without_second,El11), %�������� ��� ���������� �����
	delete(Alvavit_without_second,El11,Alfavit_without_three),
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),


	in_list(Alfavit_without_three,El22),
	delete(Alfavit_without_three,El22,_),
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.


%������������ ��� 7 ����
% �������� put_sim_7(-Itog_slovo,+Sim_positions,Simbol) - ������
% ���������� 2 ����� ��� �����

put_sim_7(_,[],[_]):-!.
put_sim_7(Itog_Slovo,[Head|Tail],[Sim]):-put_7(Itog_Slovo,Head,Sim),put_sim_7(Itog_Slovo,Tail,[Sim]).

%������� put_7(-Itog_Slovo,Num,Sim) - ������ �� ������� Num ����� Sim
put_7(Itog_slovo,Head,Sim):-

	(Head is 1->Itog_slovo=[Sim,_,_,_,_,_,_],!);
	(Head is 2->Itog_slovo=[_,Sim,_,_,_,_,_],!);
	(Head is 3->Itog_slovo=[_,_,Sim,_,_,_,_],!);
	(Head is 4->Itog_slovo=[_,_,_,Sim,_,_,_],!);
	(Head is 5->Itog_slovo=[_,_,_,_,Sim,_,_],!);
	(Head is 6->Itog_slovo=[_,_,_,_,_,Sim,_],!);
	(Head is 7->Itog_slovo=[_,_,_,_,_,_,Sim]).


% �������� put_tofree_7(Itog_slovo,Sim) - ������ �� ��������� �����
% ������

put_tofree_7([H1,H2,H3,H4,H5,H6,H7],Sim):-
	(var(H1)->H1 is Sim),!;
	(var(H2)->H2 is Sim),!;
	(var(H3)->H3 is Sim),!;
	(var(H4)->H4 is Sim),!;
	(var(H5)->H5 is Sim),!;
	(var(H6)->H6 is Sim),!;
	(var(H7)->H7 is Sim),!.


%������� 7. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 9, �
%������� ����� 2 ����� ����������� 2 ����, ����� ���� ����� �����������
%��� ����, ��������� ����� �� �����������. ����� � ����.

pr9_7_start:-tell('c:/Prolog/9_7.txt'),not(pr9_7),told.
pr9_7:-Alfavit=[a,b,c,d,e,f],make_ar(9,Positions),

	sochet(Sim1_Positions,2,Positions),%�������� 2 ������� ��� ������ �����

	in_list(Alfavit,El1_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit,El1_when_2,Alfavit_without_first),
	name(El1_when_2,El1_when),
	put_sim_9(Itog_slovo,Sim1_Positions,El1_when),%����������� �



	delete_position(Positions,Sim1_Positions,New_Position), %������� ������������� �������
	sochet(Sim2_Positions,2,New_Position), %�������� 2 ������� ��� ������ �����


	in_list(Alfavit_without_first,El2_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit_without_first,El2_when_2,Alfavit_without_second),
	name(El2_when_2,El2_when),
	put_sim_9(Itog_slovo,Sim2_Positions,El2_when),%����������� �

	delete_position(New_Position,Sim2_Positions,New2_Position), %������� ������������� �������
	sochet(Sim3_Positions,3,New2_Position), %�������� 3 ������� ��� ������� �����

	in_list(Alfavit_without_second,El3_when_3), %������� ������ ����� ������� ����������� 3 ����
	delete(Alfavit_without_second,El3_when_3,Alvavit_without_three),
	name(El3_when_3,El3_when),
	put_sim_9(Itog_slovo,Sim3_Positions,El3_when),%����������� �


	in_list(Alvavit_without_three,El11), %�������� ��� ���������� �����
	delete(Alvavit_without_three,El11,Alfavit_without_four),
	name(El11,El1),
	put_tofree_9(Itog_slovo,El1),

	in_list(Alfavit_without_four,El22),
	delete(Alfavit_without_four,El22,_),
	name(El22,El2),
	put_tofree_9(Itog_slovo,El2),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%������������ ��� 9 ����
% �������� put_sim_9(-Itog_slovo,+Sim_positions,Simbol) - ������
% ���������� 2 ����� ��� �����
put_sim_9(Itog_Slovo,[Head1,Head2],[Sim]):-put_9(Itog_Slovo,Head1,Sim),put_9(Itog_Slovo,Head2,Sim).
put_sim_9(Itog_Slovo,[Head1,Head2,Head3],[Sim]):-put_9(Itog_Slovo,Head1,Sim),put_9(Itog_Slovo,Head2,Sim),put_9(Itog_Slovo,Head3,Sim).

%������� put_9(-Itog_Slovo,Num,Sim) - ������ �� ������� Num ����� Sim
put_9(Itog_slovo,Head,Sim):-

	(Head is 1->Itog_slovo=[Sim,_,_,_,_,_,_,_,_],!);
	(Head is 2->Itog_slovo=[_,Sim,_,_,_,_,_,_,_],!);
	(Head is 3->Itog_slovo=[_,_,Sim,_,_,_,_,_,_],!);
	(Head is 4->Itog_slovo=[_,_,_,Sim,_,_,_,_,_],!);
	(Head is 5->Itog_slovo=[_,_,_,_,Sim,_,_,_,_],!);
	(Head is 6->Itog_slovo=[_,_,_,_,_,Sim,_,_,_],!);
	(Head is 7->Itog_slovo=[_,_,_,_,_,_,Sim,_,_],!);
	(Head is 8->Itog_slovo=[_,_,_,_,_,_,_,Sim,_],!);
	(Head is 9->Itog_slovo=[_,_,_,_,_,_,_,_,Sim]).


% �������� put_tofree_9(Itog_slovo,Sim) - ������ �� ��������� �����
% ������

put_tofree_9([H1,H2,H3,H4,H5,H6,H7,H8,H9],Sim):-
	(var(H1)->H1 is Sim),!;
	(var(H2)->H2 is Sim),!;
	(var(H3)->H3 is Sim),!;
	(var(H4)->H4 is Sim),!;
	(var(H5)->H5 is Sim),!;
	(var(H6)->H6 is Sim),!;
	(var(H7)->H7 is Sim),!;
	(var(H8)->H8 is Sim),!;
	(var(H9)->H9 is Sim),!.


%������� 8. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 4, �
%������� ������ ���� ���� �. ����� � ����.

pr9_8_start:-tell('c:/Prolog/9_8.txt'),not(pr9_8_2),not(pr9_8_3),write("aaaa"),told.


%����� � 2 ��� ����
pr9_8_2:-Alfavit=[b,c,d,e,f],make_ar(4,Positions),sochet(Sim_Positions,2,Positions),

	put_sim_4(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),
	name(El11,El1),
	put_tofree_4(Itog_slovo,El1),

	in_list(Alfavit,El22),
	name(El22,El2),
	put_tofree_4(Itog_slovo,El2),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%����� � 3 ����
pr9_8_3:-Alfavit=[b,c,d,e,f],make_ar(4,Positions),sochet(Sim_Positions,3,Positions),

	put_sim_4(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),
	name(El11,El1),
	put_tofree_4(Itog_slovo,El1),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%������������ ��� 4 ����
% �������� put_sim_4(-Itog_slovo,+Sim_positions,Simbol) - ������
% ���������� 2 ����� ��� �����
put_sim_4(Itog_Slovo,[Head1,Head2],[Sim]):-put_4(Itog_Slovo,Head1,Sim),put_4(Itog_Slovo,Head2,Sim).
put_sim_4(Itog_Slovo,[Head1,Head2,Head3],[Sim]):-put_4(Itog_Slovo,Head1,Sim),put_4(Itog_Slovo,Head2,Sim),put_4(Itog_Slovo,Head3,Sim).

%������� put_9(-Itog_Slovo,Num,Sim) - ������ �� ������� Num ����� Sim
put_4(Itog_slovo,Head,Sim):-

	(Head is 1->Itog_slovo=[Sim,_,_,_],!);
	(Head is 2->Itog_slovo=[_,Sim,_,_],!);
	(Head is 3->Itog_slovo=[_,_,Sim,_],!);
	(Head is 4->Itog_slovo=[_,_,_,Sim]).


put_tofree_4([H1,H2,H3,H4],Sim):-
	(var(H1)->H1 is Sim),!;
	(var(H2)->H2 is Sim),!;
	(var(H3)->H3 is Sim),!;
	(var(H4)->H4 is Sim),!.


% ������� 9. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 7, �
%������� ������ ���� ���� �. ����� � ����.


pr9_9_start:-tell('c:/Prolog/9_9.txt'),not(pr9_9_2),not(pr9_9_3),not(pr9_9_4),not(pr9_9_5),not(pr9_9_6),write("aaaaaaa"),told.


%����� � 2 ��� ����
pr9_9_2:-Alfavit=[b,c,d,e,f],make_ar(7,Positions),sochet(Sim_Positions,2,Positions),

	put_sim_7(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),%1
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),

	in_list(Alfavit,El22),%2
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),

	in_list(Alfavit,El33),%3
	name(El33,El3),
	put_tofree_7(Itog_slovo,El3),

	in_list(Alfavit,El44),%4
	name(El44,El4),
	put_tofree_7(Itog_slovo,El4),

	in_list(Alfavit,El55),%5
	name(El55,El5),
	put_tofree_7(Itog_slovo,El5),

	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%����� � 3 ����
pr9_9_3:-Alfavit=[b,c,d,e,f],make_ar(7,Positions),sochet(Sim_Positions,3,Positions),


	put_sim_7(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),%1
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),

	in_list(Alfavit,El22),%2
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),

	in_list(Alfavit,El33),%3
	name(El33,El3),
	put_tofree_7(Itog_slovo,El3),

	in_list(Alfavit,El44),%4
	name(El44,El4),
	put_tofree_7(Itog_slovo,El4),

	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%����� a 4 ����
pr9_9_4:-Alfavit=[b,c,d,e,f],make_ar(7,Positions),sochet(Sim_Positions,4,Positions),


	put_sim_7(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),%1
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),

	in_list(Alfavit,El22),%2
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),

	in_list(Alfavit,El33),%3
	name(El33,El3),
	put_tofree_7(Itog_slovo,El3),

	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%����� a 5 ����
pr9_9_5:-Alfavit=[b,c,d,e,f],make_ar(7,Positions),sochet(Sim_Positions,5,Positions),


	put_sim_7(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),%1
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),

	in_list(Alfavit,El22),%2
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),

	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%����� a 6 ����
pr9_9_6:-Alfavit=[b,c,d,e,f],make_ar(7,Positions),sochet(Sim_Positions,6,Positions),


	put_sim_7(Itog_slovo,Sim_Positions,[97]),

	in_list(Alfavit,El11),%1
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),

	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

% ������� 10. ���� ��������� {a,b,c,d,e,f}. ��������� ��� ����� ����� 7,
% � ������� ����� 4 ��������� �����. �������������� �������*. ����� � ����.


pr9_10_start:-tell('c:/Prolog/9_10.txt'),not(pr9_10_4_1_1_1),not(pr9_10_3_2_1_1),not(pr9_10_2_2_2_1),told.

%4-1-1-1
pr9_10_4_1_1_1:-Alfavit=[a,b,c,d,e,f],sochet(Alfavit_4,4,Alfavit),
	make_ar(7,Positions),sochet(Sim_Positions,4,Positions),

	in_list(Alfavit_4,El1_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit_4,El1_when_2,Alfavit_without_first),
	name(El1_when_2,El1_when),
	put_sim_7(Itog_slovo,Sim_Positions,El1_when),%����������� �

	in_list(Alfavit_without_first,El11), %�������� 1 ���� ������
	delete(Alfavit_without_first,El11,Alfavit_without_second),
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),


	in_list(Alfavit_without_second,El22), %�������� 1 ���� ������
	delete(Alfavit_without_second,El22,Alfavit_without_three),
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),

	in_list(Alfavit_without_three,El33), %�������� 1 ���� ������
	name(El33,El3),
	put_tofree_7(Itog_slovo,El3),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%3-2-1-1
pr9_10_3_2_1_1:-Alfavit=[a,b,c,d,e,f],sochet(Alfavit_4,4,Alfavit),
	make_ar(7,Positions),sochet(Sim_Positions,2,Positions),

	in_list(Alfavit_4,El1_when_2), %������� ������ ����� ������� ����������� 2 ����
	delete(Alfavit_4,El1_when_2,Alfavit_without_first),
	name(El1_when_2,El1_when),
	put_sim_7(Itog_slovo,Sim_Positions,El1_when),%����������� �

	delete_position(Positions,Sim_Positions,New_Position), %������� ������������� �������
	sochet(Sim2_Positions,3,New_Position), %�������� 3 ������� ��� ������ �����

	in_list(Alfavit_without_first,El2_when_2),
	delete(Alfavit_without_first,El2_when_2,Alfavit_without_second),
	name(El2_when_2,El2_when),
	put_sim_7(Itog_slovo,Sim2_Positions,El2_when),%����������� �

	in_list(Alfavit_without_second,El11),
	delete(Alfavit_without_second,El11,Alfavit_without_three),
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),


	in_list(Alfavit_without_three,El22), %�������� 1 ���� ������
	name(El22,El2),
	put_tofree_7(Itog_slovo,El2),



	name(Itog,Itog_slovo),
	write(Itog),nl,fail.

%2-2-2-1
pr9_10_2_2_2_1:-Alfavit=[a,b,c,d,e,f],	make_ar(7,Positions),sochet([El1_when_2,El2_when_2,El3_when_2],3,Alfavit),

	sochet(Sim1_Positions,2,Positions),%�������� 2 ������� ��� ������ �����

	name(El1_when_2,El1_when),
	put_sim_7(Itog_slovo,Sim1_Positions,El1_when),%����������� �

	delete_position(Positions,Sim1_Positions,New_Position), %������� ������������� �������
	sochet(Sim2_Positions,2,New_Position), %�������� 2 ������� ��� ������ �����

	name(El2_when_2,El2_when),
	put_sim_7(Itog_slovo,Sim2_Positions,El2_when),%����������� �

	delete_position(New_Position,Sim2_Positions,New_New_Position), %������� ������������� �������
	sochet(Sim3_Positions,2,New_New_Position), %�������� 2 ������� ��� ������� �����

	name(El3_when_2,El3_when),
	put_sim_7(Itog_slovo,Sim3_Positions,El3_when),%����������� �

	delete_position(Alfavit,[El1_when_2,El2_when_2,El3_when_2],New_alfavit),%������� ������������� �����


	in_list(New_alfavit,El11),
	name(El11,El1),
	put_tofree_7(Itog_slovo,El1),


	name(Itog,Itog_slovo),
	write(Itog),nl,fail.



%2. ��������� �������� ���������� SWI-Prolog, ������� ���������� � �������
% � ���� ��� ����� �������� {a,b,c,d,e,f} ����� n, � ������� ����� ����
% ����� ����������� k ���, � ������ m ���, ��������� ����� ����������� ����� 1 ���
% ��� �� ����������� ������.

pr9_11_start:-Alfavit=[a,b,c,d,e,f],write("������� N = "),read(N),write("������� K = "),read(K),write("������� M = "),read(M),not(build_all(Alfavit,N, K,M)),tell('c:/Prolog/9_11.txt'),not(build_all(Alfavit,N, K,M)),told.


%���������� ��� ����� �������� �����:
b_a_r_p(_,0, []):-!.
b_a_r_p(Alfavit,N, [Head|Tail]):- in_list(Alfavit,Head), N1 is N - 1,b_a_r_p(Alfavit,N1, Tail).



counter(Word, El, Kolvo):-
    in_list(Word,El),%��������,��� ������� ���� � �����
    findall(El, in_list(Word,El), List_of_Elem),%���������� ������ �� ����� ��������
    length(List_of_Elem, Kolvo).%������� ���������

%  ������� �� ����� ���� ����� M ���
condition_on_M(Word, M, List_simbol):-
    findall(El,counter(Word, El, M),List_of_M),%�������� �������, ������� ����������� M ���
    list_to_set(List_of_M, List_simbol),%������� �������
    length(List_simbol, 1).%����� ��������� ������ ���� 1

% ������� ��  ����� ���� ����� K ���
condition_on_K(Word, K, List_simbol):-
    findall(El,counter(Word, El, K),List_of_K),%�������� �������, ������� ����������� K ���
    list_to_set(List_of_K, List_simbol),%������� �������
    length(List_simbol, 1).%����� ��������� ������ ���� 1

%������� ��
condition_on_other(Word, Simbol1, Simbol2):-
    append(Simbol1, Simbol2, Simbol1_Simbol2),%���������� ������� �� 2 ���������� �������
    subtract(Word, Simbol1_Simbol2, Other),%������� �� �� �����
    is_set(Other).%��������,����� ���������� �������� �� �����������

%������ ��� ����� ��������������� 3 ��
build(Alfavit,N, �,M, Word):-
    b_a_r_p(Alfavit,N,Word), %������ ��� �����
    condition_on_M(Word, M,Simbol1),
    condition_on_K(Word, �, Simbol2),
    condition_on_other(Word, Simbol1, Simbol2).

build_all(Alfavit,N, �,M):-
  build(Alfavit,N, �,M, Word),
  print_list(Word), nl, fail.
