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
transicion(a, c, a).
transicion(a, b, a).
transicion(a, d, a).
transicion(d, b, b).
transicion(c, b, b).
transicion(c, a, b).

% nodos
nodo(a).
nodo(b).
nodo(c).
nodo(d).

/* 
   Los nodos inicial y final se determinan con hechos,
   es parte de lo que el negocio determina, no se pueden inferir
*/
inicial(a).
final(b).

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

