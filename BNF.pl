% =========================
% PARSER BNF (DCG)
% =========================

% -------- ORACIÓN --------

oracion(Resultado) -->
    afirmacion(Resultado).

oracion(Resultado) -->
    negacion(Resultado).

% -------- AFIRMACIONES --------

afirmacion(gusta(Objeto)) -->
    sujeto_opcional,
    verbo_gusto,
    objeto(Objeto).

afirmacion(gusta(Objeto)) -->
    sujeto_opcional,
    verbo_interes,
    objeto(Objeto).


% -------- NEGACIONES --------

negacion(no_gusta(Objeto)) -->
    negacion_palabra,
    pronombre_opcional,
    verbo_gusto,
    objeto(Objeto).

negacion(no_gusta(Objeto)) -->
    sujeto_opcional,
    verbo_odio,
    objeto(Objeto).

% -------- SUJETO --------

sujeto_opcional --> pronombre.
sujeto_opcional --> [].

pronombre --> [yo].
pronombre --> [a, mi].
pronombre --> [me].

pronombre_opcional --> pronombre.
pronombre_opcional --> [].

% -------- VERBOS --------

verbo_gusto --> [gusta].
verbo_gusto --> [gustan].
verbo_gusto --> [encanta].
verbo_gusto --> [encantan].
verbo_gusto --> [amo].
verbo_gusto --> [agrada].
verbo_gusto --> [disfruto].

verbo_interes --> [interesa].
verbo_interes --> [interesan].
verbo_interes --> [atrae].

verbo_odio --> [odio].
verbo_odio --> [detesto].
verbo_odio --> [aborrezco].

negacion_palabra --> [no].
negacion_palabra --> [nunca].

% -------- OBJETOS --------

objeto(matematicas) --> articulo_opcional, [matematicas].
objeto(tecnologia) --> articulo_opcional, [tecnologia].
objeto(tecnologia) --> [computadoras].
objeto(matematicas) --> [numeros].

objeto(personas) --> articulo_opcional, [personas].
objeto(personas) --> articulo_opcional, [gente].
objeto(personas) --> [ayudar, a, las, personas].

objeto(resolver_problemas) --> [resolver, problemas].
objeto(resolver_problemas) --> [problemas].

objeto(ayudar) --> [ayudar].
objeto(escuchar) --> [escuchar].

objeto(creatividad) --> [arte].
objeto(creatividad) --> [creatividad].

objeto(numeros) --> [numeros].

objeto(comunicacion) --> [hablar].
objeto(comunicacion) --> [comunicacion].



% -------- ARTÍCULOS --------

articulo_opcional --> [las].
articulo_opcional --> [los].
articulo_opcional --> [la].
articulo_opcional --> [el].
articulo_opcional --> [].

% -----Frases comunes reales ------
afirmacion(gusta(X)) -->
    [me, gusta],
    objeto(X).

afirmacion(gusta(X)) -->
    [me, encanta],
    objeto(X).

negacion(no_gusta(X)) -->
    [no, me, gusta],
    objeto(X).

% =========================
% FRASES MÁS NATURALES
% =========================

% afirmaciones comunes
afirmacion(gusta(X)) -->
    [me, gusta],
    objeto(X).

afirmacion(gusta(X)) -->
    [me, encanta],
    objeto(X).

afirmacion(gusta(X)) -->
    [si],
    objeto(X).

afirmacion(gusta(X)) -->
    [claro],
    objeto(X).

% negaciones comunes
negacion(no_gusta(X)) -->
    [no, me, gusta],
    objeto(X).

negacion(no_gusta(X)) -->
    [para, nada],
    objeto(X).

negacion(no_gusta(X)) -->
    [nunca],
    objeto(X).


interpretar(Lista, Resultado) :-
    phrase(oracion(Resultado), Lista), !.

interpretar(_, desconocido).
