# FIUBA - Taller de Sistemas Embebidos
## TP3 - Actividad 01: LCD Display Driver (porting C code)

* **Archivo de documentación:** `tdse-tp3_01-display.md`
* **Proyecto STM32:** `tdse-tp3_01-porting_c_code`

---

## 1. Resultado de Compilación Inicial (Paso 05)
* **Resultado:** Build Failed
* **Errores:** 14 errors
* **Advertencias:** 7 warnings
* **Ubicación:** Todos los errores se producen en el archivo `display.c`.
* **Causa:** El código utiliza métodos y clases de la librería Mbed (como `DigitalOut`) en lugar de las funciones de la capa de abstracción HAL de STM32F1.

---

## 2. Consulta General a Gemini (Paso 07)
### Consigna:
> "¿Puedes ayudarme a realizar un Trabajo Práctico sobre LCD Display (porting C code) - System Setup (statechart - modeling c coding)?"

### Respuesta:
# Asistencia y Guía General: TP3 - LCD Display & System Setup Menu

¡Hola! A continuación, presento un resumen estructurado para abordar la resolución del Trabajo Práctico N° 3, enfocado en la migración de código, modelado de estados y cumplimiento de restricciones temporales en sistemas embebidos.

## 1. Porting C Code (Migración de Mbed a STM32)
El objetivo de esta fase es adaptar un controlador de pantalla LCD que originalmente estaba escrito en C++ para la plataforma Mbed, llevándolo a C estándar utilizando la capa de abstracción de hardware (HAL) de STM32.

**Puntos clave para la migración:**
*   **Hardware y Pines:** El LCD opera en modo de 4 bits. Debes mapear los pines originales a los disponibles en la placa NUCLEO-F103RB (D4, D5, D6, D7 para datos; D8 y D9 para control).
*   **Reemplazo de Clases C++:** Las instancias de la clase `DigitalOut` de Mbed (ej. `DigitalOut displayD4(D4);`) deben eliminarse. En su lugar, debes configurar los pines usando STM32CubeIDE (`.ioc`).
*   **Escritura de Salidas:** Las asignaciones directas (ej. `displayD4 = value;`) deben reemplazarse por la función de la HAL: `HAL_GPIO_WritePin((GPIO_TypeDef*)D4_GPIO_Port, (uint16_t)D4_Pin, (GPIO_PinState)value);`.
*   **Manejo de Tiempos (Delays):** Las demoras bloqueantes de Mbed (`delay(X)`) deben sustituirse por `HAL_Delay()` para tiempos mayores a 1 ms, o por `systick_delay_us()` para microsegundos.

## 2. LCD Display Statechart (Modelado y Codificación en C)
Para evitar que las rutinas del display bloqueen el sistema, se debe implementar una máquina de estados (Statechart) utilizando Itemis Create.

**Consideraciones del diseño:**
*   El objetivo del diagrama de estados es enviar una sola instrucción o dato al display cada vez que el planificador (ejecutor cíclico) llame a la tarea (ej. cada 1 ms).
*   Esto garantiza que se cumplan las **restricciones temporales** del ejecutor cíclico, evitando cuellos de botella en la ejecución.
*   Una vez simulado correctamente en Itemis Create, el modelo se debe codificar en C dentro de `task_display.c`.

## 3. System Setup Menu (Modelado e Integración)
Esta etapa consiste en diseñar la lógica de interfaz de usuario mediante un menú jerárquico navegable con pulsadores.

**Características del Menú:**
*   **Niveles:** Cuenta con 4 niveles de profundidad (`Main`, `Menu #1`, `Menu #2`, `Menu #3`).
*   **Navegación:** Se utilizan tres eventos principales generados por los botones: `Enter`, `Next` y `Escape`.
*   **Implementación:** Es recomendable utilizar variables, arreglos y estructuras en C junto con pseudoestados de tipo "Choice" en Itemis Create para manejar la selección de parámetros (como encendido de motores, velocidad y sentido de giro).
*   **Integración de Hardware:** El sistema final integrará el LCD, los LEDs integrados (ej. LD2) y un teclado de membrana de 1x4 para interactuar con la tarea `task_system_update()`.

---

## 3. Análisis del Código Fuente con Gemini (Paso 08)
### Consigna:
> "Analizar y explicar (en español), el funcionamiento del código fuente contenido en los archivos adjuntos: app.c, app_it.c, systick.c, task_test_attribute.h, task_test.c, task_display_attribute.h, task_display_interface.c, task_display.c, display.h y display.c. Indicar el comportamiento de las funciones void task_test_statechart(void) y void task_display_statechart(void)."

### Respuesta:# Sistema Embebido Bare Metal - Controlador LCD HD44780

Este proyecto implementa un sistema embebido **Bare Metal impulsado por eventos y disparado por tiempo** (*Event-Triggered System / Time-Triggered Architecture*). 

## Arquitectura General
El planificador (*scheduler*) es de ejecución cooperativa y periódica con un período de tick de **1 ms**. El sistema gestiona la actualización periódica de una pantalla LCD HD44780 de 2 líneas x 16 caracteres y mide los tiempos de ejecución (*LET, BCET, WCET*) de cada tarea utilizando el contador de ciclos del núcleo ARM (DWT).

---

## Estructura del Proyecto y Archivos Fuente

### Núcleo de la Aplicación
* **`app.c`**: Contiene el punto de entrada de la aplicación en el ciclo principal y el despachador de tareas. Define las estructuras para las tareas (`task_cfg_t`) y métricas de rendimiento (`NOE`, `LET`, `BCET`, `WCET`). Gestiona la inicialización de tareas, interrupciones y el bucle principal de actualización.
* **`app_it.c`**: Maneja los eventos de interrupción a nivel de aplicación, incluyendo el callback del SysTick (cada 1 ms) que incrementa el contador global de ticks, y las interrupciones externas (GPIO/botones).
* **`systick.c`**: Implementa `systick_delay_us()`, proporcionando retardos bloqueantes precisos en microsegundos usando los registros del temporizador SysTick.

### Tarea de Prueba (Integración)
* **`task_test.c`**: Implementa la lógica de prueba del sistema. Inicializa el entorno de prueba y envía los mensajes iniciales al display. Ejecuta periódicamente la máquina de estados de prueba.
* **`task_test_attribute.h`**: Define la estructura de datos `task_test_dta_t` con las variables de estado (`tick` y `counter`).

### Tarea de Pantalla y Comunicación
* **`task_display.c`**: Módulo principal para el control de la tarea de pantalla. Inicializa el driver en modo GPIO de 4 bits y actualiza periódicamente la máquina de estados del display.
* **`task_display_interface.c`**: Provee la API `put_event_task_display()` para que otras tareas envíen texto a la pantalla, escribiendo en el buffer y levantando banderas de actualización.
* **`task_display_attribute.h`**: Define constantes de la pantalla (2x16), eventos (`EV_DSP_UPDATE`), estados (`ST_DSP_IDLE`, `ST_DSP_UPDATE`) y la memoria de caracteres (buffer `ddram`).

### Driver de Hardware (LCD HD44780)
* **`display.c`**: Controlador físico de bajo nivel. Maneja la secuencia de arranque, posicionamiento del cursor, envío de comandos/datos, y manipulación directa de los pines GPIO.
* **`display.h`**: Encabezado público del driver, definiendo opciones de bus (4 u 8 bits) y la estructura principal del controlador.

---

## Máquinas de Estados (FSM)

### Comportamiento de `task_test_statechart()`
Gestiona la ejecución periódica de la tarea de prueba no bloqueante:
1. **Incremento continuo:** Aumenta un contador general en cada iteración (cada 1 ms).
2. **Temporizador de Eventos:** Decrementa un temporizador `tick`. Cuando este llega a 0 (1 segundo):
   * Reinicia el temporizador a 1000 ms.
   * Envía la plantilla de texto `"Test Nro: ******"` a la segunda línea del display.
   * Calcula los segundos transcurridos dividiendo el contador total por 1000.
   * Formatea este valor numérico y lo envía para ser dibujado sobre la plantilla.

### Comportamiento de `task_display_statechart()`
Controla la actualización física de la pantalla LCD basándose en eventos:
* **Estado `ST_DSP_IDLE` (Reposo):**
  * Monitorea pasivamente si existe una solicitud de actualización (bandera activada y evento `EV_DSP_UPDATE`).
  * Al detectar una solicitud válida, transiciona al estado de actualización.
* **Estado `ST_DSP_UPDATE` (Actualización):**
  * Desactiva la bandera de solicitud para evitar dobles escrituras.
  * Resetea las coordenadas del cursor.
  * Transmite secuencialmente todo el contenido del buffer de la primera línea a la pantalla física.
  * Repite el proceso para el buffer de la segunda línea.
  * Retorna automáticamente al estado `ST_DSP_IDLE`.

---

## 4. Registro y Análisis Temporal (Paso 10)
### Valores de `task_dta_list[index]`:
* **Unidad de medida:** [Indicar us o ms]
* **Mediciones:**
  * `task_dta_list[...]`: ...

### Análisis de Restricciones Temporales:
### Valores de `task_dta_list` (Tarea 0)

Luego de varias ejecuciones de la función `app_update()`, se registraron los siguientes valores para la primera tarea (`task_dta_list[0]`):

| Métrica | Descripción | Valor | Unidad |
| :--- | :--- | :--- | :--- |
| **NOE** | Number Of Executions (Número de ejecuciones) | 313910 | - |
| **LET** | Last Execution Time (Último tiempo de ejecución) | 2 | µs |
| **BCET** | Best Case Execution Time (Mejor tiempo de ejecución) | 2 | µs |
| **WCET** | Worst Case Execution Time (Peor tiempo de ejecución) | 37 | µs |

---

### Análisis de las restricciones temporales del ejecutor cíclico

A partir de los datos recolectados en la tabla, se puede confirmar que la tarea **cumple perfectamente** con las restricciones temporales impuestas por el ejecutor cíclico. 

El parámetro más crítico a evaluar es el **WCET** (Peor Tiempo de Ejecución), el cual alcanzó un valor máximo de **37 µs**. En este tipo de sistemas, el *tick* del sistema o la ranura de tiempo del ejecutor suele ser de 1 milisegundo (1000 µs). Como el tiempo máximo que toma la tarea en ejecutarse (37 µs) es significativamente menor al período del sistema (1000 µs), se garantiza que la tarea finaliza mucho antes de su fecha límite (deadline). 

Esto asegura que el microcontrolador tiene tiempo de sobra para ejecutar otras tareas planificadas dentro del mismo ciclo sin producir bloqueos ni desbordamientos (overruns).
