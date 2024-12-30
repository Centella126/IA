import random  # Importa el módulo random para generar números aleatorios

# Variables globales
N = 30  # Número de elementos en el arreglo
R = 50  # Rango de los números aleatorios (en este caso de 0 a 49)

# Función de búsqueda binaria
def bbinaria(v, clave):
    i = 0  # Índice inicial
    d = N - 1  # Índice final
    
    while i <= d:
        c = (i + d) // 2  # Calcula el índice central
        if v[c] == clave:  # Si el valor en el índice central es la clave buscada
            return c  # Retorna el índice donde se encontró la clave
        elif clave > v[c]:  # Si la clave es mayor que el valor en el índice central
            i = c + 1  # Mueve el índice inicial hacia la derecha
        else:
            d = c - 1  # Mueve el índice final hacia la izquierda
    return -1  # Retorna -1 si no se encuentra la clave

# Función de ordenación por selección directa
def oselecciondirecta(v, y):  # Recibe el vector y un valor y (usado para imprimir en un paso)
    for i in range(N - 1):  # Itera sobre todos los elementos del vector
        min_idx = i  # Índice del valor mínimo
        for j in range(i + 1, N):  # Busca el valor mínimo en la sublista no ordenada
            if v[j] < v[min_idx]:
                min_idx = j  # Actualiza el índice del valor mínimo
        if y == 0:
            print(f"P{i+1}: ", end="")  # Imprime el paso si y es 0
            imprimirvh(v, 0)  # Muestra el vector
        cambiovariable(v, min_idx, i)  # Intercambia el valor mínimo encontrado con el primer valor no ordenado

# Función para intercambiar dos valores en el vector
def cambiovariable(v, i, j):
    v[i], v[j] = v[j], v[i]  # Intercambia los valores en las posiciones i y j

# Función para imprimir el vector
def imprimirvh(v, x):
    if x == 1:  # Si x es 1, imprime los índices del vector
        for i in range(len(v)):
            print(f"[{i}]", end="")
        print()
    for i in range(len(v)):  # Imprime los valores del vector
        print(f" {v[i]} ", end="")
    print()

# Función para generar un vector con números aleatorios
def aleatorio(n):
    return [random.randint(0, R-1) for _ in range(n)]  # Genera un vector de tamaño n con valores aleatorios entre 0 y R-1

# Función principal del programa
def main():
    v = aleatorio(N)  # Genera un vector aleatorio con N elementos
    
    print("\n\t B U S Q U E D A   B I N A R I A \n")
    
    print("Vector desordenado: \n")
    imprimirvh(v, 1)  # Imprime el vector desordenado
    print("\n\n\nVector ordenado: \n")
    
    oselecciondirecta(v, 1)  # Ordena el vector usando selección directa
    imprimirvh(v, 1)  # Imprime el vector ordenado
    
    clave = int(input("\n\nIngrese la clave a buscar: "))  # Solicita al usuario la clave a buscar
    
    resultado = bbinaria(v, clave)  # Busca la clave usando búsqueda binaria
    if resultado == -1:
        print("\n\tDato no encontrado\n")  # Informa si el dato no se encontró
    else:
        print(f"\n\tEl dato {clave} se encontró en la posición: {resultado}\n")  # Imprime la posición del dato si se encontró

if __name__ == "__main__":
    main()





