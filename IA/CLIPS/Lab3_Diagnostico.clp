; Definición del sistema experto para diagnóstico de enfermedades

(deftemplate sintomas
   (slot fiebre (type SYMBOL) (allowed-values si no))
   (slot dolor-de-cabeza (type SYMBOL) (allowed-values si no))
   (slot congestion-nasal (type SYMBOL) (allowed-values si no))
   (slot estornudos (type SYMBOL) (allowed-values si no))
   (slot tos (type SYMBOL) (allowed-values si no))
   (slot dificultad-para-respirar (type SYMBOL) (allowed-values si no))) ; Nuevo síntoma

(defrule ingreso-de-sintomas
   =>
   (printout t "¿Tiene fiebre? (si/no): " crlf)
   (bind ?fiebre (read))
   (printout t "¿Tiene dolor de cabeza? (si/no): " crlf)
   (bind ?dolor (read))
   (printout t "¿Tiene congestión nasal? (si/no): " crlf)
   (bind ?congestion (read))
   (printout t "¿Tiene estornudos? (si/no): " crlf)
   (bind ?estornudos (read))
   (printout t "¿Tiene tos? (si/no): " crlf)
   (bind ?tos (read))
   (printout t "¿Tiene dificultad para respirar? (si/no): " crlf) ; Pregunta sobre el nuevo síntoma
   (bind ?dificultad (read))
   (assert (sintomas (fiebre ?fiebre) (dolor-de-cabeza ?dolor)
                     (congestion-nasal ?congestion) (estornudos ?estornudos)
                     (tos ?tos) (dificultad-para-respirar ?dificultad)))) ; Incluimos el nuevo síntoma

; Reglas para diagnosticar enfermedades
(defrule diagnostico-gripe
   (sintomas (fiebre si) (dolor-de-cabeza si) (congestion-nasal si) (estornudos no) (tos si) (dificultad-para-respirar no))
   =>
   (printout t "Diagnóstico: Es probable que tenga gripe." crlf))

(defrule diagnostico-resfriado
   (sintomas (fiebre no) (dolor-de-cabeza no) (congestion-nasal si) (estornudos si) (tos si) (dificultad-para-respirar no))
   =>
   (printout t "Diagnóstico: Es probable que tenga un resfriado común." crlf))

(defrule diagnostico-covid
   (sintomas (fiebre si) (dolor-de-cabeza si) (congestion-nasal si) (estornudos no) (tos si) (dificultad-para-respirar si)) ; Regla para COVID
   =>
   (printout t "Diagnóstico: Es probable que tenga COVID-19." crlf))

(defrule diagnostico-desconocido
   (sintomas (fiebre ?fiebre) (dolor-de-cabeza ?dolor)
             (congestion-nasal ?congestion) (estornudos ?estornudos)
             (tos ?tos) (dificultad-para-respirar ?dificultad))
   =>
   (printout t "No se puede determinar el diagnóstico con los síntomas proporcionados." crlf))

; Inicia el sistema experto
(defrule iniciar
   =>
   (printout t "Sistema Experto de Diagnóstico Básico" crlf)
   (run))

