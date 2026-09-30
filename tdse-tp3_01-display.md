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

---

## 3. Análisis del Código Fuente con Gemini (Paso 08)
### Consigna:
> "Analizar y explicar (en español), el funcionamiento del código fuente contenido en los archivos adjuntos: app.c, app_it.c, systick.c, task_test_attribute.h, task_test.c, task_display_attribute.h, task_display_interface.c, task_display.c, display.h y display.c. Indicar el comportamiento de las funciones void task_test_statechart(void) y void task_display_statechart(void)."

---

## 4. Registro y Análisis Temporal (Paso 10)
### Valores de `task_dta_list[index]`:
* **Unidad de medida:** [Indicar us o ms]
* **Mediciones:**
  * `task_dta_list[...]`: ...

### Análisis de Restricciones Temporales:
*(Analizar si los tiempos registrados cumplen con las restricciones temporales requeridas por el ejecutor cíclico)*
