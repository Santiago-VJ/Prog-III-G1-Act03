% =========================================================================
% EJERCICIO 2: GRAFO DE CIUDADES DE CANADA (ESTRUCTURAS Y LISTAS)
% =========================================================================

% --- HECHOS CON ESTRUCTURAS Y LISTAS DE ADYACENCIA ---
% Estructura: rutas_desde(Origen, [destino(Ciudad, Costo), ...])

rutas_desde(vancouver, [destino(edmonton, 16), destino(calgary, 13)]).
rutas_desde(edmonton,  [destino(saskatoon, 12)]).
rutas_desde(saskatoon, [destino(calgary, 9), destino(winnipeg, 20)]).
rutas_desde(calgary,   [destino(edmonton, 4), destino(regina, 14)]).
rutas_desde(regina,    [destino(saskatoon, 7), destino(winnipeg, 4)]).
rutas_desde(winnipeg,  []). % Nodo sumidero (t), sin salidas


% --- REGLAS DE CONSULTA ---

% 1. Conexion directa entre dos ciudades y su costo (reemplaza al hecho arco/3)
conexion_directa(Origen, Destino, Costo) :-
    rutas_desde(Origen, ListaDestinos),
    member(destino(Destino, Costo), ListaDestinos).

% 2. ¿Tiene aristas una ciudad? (Verifica si una ciudad tiene salidas)
tiene_salidas(Ciudad) :-
    rutas_desde(Ciudad, ListaDestinos),
    ListaDestinos \== [].

% 3. ¿Cual es el costo de ir de X a Z pasando exactamente por Y?
costo_pasando_por(X, Y, Z, CostoTotal) :-
    conexion_directa(X, Y, C1),
    conexion_directa(Y, Z, C2),
    CostoTotal is C1 + C2.

% 4. ¿Es posible viajar de Origen a Destino? (Camino general con costo y ruta)
% Usa una lista de nodos visitados para evitar el ciclo infinito:
% saskatoon -> calgary -> edmonton -> saskatoon
camino(Origen, Destino, Ruta, CostoTotal) :-
    navegar(Origen, Destino, [Origen], RutaInvertida, CostoTotal),
    reverse(RutaInvertida, Ruta).

% Caso base: Conexion directa al destino
navegar(Actual, Destino, Visitados, [Destino|Visitados], Costo) :-
    conexion_directa(Actual, Destino, Costo),
    \+ member(Destino, Visitados).

% Caso recursivo: Paso intermedio acumulando la lista de visitados y sumando el costo
navegar(Actual, Destino, Visitados, RutaFinal, CostoTotal) :-
    conexion_directa(Actual, Intermedio, CostoParcial),
    Intermedio \== Destino,
    \+ member(Intermedio, Visitados),
    navegar(Intermedio, Destino, [Intermedio|Visitados], RutaFinal, CostoRestante),
    CostoTotal is CostoParcial + CostoRestante.

% 5. Regla simplificada booleana: ¿Se puede llegar de X a Y?
se_puede_viajar(Origen, Destino) :-
    camino(Origen, Destino, _, _).