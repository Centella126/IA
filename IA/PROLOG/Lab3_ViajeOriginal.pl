% Hechos de destinos turísticos
destino(playa, clima_calido, presupuesto_alto).
destino(montana, clima_frio, presupuesto_bajo).
destino(desierto, clima_calido, presupuesto_bajo).
destino(ciudad, clima_moderado, presupuesto_medio).

% Regla para recomendar un destino de viaje
recomendar_destino(Destino) :-
    destino(Destino, clima_calido, presupuesto_alto),
    write('Se recomienda viajar a la playa para un clima cálido y con un presupuesto alto.'), nl.

recomendar_destino(Destino) :-
    destino(Destino, clima_frio, presupuesto_bajo),
    write('Se recomienda un destino de montaña para un clima frío con un presupuesto bajo.'), nl.

recomendar_destino(Destino) :-
    destino(Destino, clima_calido, presupuesto_bajo),
    write('Se recomienda un viaje al desierto para clima cálido con un presupuesto bajo.'), nl.

recomendar_destino(Destino) :-
    destino(Destino, clima_moderado, presupuesto_medio),
    write('Se recomienda una visita a la ciudad para un clima moderado y un presupuesto medio.'), nl.

% Regla para destinos desconocidos
destino_desconocido(Clima, Presupuesto) :-
    \+ destino(_, Clima, Presupuesto),
    write('No se ha encontrado un destino para el clima y presupuesto especificados.'), nl.
