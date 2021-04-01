
read_str(A):-get0(X),r_str(X,A,[]).

del_1st([_|T],T).

r_str(10,A,A):-!.
r_str(X,A,B):-append(B,[X],B1),get0(X1),r_str(X1,A,B1).

read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_list_str(List):-read_str(A,_,Flag),read_list_str([A],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,_,Flag),append(Cur_list,[A],C_l),read_list_str(C_l,List,Flag).


get_graph_edges(V,E):-get_V(V),write(V),nl,write("Edges"),nl,get_edges(V,E),write(E).
%Считываем вершины
get_V(V):-read(N),write("Vertexes"),nl,N1 is N+1,get_V(V1,N1),del_1st(V1,V).
get_V([],0):-!.
get_V([H|T],N):-read_str(X),name(H,X),N1 is N-1,get_V(T,N1).

%Считываем ребра
get_edges(V,E):-read(M),get0(_),get_edges(V,E,[],M,0).
get_edges(_,E,E,M,M):-!.
get_edges(V,E,Edges,M,Count):-get_edge(V,Edge),append(Edges,[Edge],E1),Count1 is Count+1,get_edges(V,E,E1,M,Count1).

get_edge(V,[V1,V2]):-write("Edge"),nl,read_str(X),name(V1,X),check_vertex(V,V1),read_str(Y),name(V2,Y),check_vertex(V,V2).

%Ограниченный
in_list1([El|_],El):-!.
in_list1([_|T],El):-in_list1(T,El).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

append1([],X,X):-!.
append1([H|T],X,[H |Z]):-append1(T,X,Z).


check_vertex([V1|_],V1):-!.
check_vertex([_|T],V1):-check_vertex(T,V1).



%Гамильтон
gamilton:-get_graph_edges(V,E),gamilton(V,E).


gamilton(V,E):-b_a_r(V,_,Way),way_check(Way,E),write(Way).

way_check([H|T],E):-append1([H|T],[H],Way),w_c(Way,E).
w_c([_],_):-!.
w_c([V1,V2|T],E):-in_list1(E,[V1,V2]),w_c([V2|T],E).

in_list_exlude([El|T],El,T).
in_list_exlude([H|T],El,[H|Tail]):-in_list_exlude(T,El,Tail).

b_a_r([],Perm1,Perm1):-!.
b_a_r(A,Perm,Perm1):-in_list_exlude(A,El,A1),b_a_r(A1,[El|Perm],Perm1).




euler:-get_graph_edges(V,E),euler(V,E).

euler(_,E):-b_a_r(E,_,Way),way_edge_check(Way),write(Way).
way_edge_check([H|T]):-append1([H|T],[H],Way),w_e_c(Way).
w_e_c([_]):-!.
w_e_c([[_,X]|[[X|Y]|Tail]]):-w_e_c([[X|Y]|Tail]).


euler_N:-get_graph_edges(V,E),euler_N(V,E).



euler_N(_,E):-b_a_r(E,_,Way),way_edge_check_N(Way),write(Way).
way_edge_check_N([H|T]):-append1([H|T],[H],Way),w_e_c_N(Way).
w_e_c_N([_]):-!.
w_e_c_N([[_,X]|[[X,Y]|Tail]]):-w_e_c_N([[X,Y]|Tail]).
w_e_c_N([[_,X]|[[Y,X]|Tail]]):-w_e_c_N([[X,Y]|Tail]).




raskras(K):-get_graph_edges(V,E),make_ar(K,C),raskras(V,E,C,[],Itog),write(Itog).

make_ar(0,[]):-!.
make_ar(K,[K|Tail]):-K1 is K-1,make_ar(K1,Tail).

raskras([],_,_,Itog,Itog):-!.
raskras([V|Vtail],E,C,Ras,Itog):-
	in_list(C,Color),check_color(V,E,Color,Ras),append1(Ras,[[V,Color]],Ras1),
	raskras(Vtail,E,C,Ras1,Itog).

check_color(_,_,_,[]):-!.
check_color(V,E,C1,[[_,C2]|Tail]):-C1\=C2,check_color(V,E,C1,Tail),!.
check_color(V,E,Col,[[Ver,Col]|Tail]):-
	not(in_list1(E,[V,Ver])),not(in_list1(E,[Ver,V])),
	check_color(V,E,Col,Tail).



make_way:-
	get_graph_edges(V,E),write("Otkuda"),nl,read_str(X),name(I,X),
	write("Kuda"),nl,read_str(Y),name(S,Y),make_way(V,E,I,S,Way),
	write_way(Way).

make_way(V,E,I,S,Way):-in_list_exlude(V,I,Tail),make_way(Tail,E,I,S,[I],Way).
make_way(_,_,S,S,Way,Way):-!.
make_way(V,E,I,S,Cur_Way,Way):-	in_list_exlude(V,X,Tail),in_list1(E,[I,X]),
								append1(Cur_Way,[X],C_W),make_way(Tail,E,X,S,C_W,Way).

write_way([V]):-write(" "),write(V),write("."),!.
write_way([V|Tail]):-write(" "),write(V),write(" -"),write_way(Tail).

list_len([],0):-!.
list_len([_|T],L):-list_len(T,L1),L is L1+1.


short_way:-get_graph_edges(V,E),write("Otkuda"),nl,read_str(X),name(I,X),
	write("Kuda"),nl,read_str(Y),name(S,Y),list_len(V,Len),
	short_way(V,E,I,S,Way,Len+1),write_way(Way).

short_way(V,E,I,S,Way,Len):-short_way(V,E,I,S,Way,_,Len).
short_way(V,E,I,S,Way,_,Len):-
	make_way(V,E,I,S,Cur_Way1),list_len(Cur_Way1,L),L<Len,!,short_way(V,E,I,S,Way,Cur_Way1,L).
short_way(_,_,_,_,Way,Way,_).



%1. Дано два смешанных графа, для которых обязательно указано
%множество вершин. Построить объединение, пересечение и сумму по
%модулю два этих графов.
%Считывание графа из файла
read_graph(H,T):-   read_list_str([H|T]).
		    %length_str(H,N), - кол-во вершин



pr10_1:-see('c:/Prolog/graf1.txt'),read_graph(V1,E1),seen,write("Введите первый граф"),nl,write(V1),nl,write(E1),nl,
	see('c:/Prolog/graf2.txt'),read_graph(V2,E2),seen,write("Введите второй граф"),nl,write(V2),nl,write(E2),nl,
	unification(V1,V2,E1,E2,V1_V2,E1_E2),nl,
	write("Операция объединения: Вершины - "),write(V1_V2),write("Ребра - "),write(E1_E2),nl,intersection(V1,V2,E1,E2,V1andV2,E1andE2),
	write("Операция пересечения: Вершины - "),write(V1andV2),write("Ребра - "),write(E1andE2),nl,sum_of_2_graf(V1,V2,E1,E2,V1sV2,E1sE2),
	write("Операция суммы по модулю: Вершины - "),write(V1sV2),write("Ребра - "),write(E1sE2).

%Объединение
unification(V1,V2,E1,E2,V1_V2,E1_E2):-append(V1,V2,V),list_to_set(V,V1_V2),append(E1,E2,E),list_to_set(E,E1_E2).

%Пересечение
intersection(V1,V2,E1,E2,V1_V2,E1_E2):-append(V1,V2,V),append(E1,E2,E),rem_uniq(V,V1_V2),rem_uniq(E,E1_E2).

%Сумма по модулю 2 графов
sum_of_2_graf(V1,V2,E1,E2,V1_V2,E1_E2):-append(V1,V2,V),list_to_set(V,V1_V2),sverim(E1,E2,E12),sverim(E2,E1,E21),append(E12,E21,E1_E2).

%Сумма по модулю 2
sverim([],_,[]):-!.
sverim([Head|Tail],L2,L3):- sverim(Tail,L2,L4),(not(in_list(L2,Head)) -> append([Head],L4,L3);append([],L4,L3)).

%Предикат оставляющий повторяющиеся элементы

counter(_,[],0):-!.
counter(X,[X|T],N):- counter(X,T,N1), N is N1+1,!.
counter(X,[_|T],N):- counter(X,T,N).

del(_,[],[]):-!.
del(X,[X|R],Q):-del(X,R,Q).
del(X,[Y|R],[Y|Q]):-del(X,R,Q).

rem_uniq([],[]):-!.
rem_uniq([H|T],[H|R]):- counter(H,T,N), N==1,del(H,T,Z),rem_uniq(Z,R),!.
rem_uniq([H|T],R):- del(H,T,Z),rem_uniq(Z,R).

%2. Дан код Прюфера, построить матрицу смежности вершин дерева.
make_arr(48,[]):-!.
make_arr(K,[K|Tail]):-K1 is K-1,make_arr(K1,Tail).

pr10_2:-write("Код Прюфера:"),nl,read_str(Code),write(Code),nl,length(Code,N),V_N is N+2+48,
	make_arr(V_N,V1),reverse(V1,V),write(V),code_pryf(Code,[Ver1,Ver2],V,[],E),nl,append(E,[[Ver1,Ver2]],E_end),nl,write(E_end).

% Минимальная вершина, не содержащаяся в коде Прюфера.
%Предикат min_v_not_pryf(+Code,+Ver_list,V)


min_v_not_pryf(Code,[Head|Tail],V):-(not(in_list1(Code,Head))->V is Head,!;min_v_not_pryf(Code,Tail,V)).

%Построение кода Прюфера
%Предикат code_pryf(+Code,-I_Code,-Ver_list,+I_Ver_list,+I_E,-E)

code_pryf([],Ver_list,Ver_list,E,E):-!.
code_pryf([Head_C|Tail_C],Ver_list,I_Ver_list,I_E,E):-min_v_not_pryf([Head_C|Tail_C],I_Ver_list,V),append(I_E,[[Head_C,V]],I1_E),delete(I_Ver_list,V,I1_Ver_list),code_pryf(Tail_C,Ver_list,I1_Ver_list,I1_E,E).
