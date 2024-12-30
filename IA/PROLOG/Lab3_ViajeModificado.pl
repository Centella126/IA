% Hechos de destinos turísticos
destino(playa, clima_calido, presupuesto_alto, zona_rural).
destino(montana, clima_frio, presupuesto_bajo, zona_rural).
destino(desierto, clima_calido, presupuesto_bajo, zona_rural).
destino(ciudad, clima_moderado, presupuesto_medio, zona_urbana).

% Regla para recomendar un destino de viaje con zona específica
recomendar_destino(Destino, Zona) :-
    destino(Destino, clima_calido, presupuesto_alto, Zona),
    Zona == zona_urbana,
    write('Se recomienda visitar una playa dentro de una zona urbana para un clima cálido y con un presupuesto alto.'), nl.

recomendar_destino(Destino, Zona) :-
    destino(Destino, clima_calido, presupuesto_alto, Zona),
    Zona == zona_rural,
    write('Se recomienda visitar una playa en zona rural para un clima cálido y con un presupuesto alto.'), nl.

recomendar_destino(Destino, Zona) :-
    destino(Destino, clima_frio, presupuesto_bajo, Zona),
    Zona == zona_rural,
    write('Se recomienda un destino de montaña en zona rural para un clima frío con un presupuesto bajo.'), nl.

recomendar_destino(Destino, Zona) :-
    destino(Destino, clima_calido, presupuesto_bajo, Zona),
    Zona == zona_rural,
    write('Se recomienda un viaje al desierto en zona rural para clima cálido con un presupuesto bajo.'), nl.

recomendar_destino(Destino, Zona) :-
    destino(Destino, clima_moderado, presupuesto_medio, Zona),
    Zona == zona_urbana,
    write('Se recomienda una visita a la ciudad dentro de una zona urbana para un clima moderado y un presupuesto medio.'), nl.

% Regla para destinos desconocidos en función del clima, presupuesto y zona
destino_desconocido(Clima, Presupuesto, Zona) :-
    \+ destino(_, Clima, Presupuesto, Zona),
    write('No se ha encontrado un destino para el clima, presupuesto y zona especificados.'), nl.
