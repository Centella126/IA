% Reglas de inicio de conversación
iniciar :-
    write('¡Bienvenido al Chatbot de la clase de Inteligencia Artificial del Dr. Oscar Zuniga Sanchez - CULagos-!'), nl,
    write('¿Eres hombre o mujer? (escribe hombre o mujer entre comillas simples, por ejemplo: ''hombre'' o ''mujer'')'), nl,
    read(Genero),
    (Genero == 'hombre' -> tema_hombre ;
     Genero == 'mujer' -> tema_belleza ;
     write('Entrada no válida. Por favor, escribe ''hombre'' o ''mujer''.'), nl, iniciar).

% Módulo para hombres: Temas disponibles
tema_hombre :-
    write('¿Te gustaría hablar de futbol soccer? (escribe si o no entre comillas simples)'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> tema_futbol ;
     Respuesta == 'no' -> tema_automoviles ;
     write('Respuesta no válida. Por favor, escribe ''si'' o ''no''.'), nl, tema_hombre).

% Módulo de tema de futbol
tema_futbol :-
    write('¿Sobre qué liga te gustaría hablar? (escribe mexicana, americana o europea entre comillas simples)'), nl,
    read(Liga),
    (Liga == 'mexicana' -> futbol_mexicano ;
     Liga == 'americana' -> futbol_americano ;
     Liga == 'europea' -> futbol_europeo ;
     write('No tengo información sobre esa liga. Por favor, escribe ''mexicana'', ''americana'' o ''europea''.'), nl, tema_futbol),
    preguntar_continuar_hombre.

% Información sobre liga mexicana
futbol_mexicano :-
    write('La liga mexicana es muy emocionante. ¿Quieres saber sobre los equipos, jugadores destacados o datos biográficos de jugadores? (escribe equipos, jugadores o biografias entre comillas simples)'), nl,
    read(Tema),
    (Tema == 'equipos' -> write('Equipos como el América, Chivas y Cruz Azul son los favoritos.'), nl ;
     Tema == 'jugadores' -> write('Algunos jugadores destacados son Guillermo Ochoa, Rogelio Funes Mori y Alexis Vega.'), nl ;
     Tema == 'biografias' -> biografias_mexico ;
     write('No tengo información sobre ese tema en la liga mexicana.'), nl, futbol_mexicano).

% Información sobre liga americana
futbol_americano :-
    write('La liga MLS está en crecimiento. ¿Quieres saber sobre los equipos, jugadores destacados o datos biográficos de jugadores? (escribe equipos, jugadores o biografias entre comillas simples)'), nl,
    read(Tema),
    (Tema == 'equipos' -> write('Equipos como LA Galaxy, Inter Miami y Seattle Sounders son populares.'), nl ;
     Tema == 'jugadores' -> write('Jugadores como Carlos Vela, Lionel Messi y Josef Martinez destacan en la MLS.'), nl ;
     Tema == 'biografias' -> biografias_america ;
     write('No tengo información sobre ese tema en la liga americana.'), nl, futbol_americano).

% Información sobre liga europea
futbol_europeo :-
    write('La liga europea es la más competitiva. ¿Quieres saber sobre equipos, jugadores destacados o datos biográficos de jugadores? (escribe equipos, jugadores o biografias entre comillas simples)'), nl,
    read(Tema),
    (Tema == 'equipos' -> write('Equipos como el Real Madrid, Barcelona y Manchester United son legendarios.'), nl ;
     Tema == 'jugadores' -> write('Jugadores como Cristiano Ronaldo, Lionel Messi y Kylian Mbappe son mundialmente reconocidos.'), nl ;
     Tema == 'biografias' -> biografias_europa ;
     write('No tengo información sobre ese tema en la liga europea.'), nl, futbol_europeo).

% Biografias de jugadores
biografias_mexico :-
    write('¿Sobre qué jugador te gustaría saber? (escribe ochoa, funes_mori o vega entre comillas simples)'), nl,
    read(Jugador),
    (Jugador == 'ochoa' -> write('Guillermo Ochoa nació en México en 1985. Es portero del América y ha jugado en equipos de Europa como el Málaga.'), nl ;
     Jugador == 'funes_mori' -> write('Rogelio Funes Mori es un delantero argentino naturalizado mexicano, juega en Monterrey y ha sido convocado a la selección mexicana.'), nl ;
     Jugador == 'vega' -> write('Alexis Vega es un joven delantero mexicano que juega en Chivas y es conocido por su velocidad y técnica.'), nl ;
     write('No tengo información sobre ese jugador.'), nl, biografias_mexico).

biografias_america :-
    write('¿Sobre qué jugador te gustaría saber? (escribe vela, messi o martinez entre comillas simples)'), nl,
    read(Jugador),
    (Jugador == 'vela' -> write('Carlos Vela es un delantero mexicano que juega en LAFC. Ha tenido una destacada carrera en la liga MLS y antes en Europa.'), nl ;
     Jugador == 'messi' -> write('Lionel Messi, uno de los mejores jugadores de todos los tiempos, juega en el Inter Miami. Anteriormente jugó en Barcelona y PSG.'), nl ;
     Jugador == 'martinez' -> write('Josef Martinez es un delantero venezolano que ha sido estrella en la MLS jugando para el Atlanta United y el Inter Miami.'), nl ;
     write('No tengo información sobre ese jugador.'), nl, biografias_america).

biografias_europa :-
    write('¿Sobre qué jugador te gustaría saber? (escribe ronaldo, messi o mbappe entre comillas simples)'), nl,
    read(Jugador),
    (Jugador == 'ronaldo' -> write('Cristiano Ronaldo, delantero portugués, es uno de los jugadores más reconocidos del mundo. Ha jugado para el Manchester United, Real Madrid, Juventus y ahora en Arabia Saudita.'), nl ;
     Jugador == 'messi' -> write('Lionel Messi, estrella mundial de fútbol, ha sido conocido principalmente por su carrera en el Barcelona y PSG, y ahora en el Inter Miami.'), nl ;
     Jugador == 'mbappe' -> write('Kylian Mbappe, delantero francés, es uno de los jóvenes talentos más destacados de Europa, actualmente jugando en el PSG.'), nl ;
     write('No tengo información sobre ese jugador.'), nl, biografias_europa).

% Módulo de tema de automóviles
tema_automoviles :-
    write('¿Te gustaría hablar sobre automóviles? (escribe si o no entre comillas simples)'), nl,
    read(Respuesta),
    (Respuesta == 'si' -> subtema_automoviles ;
     Respuesta == 'no' -> write('Entiendo, ¡tal vez en otro momento!'), nl ;
     write('Respuesta no válida. Por favor, escribe ''si'' o ''no''.'), nl, tema_automoviles),
    preguntar_continuar_hombre.

% Subtemas de automóviles
subtema_automoviles :-
    write('¿Te interesa hablar sobre marcas nacionales, marcas internacionales, características de seguridad o cilindraje de motor? (escribe marcas_nacionales, marcas_internacionales, seguridad o cilindraje entre comillas simples)'), nl,
    read(Tema),
    (Tema == 'marcas_nacionales' -> write('En México, las marcas nacionales incluyen VUHL y Mastretta, ambas conocidas por autos deportivos.'), nl ;
     Tema == 'marcas_internacionales' -> write('Marcas internacionales incluyen Toyota, Ford, BMW, y Audi, famosas por su innovación y calidad.'), nl ;
     Tema == 'seguridad' -> write('Las características de seguridad importantes incluyen frenos ABS, control de estabilidad y múltiples bolsas de aire.'), nl ;
     Tema == 'cilindraje' -> write('El cilindraje determina la potencia del motor. Motores de 4 cilindros son económicos, mientras que motores de 6 o 8 cilindros ofrecen mayor potencia.'), nl ;
     write('No tengo información sobre ese tema en automóviles.'), nl, subtema_automoviles),
    preguntar_continuar_hombre.

% Preguntar al usuario si desea continuar (para hombres)
preguntar_continuar_hombre :-
    write('¿Te gustaría hablar sobre otro tema? (futbol, automoviles o no para salir)'), nl,
    read(NuevoTema),
    (NuevoTema == 'futbol' -> tema_futbol ;
     NuevoTema == 'automoviles' -> tema_automoviles ;
     NuevoTema == 'no' -> write('Gracias por conversar. ¡Hasta pronto!'), nl ;
     write('Opción no válida. Escribe ''futbol'', ''automoviles'' o ''no''.'), nl,
     preguntar_continuar_hombre).
