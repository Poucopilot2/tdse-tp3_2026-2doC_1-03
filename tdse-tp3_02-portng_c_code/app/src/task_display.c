/*
 * Copyright (c) 2026 Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 */

/********************** inclusions *******************************************/
/* Project includes */
#include "main.h"

/* Demo includes */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes */
#include "board.h"
#include "app.h"
#include "task_display_attribute.h"
#include "task_display_interface.h"
#include "display.h"
#include "task_display.h"

/********************** macros and definitions *******************************/
#define DEL_DSP_MIN				0ul
#define DEL_DSP_MED				50ul
#define DEL_DSP_MAX				500ul

/********************** internal data declaration ****************************/
static task_display_dta_t task_display_dta;

/********************** internal functions declaration ***********************/
void task_display_statechart(void);

/********************** internal data definition *****************************/
const char *p_task_display		= "Task Display (Display Statechart)";
const char *p_task_display_		= "Non-Blocking Code";
const char *p_task_display__	= "(Update by Time Code, period = 1mS)";

/********************** external data declaration ****************************/

/********************** external functions definition ************************/
void task_display_init(void *parameters)
{
    // Inicializamos el estado inicial de la máquina
    task_display_dta.state = ST_DSP_IDLE;
    task_display_dta.row = 0;
    task_display_dta.col = 0;
    task_display_dta.ev_update = false;

    // Inicialización del driver del display
    displayInit(DISPLAY_CONNECTION_GPIO_4BITS);
}

void task_display_update(void)
{
    // Esta función es llamada cada 1 ms por el ejecutor cíclico.
    // Cada paso por un case representa el paso del tiempo ("after 1 ms").
    switch (task_display_dta.state) {

        case ST_DSP_IDLE:
            if (task_display_dta.ev_update) {
                task_display_dta.ev_update = false; // Consumimos el evento

                // Transición a ST_DSP_SET_CURSOR_L1
                task_display_dta.state = ST_DSP_SET_CURSOR_L1;

                // Acciones de entry: row = 0; col = 0
                task_display_dta.row = 0;
                task_display_dta.col = 0;
                displayCharPositionWrite(task_display_dta.col, task_display_dta.row);
            }
            break;

        case ST_DSP_SET_CURSOR_L1:
            // Transición "after 1 ms" -> pasa a ST_DSP_WRITE_L1
            task_display_dta.state = ST_DSP_WRITE_L1;

            // Acciones de entry: escribe el carácter y col += 1
            displayDataWrite(task_display_dta.line1[task_display_dta.col]);
            task_display_dta.col++;
            break;

        case ST_DSP_WRITE_L1:
            if (task_display_dta.col < 16) {
                // Transición "after 1 ms [col < 16]" -> reingresa al mismo estado
                displayDataWrite(task_display_dta.line1[task_display_dta.col]);
                task_display_dta.col++;
            } else {
                // Transición "after 1 ms [col >= 16]" -> pasa a ST_DSP_SET_CURSOR_L2
                task_display_dta.state = ST_DSP_SET_CURSOR_L2;

                // Acciones de entry: row = 1; col = 0
                task_display_dta.row = 1;
                task_display_dta.col = 0;
                displayCharPositionWrite(task_display_dta.col, task_display_dta.row);
            }
            break;

        case ST_DSP_SET_CURSOR_L2:
            // Transición "after 1 ms" -> pasa a ST_DSP_WRITE_L2
            task_display_dta.state = ST_DSP_WRITE_L2;

            // Acciones de entry: escribe el carácter y col += 1
            displayDataWrite(task_display_dta.line2[task_display_dta.col]);
            task_display_dta.col++;
            break;

        case ST_DSP_WRITE_L2:
            if (task_display_dta.col < 16) {
                // Transición "after 1 ms [col < 16]" -> reingresa al mismo estado
                displayDataWrite(task_display_dta.line2[task_display_dta.col]);
                task_display_dta.col++;
            } else {
                // Transición "after 1 ms [col >= 16]" -> vuelve a ST_DSP_IDLE
                task_display_dta.state = ST_DSP_IDLE;
            }
            break;

        default:
            task_display_dta.state = ST_DSP_IDLE;
            break;
    }
}


/********************** end of file ******************************************/
