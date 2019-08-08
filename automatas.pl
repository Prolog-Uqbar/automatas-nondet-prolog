/*
  ██╗      ██████╗  ██████╗ ██╗ ██████╗ █████╗ 
  ██║     ██╔═══██╗██╔════╝ ██║██╔════╝██╔══██╗
  ██║     ██║   ██║██║  ███╗██║██║     ███████║
  ██║     ██║   ██║██║   ██║██║██║     ██╔══██║
  ███████╗╚██████╔╝╚██████╔╝██║╚██████╗██║  ██║
  ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝ ╚═════╝╚═╝  ╚═╝                                             
*/

/** Definición del lenguaje 

M = ({A, B, C, D}, {a, b}, δ, A, {B}), where δ is given as;
δ (A, a) = B,
δ (A, a) = C,
δ (A, a) = D,
δ (C, b) = A,
δ (C, b) = B,
δ (D, b) = B.

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
   Los nodos inicial y final se determinan con hechos,
   es parte de lo que el negocio determina, no se pueden inferir
*/
inicial(1).
final(2).

% Verifica si una palabra pertenece al lenguaje
esValida(Palabra):-inicial(EstadoInicial), parsear(Palabra, EstadoInicial).

parsear([], Final):-final(Final).
parsear([Caracter|RestoPalabra], Estado):-
    transicion(Estado, Caracter, Siguiente),
    % write('caracter '),
    % write(Caracter),
    % write(' | δ '),
    % write(Estado),
    % write(' => '),
    % writeln(Siguiente),
    parsear(RestoPalabra, Siguiente).

