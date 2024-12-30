import random

# Constantes
N = 30  # Número de elementos en el arreglo
R = 10  # Rango de los valores aleatorios (0-9)

# Función para generar números aleatorios
def aleatorio(n):
    return [random.randint(0, R-1) for _ in range(n)]

# Función de búsqueda secuencial
def busqueda(v, clave, n):
    centinela = -1
    indice = -1
    for i in range(n):
        if v[i] == clave:
            centinela = 1
            indice = i
            break  # Terminamos la búsqueda si se encuentra el valor
    return centinela, indice

# Función para imprimir el vector
def imprimirvh(v, x):
    if x == 1:
        for i in range(len(v)):
            print(f"[{i}]", end="")
        print()
    
    for i in range(len(v)):
        print(f" {v[i]} ", end="")
    print()

# Función principal (main)
def main():
    v = aleatorio(N)
    
    print("\n\t B U S Q U E D A   S E C U E N C I A L  O   L I N E A L \n")
    print("Vector: \n")
    imprimirvh(v, 1)
    
    clave = int(input("\n\nIngrese la clave a buscar: "))
    
    centinela, indice = busqueda(v, clave, N)
    
    if centinela == -1:
        print("\n\n\t El número no se encontró")
    else:
        print(f"\n\n\t El número ha sido encontrado en el índice {indice}")

if __name__ == "__main__":
    main()




