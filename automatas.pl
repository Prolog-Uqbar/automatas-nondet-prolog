/*
  ██╗      ██████╗  ██████╗ ██╗ ██████╗ █████╗ 
  ██║     ██╔═══██╗██╔════╝ ██║██╔════╝██╔══██╗
  ██║     ██║   ██║██║  ███╗██║██║     ███████║
  ██║     ██║   ██║██║   ██║██║██║     ██╔══██║
  ███████╗╚██████╔╝╚██████╔╝██║╚██████╗██║  ██║
  ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝╚═╝  ╚═╝                                             
*/

/** Definición del lenguaje 

M = ({1, 2, 3, 4}, {a, b}, δ, 1, {2}), where δ is given as;
δ (1, a) = 2,
δ (1, a) = 3,
δ (1, a) = 4,
δ (3, b) = 1,
δ (4, b) = 2,
δ (5, b) = 2.

*/

% transicion: nodo origen --caracter--> nodo destino
transicion(1, a, 3).
transicion(1, a, 2).
transicion(1, a, 4).
transicion(4, b, 2).
transicion(3, b, 2).
transicion(3, b, 1).

% nodos
nodo(1).
nodo(2).
nodo(3).
nodo(4).

/* 
   Los estados inicial y finales se determinan con hechos,
   es parte de lo que el negocio determina, no se pueden inferir
*/
estadoInicial(1).
estadoFinal(2).

% Verifica si una palabra pertenece al lenguaje
esValida(Palabra):-estadoInicial(EstadoInicial), parsear(Palabra, EstadoInicial).

parsear([], Final):-estadoFinal(Final).
parsear([Caracter|RestoPalabra], Estado):-
    transicion(Estado, Caracter, Siguiente),
    % write('caracter '),
    % write(Caracter),
    % write(' | δ '),
    % write(Estado),
    % write(' => '),
    % writeln(Siguiente),
    parsear(RestoPalabra, Siguiente).
