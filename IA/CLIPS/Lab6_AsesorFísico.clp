; Definición del sistema experto para asesoría de ejercicio físico

(deftemplate condicion
   (slot nivel (type SYMBOL) (allowed-values principiante intermedio avanzado))
   (slot objetivo (type SYMBOL) (allowed-values bajar-peso ganar-musculo mantenerse)))

(defrule ingreso-de-condicion
   =>
   (printout t "¿Cuál es tu nivel de condición física? (principiante/intermedio/avanzado): " crlf)
   (bind ?nivel (read))
   (printout t "¿Cuál es tu objetivo? (bajar-peso/ganar-musculo/mantenerse): " crlf)
   (bind ?objetivo (read))
   (assert (condicion (nivel ?nivel) (objetivo ?objetivo))))

(defrule rutina-cardio
   (condicion (nivel principiante) (objetivo bajar-peso))
   =>
   (printout t "Recomendación: Comienza con 30 minutos de cardio de baja intensidad, 3 veces por semana." crlf))

(defrule rutina-fuerza
   (condicion (nivel intermedio) (objetivo ganar-musculo))
   =>
   (printout t "Recomendación: Realiza entrenamiento de fuerza con pesas 4 veces por semana." crlf))

(defrule rutina-mantenimiento
   (condicion (nivel avanzado) (objetivo mantenerse))
   =>
   (printout t "Recomendación: Realiza una combinación de cardio y entrenamiento de fuerza, 5 veces por semana." crlf))

(defrule rutina-definición
   (condicion (nivel avanzado) (objetivo bajar-peso))
   =>
   (printout t "Recomendación: Realiza una combinación de cardio y dieta con pocos carbohidratos, 5 veces por semana." crlf))

(defrule rutina-desconocida
   (condicion (nivel ?nivel) (objetivo ?objetivo))
   =>
   (printout t "No tenemos una recomendación específica para tu nivel y objetivo." crlf))

(defrule iniciar
   =>
   (printout t "Sistema Experto para Asesoría de Ejercicio Físico" crlf)
   (run))
