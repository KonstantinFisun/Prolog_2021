% Предикат read_str(-Str,-Lenght) - чтение строки и подсчет количества
% символов в ней
read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.%Остановка
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

%Предикат write_str(+Str) - вывод строки
write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

% Предикат read_str(-Str,-Lenght,+Flag) - чтение строки и подсчет
% количества символов в ней, с флагом.
read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.%Остановка
r_str(10,A,A,N,N,0):-!.%Остановка
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



%Высказывание quest(+Question,+Hero,+Answer)
%Question - номер соответствующего вопроса
%Hero - имя персонажа
%Answer - Ответ
%fly

:- dynamic quest/3.

quest(1,spider-man, 0).
quest(1,iron_man, 1).
quest(1,hulk, 0).
quest(1,сaptain_america, 0).
quest(1,black_widow, 0).
quest(1,thor, 1).
quest(1,scarlet_witch, 1).
quest(1,doctor_strange, 1).
quest(1,clint, 0).
quest(1,black_panther, 0).
quest(1,war_machine, 1).
quest(1,vision, 1).
quest(1,nick_fury, 0).
quest(1,thanos, 0).
quest(1,groot, 0).
quest(1,gamora, 0).
quest(1,loki, 0).
quest(1,logan, 0).
quest(1,ultron, 1).
quest(1,quicksilver, 0).
quest(1,deadpool, 0).
quest(1,bucky, 0).
quest(1,venom, 0).
quest(1,red_skull, 0).
quest(1,captain_marvel, 1).
quest(1,doctor_octopus, 0).
quest(1,falcon, 1).
quest(1,rocket_raccoon, 0).
quest(1,green_goblin, 0).
quest(1,ant - man, 0).


%evil.

quest(2,spider-man, 0).
quest(2,iron_man, 0).
quest(2,hulk, 2).
quest(2,сaptain_america, 0).
quest(2,black_widow, 0).
quest(2,thor, 0).
quest(2,scarlet_witch, 0).
quest(2,doctor_strange, 0).
quest(2,clint, 0).
quest(2,black_panther, 0).
quest(2,war_machine, 0).
quest(2,vision, 0).
quest(2,nick_fury, 0).
quest(2,thanos, 1).
quest(2,groot, 0).
quest(2,gamora, 0).
quest(2,loki, 1).
quest(2,logan, 0).
quest(2,ultron, 1).
quest(2,quicksilver, 0).
quest(2,deadpool, 0).
quest(2,bucky, 0).
quest(2,venom, 1).
quest(2,red_skull, 1).
quest(2,captain_marvel, 0).
quest(2,doctor_octopus, 1).
quest(2,falcon, 0).
quest(2,rocket_raccoon, 0).
quest(2,green_goblin, 1).
quest(2,ant - man, 0).




%man.

quest(3,spider-man, 1).
quest(3,iron_man, 1).
quest(3,hulk, 1).
quest(3,сaptain_america, 1).
quest(3,black_widow, 1).
quest(3,thor, 2).
quest(3,scarlet_witch, 1).
quest(3,doctor_strange, 1).
quest(3,clint, 1).
quest(3,black_panther, 1).
quest(3,war_machine, 1).
quest(3,vision, 0).
quest(3,nick_fury, 1).
quest(3,thanos, 0).
quest(3,groot, 0).
quest(3,gamora, 0).
quest(3,loki, 2).
quest(3,logan, 1).
quest(3,ultron, 0).
quest(3,quicksilver, 1).
quest(3,deadpool, 1).
quest(3,bucky, 1).
quest(3,venom, 0).
quest(3,red_skull, 1).
quest(3,captain_marvel, 1).
quest(3,doctor_octopus, 1).
quest(3,falcon, 1).
quest(3,rocket_raccoon, 0).
quest(3,green_goblin, 1).
quest(3,ant - man, 1).




%size.

quest(4,spider - man, 0).
quest(4,iron_man, 0).
quest(4,hulk, 1).
quest(4,сaptain_america, 0).
quest(4,black_widow, 0).
quest(4,thor, 0).
quest(4,scarlet_witch, 0).
quest(4,doctor_strange, 0).
quest(4,clint, 0).
quest(4,black_panther, 0).
quest(4,war_machine, 0).
quest(4,vision, 0).
quest(4,nick_fury, 0).
quest(4,thanos, 0).
quest(4,groot, 0).
quest(4,gamora, 0).
quest(4,loki, 0).
quest(4,logan, 0).
quest(4,ultron, 0).
quest(4,quicksilver, 0).
quest(4,deadpool, 0).
quest(4,bucky, 0).
quest(4,venom, 0).
quest(4,red_skull, 0).
quest(4,captain_marvel, 0).
quest(4,doctor_octopus, 0).
quest(4,falcon, 0).
quest(4,rocket_raccoon, 0).
quest(4,green_goblin, 0).
quest(4,ant - man, 1).




%earth.

quest(5,spider - man, 1).
quest(5,iron_man, 1).
quest(5,hulk, 1).
quest(5,сaptain_america, 1).
quest(5,black_widow, 1).
quest(5,thor, 0).
quest(5,scarlet_witch, 1).
quest(5,doctor_strange, 1).
quest(5,clint, 1).
quest(5,black_panther, 1).
quest(5,war_machine, 1).
quest(5,vision, 1).
quest(5,nick_fury, 1).
quest(5,thanos, 0).
quest(5,groot, 0).
quest(5,gamora, 0).
quest(5,loki, 0).
quest(5,logan, 1).
quest(5,ultron, 1).
quest(5,quicksilver, 1).
quest(5,deadpool, 1).
quest(5,bucky, 1).
quest(5,venom, 0).
quest(5,red_skull, 1).
quest(5,captain_marvel, 1).
quest(5,doctor_octopus, 1).
quest(5,falcon, 1).
quest(5,rocket_raccoon, 0).
quest(5,green_goblin, 1).
quest(5,ant - man, 1).



%avengers.

quest(6,spider - man, 0).
quest(6,iron_man, 1).
quest(6,hulk, 1).
quest(6,сaptain_america, 1).
quest(6,black_widow, 1).
quest(6,thor, 1).
quest(6,scarlet_witch, 0).
quest(6,doctor_strange, 0).
quest(6,clint, 1).
quest(6,black_panther, 0).
quest(6,war_machine, 0).
quest(6,vision, 0).
quest(6,nick_fury, 0).
quest(6,thanos, 0).
quest(6,groot, 0).
quest(6,gamora, 0).
quest(6,loki, 0).
quest(6,logan, 0).
quest(6,ultron, 0).
quest(6,quicksilver, 0).
quest(6,deadpool, 0).
quest(6,bucky, 0).
quest(6,venom, 0).
quest(6,red_skull, 0).
quest(6,captain_marvel, 0).
quest(6,doctor_octopus, 0).
quest(6,falcon, 1).
quest(6,rocket_raccoon, 0).
quest(6,green_goblin, 0).
quest(6,ant - man, 1).




%spider_enemy.

quest(7,spider - man, 0).
quest(7,iron_man, 0).
quest(7,hulk, 0).
quest(7,сaptain_america, 0).
quest(7,black_widow, 0).
quest(7,thor, 0).
quest(7,scarlet_witch, 0).
quest(7,doctor_strange, 0).
quest(7,clint, 0).
quest(7,black_panther, 0).
quest(7,war_machine, 0).
quest(7,vision, 0).
quest(7,nick_fury, 0).
quest(7,thanos, 0).
quest(7,groot, 0).
quest(7,gamora, 0).
quest(7,loki, 0).
quest(7,logan, 0).
quest(7,ultron, 0).
quest(7,quicksilver, 0).
quest(7,deadpool, 0).
quest(7,bucky, 0).
quest(7,venom, 1).
quest(7,red_skull, 0).
quest(7,captain_marvel, 0).
quest(7,doctor_octopus, 1).
quest(7,falcon, 0).
quest(7,rocket_raccoon, 0).
quest(7,green_goblin, 1).
quest(7,ant - man, 0).




%mask.

quest(8,spider-man, 1).
quest(8,iron_man, 1).
quest(8,hulk, 0).
quest(8,сaptain_america, 1).
quest(8,black_widow, 0).
quest(8,thor, 0).
quest(8,scarlet_witch, 0).
quest(8,doctor_strange, 0).
quest(8,clint, 0).
quest(8,black_panther, 1).
quest(8,war_machine, 1).
quest(8,vision, 0).
quest(8,nick_fury, 2).
quest(8,thanos, 0).
quest(8,groot, 0).
quest(8,gamora, 0).
quest(8,loki, 0).
quest(8,logan, 0).
quest(8,ultron, 0).
quest(8,quicksilver, 0).
quest(8,deadpool, 1).
quest(8,bucky, 1).
quest(8,venom, 1).
quest(8,red_skull, 1).
quest(8,captain_marvel, 0).
quest(8,doctor_octopus, 0).
quest(8,falcon, 0).
quest(8,rocket_raccoon, 0).
quest(8,green_goblin, 1).
quest(8,ant - man, 1).




%superpowers.

quest(9,spider-man, 1).
quest(9,iron_man, 0).
quest(9,hulk, 1).
quest(9,сaptain_america, 1).
quest(9,black_widow, 0).
quest(9,thor, 1).
quest(9,scarlet_witch, 1).
quest(9,doctor_strange, 1).
quest(9,clint, 0).
quest(9,black_panther, 1).
quest(9,war_machine, 0).
quest(9,vision, 1).
quest(9,nick_fury, 0).
quest(9,thanos, 0).
quest(9,groot, 0).
quest(9,gamora, 0).
quest(9,loki, 1).
quest(9,logan, 1).
quest(9,ultron, 0).
quest(9,quicksilver, 1).
quest(9,deadpool, 1).
quest(9,bucky, 0).
quest(9,venom, 1).
quest(9,red_skull, 0).
quest(9,captain_marvel, 1).
quest(9,doctor_octopus, 0).
quest(9,falcon, 0).
quest(9,rocket_raccoon, 0).
quest(9,green_goblin, 0).
quest(9,ant - man, 0).




%scientist.

quest(10,spider-man, 0).
quest(10,iron_man, 1).
quest(10,hulk, 1).
quest(10,сaptain_america, 0).
quest(10,black_widow, 0).
quest(10,thor, 0).
quest(10,scarlet_witch, 0).
quest(10,doctor_strange, 0).
quest(10,clint, 0).
quest(10,black_panther, 0).
quest(10,war_machine, 0).
quest(10,vision, 0).
quest(10,nick_fury, 0).
quest(10,thanos, 0).
quest(10,groot, 0).
quest(10,gamora, 0).
quest(10,loki, 0).
quest(10,logan, 0).
quest(10,ultron, 0).
quest(10,quicksilver, 0).
quest(10,deadpool, 0).
quest(10,bucky, 0).
quest(10,venom, 0).
quest(10,red_skull, 0).
quest(10,captain_marvel, 0).
quest(10,doctor_octopus, 1).
quest(10,falcon, 0).
quest(10,rocket_raccoon, 0).
quest(10,green_goblin, 1).
quest(10,ant - man, 0).




%regeneration.

quest(11,spider-man, 0).
quest(11,iron_man, 0).
quest(11,hulk, 1).
quest(11,сaptain_america, 0).
quest(11,black_widow, 0).
quest(11,thor, 0).
quest(11,scarlet_witch, 0).
quest(11,doctor_strange, 0).
quest(11,clint, 0).
quest(11,black_panther, 0).
quest(11,war_machine, 0).
quest(11,vision, 0).
quest(11,nick_fury, 0).
quest(11,thanos, 0).
quest(11,groot, 0).
quest(11,gamora, 0).
quest(11,loki, 0).
quest(11,logan, 1).
quest(11,ultron, 0).
quest(11,quicksilver, 0).
quest(11,deadpool, 1).
quest(11,bucky, 0).
quest(11,venom, 1).
quest(11,red_skull, 0).
quest(11,captain_marvel, 1).
quest(11,doctor_octopus, 0).
quest(11,falcon, 0).
quest(11,rocket_raccoon, 0).
quest(11,green_goblin, 0).
quest(11,ant - man, 0).




%magic.

quest(12,spider-man, 0).
quest(12,iron_man, 0).
quest(12,hulk, 0).
quest(12,сaptain_america, 0).
quest(12,black_widow, 0).
quest(12,thor, 0).
quest(12,scarlet_witch, 1).
quest(12,doctor_strange, 1).
quest(12,clint, 0).
quest(12,black_panther, 0).
quest(12,war_machine, 0).
quest(12,vision, 0).
quest(12,nick_fury, 0).
quest(12,thanos, 0).
quest(12,groot, 0).
quest(12,gamora, 0).
quest(12,loki, 1).
quest(12,logan, 0).
quest(12,ultron, 0).
quest(12,quicksilver, 0).
quest(12,deadpool, 0).
quest(12,bucky, 0).
quest(12,venom, 0).
quest(12,red_skull, 0).
quest(12,captain_marvel, 1).
quest(12,doctor_octopus, 0).
quest(12,falcon, 0).
quest(12,rocket_raccoon, 0).
quest(12,green_goblin, 0).
quest(12,ant - man, 0).



%agent.

quest(13,spider-man, 0).
quest(13,iron_man, 0).
quest(13,hulk, 0).
quest(13,сaptain_america, 0).
quest(13,black_widow, 1).
quest(13,thor, 0).
quest(13,scarlet_witch, 0).
quest(13,doctor_strange, 0).
quest(13,clint, 1).
quest(13,black_panther, 0).
quest(13,war_machine, 0).
quest(13,vision, 0).
quest(13,nick_fury, 1).
quest(13,thanos, 0).
quest(13,groot, 0).
quest(13,gamora, 0).
quest(13,loki, 0).
quest(13,logan, 0).
quest(13,ultron, 0).
quest(13,quicksilver, 0).
quest(13,deadpool, 0).
quest(13,bucky, 1).
quest(13,venom, 0).
quest(13,red_skull, 0).
quest(13,captain_marvel, 0).
quest(13,doctor_octopus, 0).
quest(13,falcon, 1).
quest(13,rocket_raccoon, 0).
quest(13,green_goblin, 0).
quest(13,ant - man, 0).




%woman.

quest(14,spider-man, 0).
quest(14,iron_man, 0).
quest(14,hulk, 0).
quest(14,сaptain_america, 0).
quest(14,black_widow, 1).
quest(14,thor, 0).
quest(14,scarlet_witch, 1).
quest(14,doctor_strange, 0).
quest(14,clint, 0).
quest(14,black_panther, 0).
quest(14,war_machine, 0).
quest(14,vision, 0).
quest(14,nick_fury, 0).
quest(14,thanos, 0).
quest(14,groot, 0).
quest(14,gamora, 1).
quest(14,loki, 0).
quest(14,logan, 0).
quest(14,ultron, 0).
quest(14,quicksilver, 0).
quest(14,deadpool, 0).
quest(14,bucky, 0).
quest(14,venom, 0).
quest(14,red_skull, 0).
quest(14,captain_marvel, 1).
quest(14,doctor_octopus, 0).
quest(14,falcon, 0).
quest(14,rocket_raccoon, 0).
quest(14,green_goblin, 0).
quest(14,ant - man, 0).




%web.

quest(15,spider-man, 1).
quest(15,iron_man, 0).
quest(15,hulk, 0).
quest(15,сaptain_america, 0).
quest(15,black_widow, 0).
quest(15,thor, 0).
quest(15,scarlet_witch, 0).
quest(15,doctor_strange, 0).
quest(15,clint, 0).
quest(15,black_panther, 0).
quest(15,war_machine, 0).
quest(15,vision, 0).
quest(15,nick_fury, 0).
quest(15,thanos, 0).
quest(15,groot, 0).
quest(15,gamora, 0).
quest(15,loki, 0).
quest(15,logan, 0).
quest(15,ultron, 0).
quest(15,quicksilver, 0).
quest(15,deadpool, 0).
quest(15,bucky, 0).
quest(15,venom, 0).
quest(15,red_skull, 0).
quest(15,captain_marvel, 0).
quest(15,doctor_octopus, 0).
quest(15,falcon, 0).
quest(15,rocket_raccoon, 0).
quest(15,green_goblin, 0).
quest(15,ant - man, 0).



%tree.

quest(16,spider-man, 0).
quest(16,iron_man, 0).
quest(16,hulk, 0).
quest(16,сaptain_america, 0).
quest(16,black_widow, 0).
quest(16,thor, 0).
quest(16,scarlet_witch, 0).
quest(16,doctor_strange, 0).
quest(16,clint, 0).
quest(16,black_panther, 0).
quest(16,war_machine, 0).
quest(16,vision, 0).
quest(16,nick_fury, 0).
quest(16,thanos, 0).
quest(16,groot, 1).
quest(16,gamora, 0).
quest(16,loki, 0).
quest(16,logan, 0).
quest(16,ultron, 0).
quest(16,quicksilver, 0).
quest(16,deadpool, 0).
quest(16,bucky, 0).
quest(16,venom, 0).
quest(16,red_skull, 0).
quest(16,captain_marvel, 0).
quest(16,doctor_octopus, 0).
quest(16,falcon, 0).
quest(16,rocket_raccoon, 0).
quest(16,green_goblin, 0).
quest(16,ant - man, 0).


%Предикат quest(+Question,-Answer)
%Question - номер вопроса, Answer - соответствующий ответ


quest(1,X):-	write("Ваш персонаж умеет летать?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(2,X):-	write("Ваш персонаж на стороне зла?"),nl,
                                write("2. Нейтрален"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(3,X):-	write("Ваш персонаж является человеком?"),nl,
                                write("2. Бог"),nl,
                                write("1. Да"),nl,
				write("0. Нeт"),nl,
				read(X).

quest(4,X):-	write("Ваш персонаж может изменять свои размеры?"),nl,
				write("1.Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(5,X):-	write("Ваш персонаж родился на Земле?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(6,X):-	write("Ваш персонаж входил в состав мстителей?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(7,X):-	write("Ваш персонаж был врагом человека паука?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(8,X):-	write("Ваш персонаж носил маску?"),nl,
                                write("2. Носил повязку"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(9,X):-	write("Ваш персонаж имеет суперспособности?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).



quest(10,X):-write("Ваш персонаж ученый?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(11,X):-write("Ваш персонаж имеет регенерацию?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(12,X):-write("Ваш персонаж обладает магией?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(13,X):-write("Ваш персонаж агент?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(14,X):-write("Ваш персонаж женщина?"),nl,
                                write("2. Не живое"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
				read(X).

quest(15,X):-write("Ваш персонаж разбрасывает паутину?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
                                read(X).

quest(16,X):-write("Ваш персонаж дерево?"),nl,
				write("1. Да"),nl,
				write("0. Нет"),nl,
                                read(X).

quest_dop(X):-write("Добавить персонажа?"),nl,
                                write("1. Да"),nl,
				write("0. Нет"),nl,
                                read(X).

%Вызов акинатора с 1-го вопроса и доступными героями(1-30)
%Получаем список доступных героев

spisok_hero(Marvel):-tell('c:/Prolog/Hero.txt'),nl,marvel,told,see('c:/Prolog/Hero.txt'),read_list_str(A),seen,take_hero(A,[],Marvel).
marvel:-quest(1,Hero,_),write(Hero),nl,fail;!.

take_hero([],Marvel,Marvel):-!.
take_hero([Head|Tail],I,Marvel):-name(Hero,Head),term_to_atom(Hero_norm,Hero),append(I,[Hero_norm],I1),take_hero(Tail,I1,Marvel).

pr:-spisok_hero(Marvel),pr(1,Marvel)->pr3;pr_obn.

%Предикат - обращается к базе данных
base_date:-see('c:/Prolog/10.txt'),read_list_str(A),seen,take_fact(A).

%Предикат - считываем данные из списка
take_fact([]):-!.
take_fact([Head|Tail]):-name(Fact,Head),term_to_atom(Fact,Fact_atom),assert(Fact_atom),take_fact(Tail).

pr_obn:-quest_dop(X),(X is 1 -> pr_new;pr3).

pr_new:-write("Введите имя нового персонажа c маленькой буквы: "),read(Hero),pr2(Hero).

pr(17,_):-write("Такого персонажа нет"),nl,!,fail.
pr(N,Marvel):-quest(N,X),assert(nomer(N,X)),check(N,X,Marvel,[],Marvel_other),
    (alone(Marvel_other)->write(Marvel_other),!;
    N1 is N+1,(lenght_2(Marvel_other) ->select_quest(Marvel_other,N1,Next_quest),pr(Next_quest,Marvel_other);pr(N1,Marvel_other))).

%Находим совпадение по ответам на вопросы
% Предикат check(+Question,+Answer,+Marvel,+Other,+Marvel_other) - рекурсия вниз
% Question - номер вопроса
% Answer - ответ на вопрос
% Marvel - герои рассматривыемые на данной итерации
% Other - вспомогательный элемент для рекурсии
% Marvel_other - герои прошедшие проверку
check(_,_,[],Other,Other):-!.
check(N,X,[Hero|Tail],Other,Marvel_other):-(quest(N,Hero,X)->check(N,X,Tail,[Hero|Other],Marvel_other);check(N,X,Tail,Other,Marvel_other)).

%Проверка на пустоту списка
alone([_|Notalone]):-Notalone=[].

%Проверяем, чтобы длина списка была 2
lenght_2([],L,L):-!.
lenght_2([_|Tail],I,L):-I1 is I+1,lenght_2(Tail,I1,L).
lenght_2(List):-lenght_2(List,0,L), L is 2.


%Проверка какой вопрос задать, если осталось 2 элемента
%Предикат select_quest([+Head1,Head2],+Quest,-Next_quest)
%Head1,Head2 - 2 элемента
%Quest - номер с какого вопроса начинать искать
%Next_quest - номер вопроса, который нужно задать следующим

select_quest([Hero1,Hero2],Quest,Next_quest):-quest(Quest,Hero1,Answer1),quest(Quest,Hero2,Answer2),(Answer1=\=Answer2 -> Next_quest is Quest,!;
                                              Quest1 is Quest+1, select_quest([Hero1,Hero2],Quest1,Next_quest)).


nomer_r(X,Y,Hero):-repeat,(nomer(X,Y)->(write("quest("),write(X),write(","),write(Hero),write(","),write(Y),write(")"),retract(nomer(X,Y)));X=nil,Y=nil).

pr2(Hero):-tell('c:/Prolog/10.txt'),nomer_r(X,_,Hero),nl,X=nil,told.

nomer_d(X,Y):-repeat,(nomer(X,Y)->retract(nomer(X,Y));X=nil,Y=nil).

pr3:-nomer_d(X,_),X=nil.
