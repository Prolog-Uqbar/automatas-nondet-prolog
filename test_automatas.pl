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
    esValida([a]).

test(camino_compuesto_inicial_final_parsea_ok, nondet):-
    esValida([a, b]).

test(camino_compuesto_en_varios_ciclos_inicial_final_parsea_ok, nondet):-
    esValida([a, b, a, b, a]).

test(palabra_que_no_parsea_porque_no_transiciona_a_ningun_estado, fail):-
    esValida([a, a]).

test(palabra_que_no_parsea_porque_no_transiciona_a_ningun_estado_mas_de_dos_transiciones, fail):-
    esValida([a, a, a]).

test(palabra_que_no_parsea_por_caracter_invalido, fail):-
    esValida([c]).

test(palabra_que_no_parsea_por_vacia, fail):-
    esValida([]).

:- end_tests(automatas).
    