%Задание 1. Реализовать предикат чтения списка с клавиатуры и предикат
%вывода списка на экран.
%
read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1,read_list(N1,Tail). %Чтение списка

write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list(Tail).



