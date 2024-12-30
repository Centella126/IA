#LABORATORIO 2 - AGENTE DE REFLEJO O SIMPLE

import random

# Definición del entorno del jardín
class EntornoJardin:
    def __init__(self):
        # El estado inicial de la planta (seca o húmeda) se asigna aleatoriamente
        self.planta = random.choice(['seca', 'humeda'])
        # El estado inicial del terreno (roca o libre) se asigna aleatoriamente
        self.terreno = random.choice(['roca', 'libre'])

    # Método que devuelve la percepción del agente (estado de la planta y del terreno)
    def obtener_percepcion(self):
        return self.planta, self.terreno

    # Si el agente decide regar la planta, el estado de la planta se cambia a 'humeda'
    def cambiar_estado_planta(self):
        self.planta = 'humeda'

    # Si el agente esquiva la roca, el terreno se cambia a 'libre'
    def cambiar_estado_terreno(self):
        self.terreno = 'libre'

# Definición del agente (robot jardinero)
class RobotJardinero:
    # Método que decide la acción en función de la percepción actual
    def actuar(self, percepcion):
        planta, terreno = percepcion  # La percepción contiene el estado de la planta y el terreno

        # Si la planta está seca, el agente decide regar
        if planta == 'seca':
            return 'regar'
        # Si hay una roca, el agente decide esquivar
        elif terreno == 'roca':
            return 'esquivar'
        # Si la planta está húmeda y no hay roca, el agente decide descansar
        else:
            return 'descansar'

# Función para simular el comportamiento del agente en su entorno
def simular_jardinero():
    entorno = EntornoJardin()  # Creamos el entorno del jardín con planta y terreno aleatorios
    jardinero = RobotJardinero()  # Creamos el agente robot jardinero

    # El agente actuará dos veces
    for i in range(2):  
        percepcion = entorno.obtener_percepcion()  # El agente percibe el entorno
        accion = jardinero.actuar(percepcion)  # El agente decide una acción basada en la percepción

        # Imprimir la percepción y la acción del agente en esta iteración
        print(f"Percepción: Planta está {percepcion[0]} y el terreno está {percepcion[1]}.")
        print(f"Acción del robot: {accion}\n")

        # Si el agente decide regar, el entorno cambia el estado de la planta a 'humeda'
        if accion == 'regar':
            entorno.cambiar_estado_planta()
        # Si el agente esquiva la roca, el terreno cambia a 'libre'
        elif accion == 'esquivar':
            entorno.cambiar_estado_terreno()

# Ejecutar la simulación del robot jardinero
simular_jardinero()


