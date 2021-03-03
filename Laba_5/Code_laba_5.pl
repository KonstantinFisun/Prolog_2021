sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[_|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(_,_,[_]):-fail.
sprava_next(A,B,[A|[B|_]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(_,_,[_]):-fail.
sleva_next(A,B,[B|[A|_]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

%Живет рядом
next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).


% Формируем список из 5 элементов, не знаю что там находится, но каждый
% из 5 элементов это список.
% цвет, нац,напиток,животное,сигареты
pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_corona:- Corona=[_,_,_,_],

           in_list(Corona,[_,italy,_,pohoroni]),
            in_list(Corona,[_,france,_,svadba]),
            in_list(Corona,[_,america,1,_]),
            in_list(Corona,[progger,_,_,conf]),
            in_list(Corona,[chinusha,_,45,_]),
            in_list(Corona,[_,kitai,_,otdih]),
            in_list(Corona,[_,france,15,_]),
            in_list(Corona,[bankir,_,6,_]),

            (   in_list(Corona,[blogger,italy,_,_]);
                in_list(Corona,[blogger,france,_,_]);
                 in_list(Corona,[blogger,america,_,_])),

            (   in_list(Corona,[chinusha,italy,_,_]);
                in_list(Corona,[chinusha,france,_,_]);
                 in_list(Corona,[chinusha,america,_,_])),

            write(Corona).


write_place_people(A,B):-write(A),write(": "),
    in_list(B,[A,WORK1,PLACE1,NUMB1]),write(WORK1),write(", "),
    write(PLACE1),write(", "),write(NUMB1),nl,!.



pr_log:-Seek=[_,_,_,_],
    in_list(Seek,[_,funeral,lake_Koma,_]),
    in_list(Seek,[_,marry,nicca,_]),
    in_list(Seek,[_,_,california,1]),
    in_list(Seek,[programmer,conference,_,_]),
    in_list(Seek,[_,rest,china,_]),
    (in_list(Seek,[programmer,_,china,_]);in_list(Seek,[banker,_,china,_])),
    in_list(Seek,[official,_,_,45]),
    in_list(Seek,[_,_,nicca,15]),
    in_list(Seek,[banker,_,_,6]),
    in_list(Seek,[bloger,_,_,_]),

    write(Seek),nl,nl,
    write_place_people(programmer,Seek),
    write_place_people(banker,Seek),
    write_place_people(bloger,Seek),
    write_place_people(official,Seek).


pr_ein1:-Event=[_,_,_,_],
    in_list(Event,[funeral,italy,_,_]),
    in_list(Event,[wedding,france,_,_]),
    in_list(Event,[_,france,_,15]),
    in_list(Event,[rest,china,_,_]),
    in_list(Event,[conference,_,programmer,_]),
    in_list(Event,[_,usa,_,1]),
    in_list(Event,[_,_,official,45]),
    in_list(Event,[_,_,banker,6]),

    in_list(Event,[_,_,blogger,_]),
    not(in_list(Event,[_,china,blogger,_])),
    not(in_list(Event,[_,china,official,_])),

    in_list(Event,[funeral,F1,F2,F3]),
    in_list(Event,[wedding,S1,S2,S3]),
    in_list(Event,[rest,T1,T2,T3]),
    in_list(Event,[conference,Frth1,Frth2,Frth3]),

    write("funeral "),write(F1),write(" "),write(F2),write(" "),write(F3),nl,
    write("wedding "),write(S1),write(" "),write(S2),write(" "),write(S3),nl,
    write("rest "),write(T1),write(" "),write(T2),write(" "),write(T3),nl,
    write("conference "),write(Frth1),write(" "),write(Frth2),write(" "),write(Frth3).

%Задание 2. Беседует трое друзей: Белокуров, Рыжов, Чернов. Брюнет
%сказал Белокурову: “Любопытно, что один из нас блондин, другой брюнет,
% третий - рыжий, но ни у кого цвет волос не соответствует фамилии”.
% Какой цвет волос у каждого из друзей?

pr_friends:-
    Friend=[_,_,_],
    in_list(Friend,[belokyrov,_]),
    in_list(Friend,[riznov,_]),
    in_list(Friend,[chernov,_]),
    in_list(Friend,[_,riziy]),
    in_list(Friend,[_,blondin]),
    in_list(Friend,[_,brynet]),

    not(in_list(Friend,[belokyrov, blondin])),
    not(in_list(Friend,[belokyrov,brynet])),
    (in_list(Friend,[riznov, brynet]);in_list(Friend,[riznov,blondin])),
    (in_list(Friend,[chernov,blondin]);in_list(Friend,[chernov, riziy])),

    write(Friend).

%Задание 3. Три подруги вышли в белом, зеленом и синем платьях и
%туфлях. Известно, что только у Ани цвета платья и туфлей совпадали. Ни
%туфли, ни платье Вали не были белыми. Наташа была в зеленых туфлях.
%Определить цвета платья и туфель на каждой из подруг.
pr_girlfriend:-
    Friend=[_,_,_],
    in_list(Friend,[_,white,_]),
    in_list(Friend,[_,green,_]),
    in_list(Friend,[_,blue,_]),
    in_list(Friend,[_,_,white]),
    in_list(Friend,[_,_,green]),
    in_list(Friend,[_,_,blue]),

    in_list(Friend,[ann,_,_]),
    in_list(Friend,[natasha,_,green]),
    in_list(Friend,[valya,_,_]),

    (in_list(Friend,[ann,white,white]);in_list(Friend,[ann,blue,blue]);in_list(Friend,[ann,green,green])), %у Ани цвета платья и туфлей совпадали
     not(in_list(Friend,[valya,white,_])),
     not(in_list(Friend,[valya,_,white])), %Ни туфли, ни платье Вали не были белыми.
     not(in_list(Friend,[natasha,green,_])), %только у Ани цвета платья и туфлей совпадали
     write(Friend).


%Задание 5. В бутылке, стакане, кувшине и банке находятся молоко,
%лимонад, квас и вода. Известно, что вода и молоко не в бутылке, сосуд с
%лимонадом находится между кувшином и сосудом с квасом, в банке - не
%лимонад и не вода. Стакан находится около банки и сосуда с молоком. Как
%распределены эти жидкости по сосудам.


pr_liquid:-
    Liquid=[_,_,_,_],
    in_list(Liquid,[butilka,_]),
    in_list(Liquid,[stakan,_]),
    in_list(Liquid,[kuvshin,_]),
    in_list(Liquid,[banka,_]),

    in_list(Liquid,[_,moloko]),
    in_list(Liquid,[_,limonad]),
    in_list(Liquid,[_,kvas]),
    in_list(Liquid,[_,water]),

    not(in_list(Liquid,[butilka,water])),   %вода и молоко не в бутылке
    not(in_list(Liquid,[butilka,moloko])),

    not(in_list(Liquid,[banka,limonad])),   %в банке - не лимонад и не вода.
    not(in_list(Liquid,[banka,water])),

    next_to([_,limonad],[kuvshin,_],Liquid), %сосуд с лимонадом находится между кувшином
    next_to([_,limonad],[_,kvas],Liquid),    % и сосудом с квасом

    next_to([stakan,_],[banka,_],Liquid),  %Стакан находится около банки
    next_to([stakan,_],[_,moloko],Liquid),  % и сосуда с молоком



     write(Liquid).


%Задание 6. Воронов, Павлов, Левицкий и Сахаров – четыре талантливых
%молодых человека. Один из них танцор, другой художник, третий-певец, а
%четвертый-писатель. О них известно следующее: Воронов и Левицкий сидели
%в зале консерватории в тот вечер, когда певец дебютировал в сольном
% концерте. Павлов и писатель вместе позировали художнику. Писатель
% написал биографическую повесть о Сахарове и собирается написать о
% Воронове. Воронов никогда не слышал о Левицком. Кто чем занимается?

pr_talant:-
    Talant=[_,_,_,_],
    in_list(Talant,[voronov,_]),
    in_list(Talant,[pavlov,_]),
    in_list(Talant,[levickyi,_]),
    in_list(Talant,[saxarov,_]),

    in_list(Talant,[_,tancor]),
    in_list(Talant,[_,xydojnik]),
    in_list(Talant,[_,pevec]),
    in_list(Talant,[_,pisatel]),

    not(in_list(Talant,[voronov,pevec])),
    not(in_list(Talant,[levickyi,pevec])),

    not(in_list(Talant,[pavlov,xydojnik])),
    not(in_list(Talant,[pavlov,pisatel])),

    not(in_list(Talant,[saxarov,pisatel])),
    not(in_list(Talant,[voronov,pisatel])),

    not(in_list(Talant,[saxarov,pisatel])),
    not(in_list(Talant,[voronov,pisatel])),


    write(Talant).
