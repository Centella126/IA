(deftemplate fruta-caracteristicas
   (slot color)
   (slot sabor))

(defrule input-fruta-facto
   ?facto <- (preguntar-color ?color)
             (preguntar-sabor ?sabor)
   =>
   (printout t "Procesando la información de la fruta..." crlf)
   (assert (fruta-caracteristicas (color ?color) (sabor ?sabor)))
   (retract ?facto))

(defrule es-manzana
    (fruta-caracteristicas (color "roja") (sabor "dulce"))
    =>
    (printout t "La fruta es una manzana." crlf))

(defrule es-platano
    (fruta-caracteristicas (color "amarilla") (sabor "dulce"))
    =>
    (printout t "La fruta es un plátano." crlf))

(defrule es-limon 
    (fruta-caracteristicas (color "verde") (sabor "ácido"))
    =>
    (printout t "La fruta es un limón." crlf))

(defrule desconocido
    (fruta-caracteristicas (color ?color) (sabor ?sabor))
    =>
    (printout t "No conozco ninguna fruta con esas características: color " ?color " y sabor " ?sabor "." crlf))

(assert (preguntar-color "roja"))

(assert (preguntar-sabor "dulce"))

(run)
