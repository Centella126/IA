import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import SimpleRNN, Dense
import matplotlib.pyplot as plt

# Generar la secuencia de Fibonacci
def generate_fibonacci_sequence(length):
    sequence = [0, 1]
    for i in range(2, length):
        sequence.append(sequence[-1] + sequence[-2])
    return sequence

# Configuración
sequence_length = 20  # Longitud de la secuencia de Fibonacci
fibonacci_sequence = generate_fibonacci_sequence(sequence_length)

# Preparación de datos
def create_dataset(sequence, window_size):
    X, y = [], []
    for i in range(len(sequence) - window_size):
        X.append(sequence[i:i + window_size])
        y.append(sequence[i + window_size])
    return np.array(X), np.array(y)

window_size = 3  # Número de pasos atrás para predecir el siguiente número
X, y = create_dataset(fibonacci_sequence, window_size)

# Reshape para el formato de entrada de RNN
X = X.reshape((X.shape[0], X.shape[1], 1))  # (muestras, pasos de tiempo, características)

# Construcción del modelo RNN
model = Sequential([
    SimpleRNN(50, activation='relu', input_shape=(window_size, 1)),
    Dense(1)  # Una salida para predecir el próximo número
])

# Compilación del modelo
model.compile(optimizer='adam', loss='mse', metrics=['mae'])

# Entrenamiento con historial
history = model.fit(X, y, epochs=200, verbose=0)

# Evaluación del modelo
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Mean Absolute Error: {mae}")

# Predicción
test_input = np.array(fibonacci_sequence[-window_size:]).reshape((1, window_size, 1))
predicted_value = model.predict(test_input, verbose=0)
print(f"Entrada: {fibonacci_sequence[-window_size:]}")  # Últimos valores de entrada
print(f"Predicción del siguiente número: {predicted_value[0][0]}")  # Predicción

# Graficar la pérdida durante el entrenamiento
plt.plot(history.history['loss'], label='Pérdida (Loss)')
plt.title('Desempeño del Modelo durante el Entrenamiento')
plt.xlabel('Épocas (Iteraciones)')
plt.ylabel('Pérdida (MSE)')
plt.axvline(x=len(history.history['loss']) - 1, color='r', linestyle='--', label='Final del entrenamiento')
plt.legend()
plt.grid()
plt.show()
