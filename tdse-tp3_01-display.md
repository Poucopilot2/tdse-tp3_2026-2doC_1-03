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

### Respuesta:
*(Pegar aquí el análisis detallado proporcionado por Gemini sobre los archivos adjuntos y las funciones indicadas)*

---

## 4. Registro y Análisis Temporal (Paso 10)
### Valores de `task_dta_list[index]`:
* **Unidad de medida:** [Indicar us o ms]
* **Mediciones:**
  * `task_dta_list[...]`: ...

### Análisis de Restricciones Temporales:
*(Analizar si los tiempos registrados cumplen con las restricciones temporales requeridas por el ejecutor cíclico)*
