#LABORATORIO 1 - OPERACIONES BÁSICAS

def suma(val1, val2):   #define la función de suma
  return val1 + val2

def resta(val1, val2):  #define la función de resta
  return val1 - val2

def multiplica(val1, val2):   #define la función de multiplicación
  return val1 * val2

def divide(val1, val2):   #define la función de división
  if(val2<=0):
    return "No se puede dividir entre cero o menor a cero"
  else:
    return val1 / val2
  
#Muestra las opciones
print("opciones")
print("[1] Suma")
print("[2] Resta")
print("[3] Multiplicación")
print("[4] División")

op=int(input("Seleccione una opción: "))

val1=int(input("Ingrese un número: "))
val2=int(input("Ingrese otro número: "))

#Las siguientes líneas son lo equivalente a un switch, se evalúa la opción elegida
if op == 1:
    print(f"Resultado: {suma(val1, val2)}")  #Las f-strings permiten expresiones dentro de una cadena de texto usando llaves {}
elif op == 2:
    print(f"Resultado: {resta(val1, val2)}")
elif op == 3:
    print(f"Resultado: {multiplica(val1, val2)}")
elif op == 4:
    print(f"Resultado: {divide(val1, val2)}")
else:
    print("Opción no válida")




