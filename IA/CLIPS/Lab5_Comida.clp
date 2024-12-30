; Definición del sistema experto para la selección de tipo de comida

(deftemplate preferencias
   (slot tipo (type SYMBOL) (allowed-values vegetariana vegana carnivora))
   (slot picante (type SYMBOL) (allowed-values si no))
   (slot gluten (type SYMBOL) (allowed-values si no)))

(defrule ingreso-de-preferencias
   =>
   (printout t "¿Qué tipo de dieta sigues? (vegetariana/vegana/carnivora): " crlf)
   (bind ?tipo (read))
   (printout t "¿Te gusta la comida picante? (si/no): " crlf)
   (bind ?picante (read))
   (printout t "¿Eres intolerante al gluten? (si/no): " crlf)
   (bind ?gluten (read))
   (assert (preferencias (tipo ?tipo) (picante ?picante) (gluten ?gluten))))

(defrule comida-tacos
   (preferencias (tipo carnivora) (picante si) (gluten no))
   =>
   (printout t "Recomendación: Puedes disfrutar de unos tacos de carne con salsa picante." crlf))

(defrule comida-ensalada
   (preferencias (tipo vegetariana) (picante no) (gluten no))
   =>
   (printout t "Recomendación: Una ensalada fresca es ideal para ti." crlf))

(defrule comida-sushi
   (preferencias (tipo carnivora) (picante no) (gluten si))
   =>
   (printout t "Recomendación: El sushi es una buena opción, solo asegúrate de que sea libre de gluten." crlf))

(defrule comida-tofu
   (preferencias (tipo vegana) (picante no) (gluten no))
   =>
   (printout t "Recomendación: El tofu salteado es una opción deliciosa y saludable." crlf))

(defrule comida-pozole
   (preferencias (tipo carnivora) (picante no) (gluten no))
   =>
   (printout t "Recomendación: El pozole es una opción deliciosa y saludable." crlf))

(defrule comida-desconocida
   (preferencias (tipo ?tipo) (picante ?picante) (gluten ?gluten))
   =>
   (printout t "No tenemos una recomendación específica para esas preferencias." crlf))

(defrule iniciar
   =>
   (printout t "Sistema Experto para Selección de Tipo de Comida" crlf)
   (run))
