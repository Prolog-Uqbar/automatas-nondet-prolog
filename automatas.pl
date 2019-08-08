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

% transicion: nodo origen -> nodo destino, caracter
transicion(1, 3, a).
transicion(1, 2, a).
transicion(1, 4, a).
transicion(4, 2, b).
transicion(3, 2, b).
transicion(3, 1, b).

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
parsear(Palabra):-inicial(NodoInicial), parsear(Palabra, NodoInicial).

parsear([], Final):-final(Final).
parsear([Caracter|RestoPalabra], Nodo):-
    transicion(Nodo, Siguiente, Caracter),
    % write('caracter '),
    % write(Caracter),
    % write(' | δ '),
    % write(Nodo),
    % write(' => '),
    % writeln(Siguiente),
    parsear(RestoPalabra, Siguiente).

