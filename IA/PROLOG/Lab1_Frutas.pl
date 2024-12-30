% Hechos de color de la fruta
color(manzana, roja).
color(platano, amarilla).
color(limon, verde).
color(naranja, naranja).

% Hechos de sabor de la fruta
sabor(manzana, dulce).
sabor(platano, dulce).
sabor(limon, acido).
sabor(naranja, dulce).

% Regla para identificar la fruta según color y sabor
fruta(F) :-
color(F, roja),
sabor(F, dulce),
write(&#39;La fruta es una manzana.&#39;), nl.

fruta(F) :-
color(F, amarilla),
sabor(F, dulce),
write(&#39;La fruta es un platano.&#39;), nl.

fruta(F) :-
color(F, verde),
sabor(F, acido),
write(&#39;La fruta es un limón.&#39;), nl.

fruta(F) :-
color(F, naranja),
sabor(F, dulce),
write(&#39;La fruta es una naranja.&#39;), nl.

% Regla para frutas no identificadas
fruta_desconocida(Color, Sabor) :-
\+ (color(_, Color), sabor(_, Sabor)),
write(&#39;No conozco ninguna fruta con esas características.&#39;), nl.