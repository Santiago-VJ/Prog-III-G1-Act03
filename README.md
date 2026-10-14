# Proyecto Prolog - Estructuras y Listas

Este proyecto contiene dos ejercicios desarrollados en Prolog usando estructuras y listas para modelar relaciones y recorridos.

## Archivos

- `simpson_estructuras_listas.pl`: árbol genealógico de la familia Simpson.
- `ciudades_canada_estructuras_listas.pl`: grafo de ciudades de Canadá con rutas y costos.

## Objetivo

Practicar:
- uso de listas en Prolog
- estructuras como `familia(...)` y `destino(...)`
- definicion de reglas y consultas
- recorrido de grafos y relaciones familiares

## Cómo ejecutar

1. Abre SWI-Prolog.
2. Carga el archivo que quieras consultar:
   ```prolog
   [simpson_estructuras_listas].
   ```
   o
   ```prolog
   [ciudades_canada_estructuras_listas].
   ```
3. Consulta las reglas desde la consola.

## Ejemplos

### Simpson
```prolog
padre(homero, bart).
hermano(bart, lisa).
abuelo(abraham, bart).
```

### Ciudades de Canadá
```prolog
conexion_directa(vancouver, edmonton, 16).
camino(vancouver, winnipeg, Ruta, Costo).
se_puede_viajar(vancouver, winnipeg).
```

## Integrantes

- Grupo 1
- Actividad 2 - Programación III

## Nota

Este README es una versión simple del proyecto para explicar su contenido de forma rápida.

