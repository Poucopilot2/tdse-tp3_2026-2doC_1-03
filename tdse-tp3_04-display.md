# FIUBA - Electrónica - Taller de Sistemas Embebidos
## Trabajo Práctico N°: 3 - LCD Display - System Setup Menu
### 2026-2doC - 01-3
### Responsable de la entrega:
| Padrón | Apellidos, Nombres | Fecha | Deadline |
| :----- | :--------------------- | :------: | :-------: |
| 113786 | Pozo, Lucas Santiago | 30/9 | Semana 08 |


## Tiempos de Ejecución de Tareas y Análisis Cíclico

Los tiempos de ejecución medidos mediante los contadores del sistema están expresados en **microsegundos ($\mu s$)**.

| Tarea / Índice | NOE | LET [$\mu s$] | BCET [$\mu s$] | WCET [$\mu s$] |
| :--- | :---: | :---: | :---: | :---: |
| `task_dta_list[0]` (task_sensor) | 800636 | 12 | 12 | 14 |
| `task_dta_list[1]` (task_system) | 800636 | 3 | 3 | 152 |
| `task_dta_list[2]` (task_actuator) | 800636 | 2 | 2 | 4 |
| `task_dta_list[3]` (task_display) | 800636 | 2 | 2 | 78 |

### Análisis del Cumplimiento de Restricciones Temporales

- **Período del Ejecutor Cíclico:** $1\text{ ms} = 1000\ \mu s$
- **Suma de Peores Tiempos de Ejecución ($WCET_{\text{total}}$):**
  $$WCET_{\text{total}} = 14\ \mu s + 152\ \mu s + 4\ \mu s + 78\ \mu s = 248\ \mu s$$

**Conclusión:**
Dado que el tiempo total consumido en el peor de los casos ($248\ \mu s$) representa aproximadamente un $24.8\%$ del tiempo total disponible por cada tick ($1000\ \mu s$), el sistema cumple holgadamente con las restricciones temporales del ejecutor cíclico sin riesgo de saturación ni pérdida de ticks.
