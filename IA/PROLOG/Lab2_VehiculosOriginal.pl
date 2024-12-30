% Hechos de síntomas del vehículo
sintoma(bateria_muerta, no_arranca).
sintoma(bujias_danadas, motor_irregular).
sintoma(tanque_vacio, no_arranca).
sintoma(alternador_fallando, luces_debil).
sintoma(no_gira_motor, no_arranca).

% Reglas para diagnóstico de problemas
problema(bateria_muerta) :-
    sintoma(bateria_muerta, no_arranca),
    write('El problema es la batería. Está muerta o descargada.'), nl.

problema(bujias_danadas) :-
    sintoma(bujias_danadas, motor_irregular),
    write('El problema son las bujías. Están dañadas o desgastadas.'), nl.

problema(tanque_vacio) :-
    sintoma(tanque_vacio, no_arranca),
    write('El problema es el tanque de gasolina. Está vacío.'), nl.

problema(alternador_fallando) :-
    sintoma(alternador_fallando, luces_debil),
    write('El problema es el alternador. Está fallando y no carga bien la batería.'), nl.

% Regla para problemas desconocidos
problema_desconocido(Sintoma) :-
    \+ sintoma(_, Sintoma),
    write('No se ha encontrado un problema relacionado con el síntoma proporcionado.'), nl.
