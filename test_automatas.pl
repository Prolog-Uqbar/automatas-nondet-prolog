/*
  ████████╗███████╗███████╗████████╗███████╗
  ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██╔════╝
     ██║   █████╗  ███████╗   ██║   ███████╗
     ██║   ██╔══╝  ╚════██║   ██║   ╚════██║
     ██║   ███████╗███████║   ██║   ███████║
     ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚══════╝                                                          
*/


:- include(automatas).

:- begin_tests(automatas).

test(camino_simple_inicial_final_parsea_ok, nondet):-
    parsear([a]).

test(camino_compuesto_inicial_final_parsea_ok, nondet):-
    parsear([a, b]).

test(camino_compuesto_en_varios_ciclos_inicial_final_parsea_ok, nondet):-
    parsear([a, b, a, b, a]).

test(palabra_que_no_parsea_porque_no_transiciona_a_ningun_estado):-
    not(parsear([a, a])).

test(palabra_que_no_parsea_porque_no_transiciona_a_ningun_estado_mas_de_dos_transiciones):-
    not(parsear([a, a, a])).

test(palabra_que_no_parsea_por_caracter_invalido):-
    not(parsear([c])).

test(palabra_que_no_parsea_por_vacia):-
    not(parsear([])).

:- end_tests(automatas).
    