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

% transicion: estado origen --Token--> estado destino
transicion(1, a, 3).
transicion(1, a, 2).
transicion(1, a, 4).
transicion(4, b, 2).
transicion(3, b, 2).
transicion(3, b, 1).

% estados
estado(1).
estado(2).
estado(3).
estado(4).

/* 
   Los estados inicial y finales se determinan con hechos,
   es parte de lo que el negocio determina, no se pueden inferir
*/
estadoInicial(1).
estadoFinal(2).

% Verifica si una palabra pertenece al lenguaje
esValida(Palabra):-estadoInicial(EstadoInicial), parsear(Palabra, EstadoInicial).

parsear([], Estado):-estadoFinal(Estado).
parsear([Token|Tokens], Estado):-
    transicion(Estado, Token, EstadoSiguiente),
    % write('Token '),
    % write(Token),
    % write(' | δ '),
    % write(Estado),
    % write(' => '),
    % writeln(Siguiente),
    parsear(Tokens, EstadoSiguiente).
