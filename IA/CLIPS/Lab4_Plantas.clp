; Definición del sistema experto para recomendación de plantas de interior

(deftemplate condiciones
   (slot luz (type SYMBOL) (allowed-values alta media baja))
   (slot riego (type SYMBOL) (allowed-values frecuente moderado bajo))
   (slot espacio (type SYMBOL) (allowed-values amplio reducido)))

(defrule ingreso-de-condiciones
   =>
   (printout t "¿Cuál es el nivel de luz en el espacio? (alta/media/baja): " crlf)
   (bind ?luz (read))
   (printout t "¿Con qué frecuencia puedes regar la planta? (frecuente/moderado/bajo): " crlf)
   (bind ?riego (read))
   (printout t "¿El espacio es amplio o reducido? (amplio/reducido): " crlf)
   (bind ?espacio (read))
   (assert (condiciones (luz ?luz) (riego ?riego) (espacio ?espacio))))

(defrule planta-sansevieria
   (condiciones (luz baja) (riego bajo) (espacio reducido))
   =>
   (printout t "Recomendación: La Sansevieria es ideal para ti. Requiere poca luz y riego ocasional." crlf))

(defrule planta-pothos
   (condiciones (luz media) (riego moderado) (espacio reducido))
   =>
   (printout t "Recomendación: El Pothos es una excelente opción. Tolera luz media y riego moderado." crlf))

(defrule planta-palmera
   (condiciones (luz alta) (riego frecuente) (espacio amplio))
   =>
   (printout t "Recomendación: La Palmera Areca se adaptará bien. Necesita mucha luz y riego frecuente." crlf))

(defrule planta-sávila
   (condiciones (luz alta) (riego moderado) (espacio amplio))
   =>
   (printout t "Recomendación: La Sávila se adaptará bien. Necesita mucha luz y riego frecuente." crlf))

(defrule planta-desconocida
   (condiciones (luz ?luz) (riego ?riego) (espacio ?espacio))
   =>
   (printout t "No tenemos una planta específica para esas condiciones." crlf))

(defrule iniciar
   =>
   (printout t "Sistema Experto para Recomendación de Plantas de Interior" crlf)
   (run))
