# Importar librerías

from tensorflow import keras
from keras.models import Sequential
from keras.layers import Dense

import pandas as pd

#importar información con método rcsv

data = pd.read_csv('concrete_data.csv')

# Declaración de variables imporantes

data_columnas = data.columns
#mandamos traer todas las columnas que sean diferentes a fuerza
labels = data[data_columnas[data_columnas != 'Strength']]
target = data['Strength']
#para los targets traemos data con todas sus columnas que sí sean fuerza
n_cols = labels.shape[1]    # si no funciona cambiar data.shape[1]

# Crear el modelo

modelo = Sequential()

# Agregar capas
#capa input, donde inyectamos los datos que queremos
# Dense = numero de neuronas
# [modelo].add(Dense([50], activation = [metodo], input_shape = [int]))
modelo.add(Dense(50, activation = 'relu', input_shape = (n_cols,)))
modelo.add(Dense(50, activation = 'relu'))
modelo.add(Dense(1))

# Compilar 
# # [modelo].compile(optimizer = 'funcion', loss = 'mean_squared_error')
modelo.compile(optimizer = 'adam', loss = 'mean_squared_error')

# Entrenar

#labels= datos usados
#target= resultados esperados
#validation_split = % de data set para que sea correcta la prediccion
#pochs= cantidad de repeticiones
# verbose = cantidad de informacion que quieremos que nos muestre 0=nada 1=informacion al final 2=info en cada epoca
modelo.fit(labels, target, validation_split = 0.3, epochs = 100, verbose = 2)