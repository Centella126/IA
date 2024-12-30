import numpy as np
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# Datos de ejemplo: entradas y salidas
# Entradas: pares de números
# Salidas: suma de los pares
X = np.array([[1, 2], [2, 3], [3, 4], [4, 5], [5, 6]])  # Entradas convertidas a array de NumPy
y = np.array([3, 5, 7, 9, 11])  # Salidas convertidas a array de NumPy

# Crear el modelo
modelo = Sequential()
modelo.add(Dense(10, activation='relu', input_shape=(2,)))  # Capa oculta
modelo.add(Dense(1, activation='linear'))  # Capa de salida

# Compilar el modelo
modelo.compile(optimizer='adam', loss='mean_squared_error', metrics=['mae'])

# Entrenar el modelo
modelo.fit(X, y, epochs=500, verbose=0)  # 200 épocas para buen ajuste

# Evaluar el modelo con los mismos datos de entrenamiento
loss, mae = modelo.evaluate(X, y, verbose=0)
print(f"Pérdida: {loss:.4f}, Error Absoluto Medio (MAE): {mae:.4f}")

# Realizar predicciones con datos nuevos
nuevos_datos = np.array([[6, 7], [7, 8], [8, 9]])  # Nuevas entradas convertidas a array de NumPy
predicciones = modelo.predict(nuevos_datos)

print("Predicciones:")
for i, pred in enumerate(predicciones):
    print(f"Entrada: {nuevos_datos[i]} -> Predicción: {pred[0]:.4f}")