% Hechos de preferencias de mascotas
mascota(perro, espacio_grande, actividad_alta, tiempo_mucho, experiencia_media, tipo_domestico).
mascota(gato, espacio_medio, actividad_media, tiempo_poco, experiencia_baja, tipo_domestico).
mascota(pez, espacio_pequeno, actividad_baja, tiempo_poco, experiencia_baja, tipo_acuatico).
mascota(huron, espacio_medio, actividad_media, tiempo_medio, experiencia_media, tipo_exotico).
mascota(conejo, espacio_pequeno, actividad_baja, tiempo_medio, experiencia_media, tipo_domestico).
mascota(iguana, espacio_medio, actividad_baja, tiempo_medio, experiencia_alta, tipo_exotico).
mascota(hamster, espacio_pequeno, actividad_baja, tiempo_poco, experiencia_baja, tipo_domestico).
mascota(caballo, espacio_grande, actividad_alta, tiempo_mucho, experiencia_alta, tipo_domestico).

% Reglas de recomendación basadas en características del usuario
recomendar_mascota(Mascota, Espacio, Actividad, Tiempo, Experiencia, Tipo) :-
    mascota(Mascota, Espacio, Actividad, Tiempo, Experiencia, Tipo),
    format('Para un espacio ~w, actividad ~w, tiempo disponible ~w, experiencia ~w y preferencia de tipo ~w, se recomienda: ~w.',
           [Espacio, Actividad, Tiempo, Experiencia, Tipo, Mascota]), nl.

% Regla para casos donde no se encuentra una mascota ideal
recomendar_mascota_desconocida(Espacio, Actividad, Tiempo, Experiencia, Tipo) :-
    \+ mascota(_, Espacio, Actividad, Tiempo, Experiencia, Tipo),
    write('No se ha encontrado una mascota que cumpla con todas las características proporcionadas.'), nl.
