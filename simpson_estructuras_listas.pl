% =========================================================================
% EJERCICIO 1: ARBOL GENEALOGICO DE LOS SIMPSON (ESTRUCTURAS Y LISTAS)
% =========================================================================

% --- HECHOS CON LISTAS Y ESTRUCTURAS ---

% Generos agrupados en listas para evitar hechos dispersos
genero_hombres([abraham, clancy, herbert, homero, bart]).
genero_mujeres([mona, jacqueline, marge, patty, selma, lisa, maggie, ling]).

% Estructura: familia(Padre, Madre, [Lista_de_Hijos])
% Se usa 'desconocido' o 'ninguno' cuando el arbol no especifica el conyuge
familia(abraham, desconocida, [herbert]).
familia(abraham, mona, [homero]).
familia(clancy, jacqueline, [marge, patty, selma]).
familia(homero, marge, [bart, lisa, maggie]).
familia(ninguno, selma, [ling]).


% --- REGLAS DE EXTRACCION BASICA (INTERFAZ COMPATIBLE) ---

hombre(X) :- 
    genero_hombres(Lista), 
    member(X, Lista).

mujer(X) :- 
    genero_mujeres(Lista), 
    member(X, Lista).

padre(P, H) :- 
    familia(P, _, Hijos), 
    P \== ninguno, 
    member(H, Hijos).

madre(M, H) :- 
    familia(_, M, Hijos), 
    M \== desconocida, 
    member(H, Hijos).

progenitor(P, H) :- padre(P, H).
progenitor(P, H) :- madre(P, H).


% --- REGLAS DE RELACIONES FAMILIARES ---

% Regla de hermano/a (general): comparten al menos un progenitor
% Se usa sort/2 o verificacion directa; aqui evitamos evaluar dos veces 
% la misma combinacion si comparten padre y madre usando la estructura familia
hermano_general(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \== Y.

% Hermano hombre (sin duplicados usando setof/3 o validacion)
hermano(X, Y) :-
    hombre(X),
    progenitor(P, X),
    progenitor(P, Y),
    X \== Y.

% Hermana mujer
hermana(X, Y) :-
    mujer(X),
    progenitor(P, X),
    progenitor(P, Y),
    X \== Y.

% Regla de tio
tio(T, S) :-
    hombre(T),
    progenitor(P, S),
    hermano_general(T, P).

% Regla de tia
tia(T, S) :-
    mujer(T),
    progenitor(P, S),
    hermano_general(T, P).

% Regla de primos
primo(X, Y) :-
    progenitor(P1, X),
    progenitor(P2, Y),
    hermano_general(P1, P2),
    P1 \== P2.

% Regla de abuelo
abuelo(A, N) :-
    hombre(A),
    progenitor(A, P),
    progenitor(P, N).

% Regla de abuela (corregido el nombre del predicado respecto a tu version anterior)
abuela(A, N) :-
    mujer(A),
    progenitor(A, P),
    progenitor(P, N).
% =========================================================================
% EJERCICIO 1: ARBOL GENEALOGICO DE LOS SIMPSON (ESTRUCTURAS Y LISTAS)
% =========================================================================

% --- HECHOS CON LISTAS Y ESTRUCTURAS ---

% Generos agrupados en listas para evitar hechos dispersos
genero_hombres([abraham, clancy, herbert, homero, bart]).
genero_mujeres([mona, jacqueline, marge, patty, selma, lisa, maggie, ling]).

% Estructura: familia(Padre, Madre, [Lista_de_Hijos])
% Se usa 'desconocido' o 'ninguno' cuando el arbol no especifica el conyuge
familia(abraham, desconocida, [herbert]).
familia(abraham, mona, [homero]).
familia(clancy, jacqueline, [marge, patty, selma]).
familia(homero, marge, [bart, lisa, maggie]).
familia(ninguno, selma, [ling]).


% --- REGLAS DE EXTRACCION BASICA (INTERFAZ COMPATIBLE) ---

hombre(X) :- 
    genero_hombres(Lista), 
    member(X, Lista).

mujer(X) :- 
    genero_mujeres(Lista), 
    member(X, Lista).

padre(P, H) :- 
    familia(P, _, Hijos), 
    P \== ninguno, 
    member(H, Hijos).

madre(M, H) :- 
    familia(_, M, Hijos), 
    M \== desconocida, 
    member(H, Hijos).

progenitor(P, H) :- padre(P, H).
progenitor(P, H) :- madre(P, H).


% --- REGLAS DE RELACIONES FAMILIARES ---

% Regla de hermano/a (general): comparten al menos un progenitor
% Se usa sort/2 o verificacion directa; aqui evitamos evaluar dos veces 
% la misma combinacion si comparten padre y madre usando la estructura familia
hermano_general(X, Y) :-
    progenitor(P, X),
    progenitor(P, Y),
    X \== Y.

% Hermano hombre (sin duplicados usando setof/3 o validacion)
hermano(X, Y) :-
    hombre(X),
    progenitor(P, X),
    progenitor(P, Y),
    X \== Y.

% Hermana mujer
hermana(X, Y) :-
    mujer(X),
    progenitor(P, X),
    progenitor(P, Y),
    X \== Y.

% Regla de tio
tio(T, S) :-
    hombre(T),
    progenitor(P, S),
    hermano_general(T, P).

% Regla de tia
tia(T, S) :-
    mujer(T),
    progenitor(P, S),
    hermano_general(T, P).

% Regla de primos
primo(X, Y) :-
    progenitor(P1, X),
    progenitor(P2, Y),
    hermano_general(P1, P2),
    P1 \== P2.

% Regla de abuelo
abuelo(A, N) :-
    hombre(A),
    progenitor(A, P),
    progenitor(P, N).

% Regla de abuela (corregido el nombre del predicado respecto a tu version anterior)
abuela(A, N) :-
    mujer(A),
    progenitor(A, P),
    progenitor(P, N).