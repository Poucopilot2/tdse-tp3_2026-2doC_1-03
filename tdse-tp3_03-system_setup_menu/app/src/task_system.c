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

#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"
#include "task_display_attribute.h"
#include "task_display_interface.h"
#include "task_system_attribute.h"
#include "task_system_interface.h"

/********************** macros and definitions *******************************/
#define DEL_SYS_MIN			0ul
#define DEL_SYS_MED			250ul
#define DEL_SYS_MAX			500ul

/* Modes to excite Task System */
typedef enum task_system_mode {NORMAL, SETUP, MODE_QTY} task_system_mode_t;

#define SYSTEM_DTA_QTY	MODE_QTY

/********************** internal data declaration ****************************/
task_system_dta_t task_system_dta_list[SYSTEM_DTA_QTY];

/********************** internal functions declaration ***********************/
void task_system_normal_statechart(void);
void task_system_setup_statechart(void);

void task_system_set_mode(task_system_mode_t);

/********************** internal data definition *****************************/
const char *p_task_system 		= "Task System (System Statechart)";
const char *p_task_system_ 		= "Non-Blocking Code";
const char *p_task_system__ 	= "(Update by Time Code, period = 1mS)";

/********************** external data declaration ****************************/
task_system_mode_t g_task_system_mode;

/********************** external functions definition ************************/
void task_system_init(void *parameters)
{
	uint32_t index;
	task_system_dta_t 	*p_task_system_dta;
	task_system_st_t	state;
	task_system_ev_t	event;
	bool b_event;

	/* Print out: Task Initialized */
	LOGGER_INFO(" ");
	LOGGER_INFO("  %s is running - Tick [mS] = %lu", GET_NAME(task_system_init), HAL_GetTick());
	LOGGER_INFO("   %s is a %s", GET_NAME(task_system), p_task_system);
	LOGGER_INFO("   %s is a %s", GET_NAME(task_system), p_task_system_);
	LOGGER_INFO("   %s is a %s", GET_NAME(task_system), p_task_system__);

	init_event_task_system();

	task_system_set_mode(NORMAL);

	for (index = 0; SYSTEM_DTA_QTY > index; index++)
	{
		/* Update Task System Data Pointer */
		p_task_system_dta = &task_system_dta_list[index];

		/* Init & Print out: Task execution FSM */
		state = ST_SYS_IDLE;
		p_task_system_dta->state = state;

		event = EV_SYS_IDLE;
		p_task_system_dta->event = event;

		b_event = false;
		p_task_system_dta->flag = b_event;

		LOGGER_INFO(" ");
		LOGGER_INFO("   %s = %lu   %s = %lu   %s = %s",
					GET_NAME(state), (uint32_t)state,
					GET_NAME(event), (uint32_t)event,
					GET_NAME(b_event), (b_event ? "true" : "false"));
	}

	put_event_task_display(0, 0, "task_system_mode");
	put_event_task_display(0, 1, " NORMAL         ");

	task_system_set_mode(NORMAL);

	task_system_dta_t *p_setup = &task_system_dta_list[SETUP];

		p_setup->state = ST_SYS_MAIN;
		p_setup->motor_index = 0;

		// Valores iniciales de Motor 1
		p_setup->motors[0].power = POWER_ON;
		p_setup->motors[0].speed = 8;
		p_setup->motors[0].spin  = SPIN_LEFT;

		// Valores iniciales de Motor 2
		p_setup->motors[1].power = POWER_ON;
		p_setup->motors[1].speed = 8;
		p_setup->motors[1].spin  = SPIN_LEFT;
}



void task_system_update(void *parameters)
{
	/* Run Task Statechart */
	switch (g_task_system_mode)
	{
		case NORMAL:

			task_system_normal_statechart();

			break;

		case SETUP:

			task_system_setup_statechart();

			break;

		default:

			task_system_set_mode(NORMAL);

			break;
		}
}

void task_system_normal_statechart(void)
{
	task_system_dta_t *p_task_system_dta;

	/* Update Task System Data Pointer */
	p_task_system_dta = &task_system_dta_list[NORMAL];

	if (true == any_event_task_system())
	{
		p_task_system_dta->flag = true;
		p_task_system_dta->event = get_event_task_system();
	}

	switch (p_task_system_dta->state)
	{
		case ST_SYS_IDLE:

			if ((true == p_task_system_dta->flag) && (EV_SYS_BTN_A == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_actuator(EV_LED_ACTIVE, ID_LED_A);
				p_task_system_dta->state = ST_SYS_ACTIVE;

				put_event_task_display(0, 0, "task_system_mode");
				put_event_task_display(0, 1, " SETUP          ");

				task_system_set_mode(SETUP);
			}

			break;

		case ST_SYS_ACTIVE:

			if ((true == p_task_system_dta->flag) && (EV_SYS_IDLE == p_task_system_dta->event))
			{
				p_task_system_dta->flag = false;
				put_event_task_actuator(EV_LED_IDLE, ID_LED_A);
				p_task_system_dta->state = ST_SYS_IDLE;
			}

			break;

		default:

			p_task_system_dta->tick  = DEL_SYS_MIN;
			p_task_system_dta->state = ST_SYS_IDLE;
			p_task_system_dta->event = EV_SYS_IDLE;
			p_task_system_dta->flag = false;

			break;
	}
}

void task_system_setup_statechart(void)
{
    task_system_dta_t *p = &task_system_dta_list[SETUP];
    char line1[17];
    char line2[17];

    if (true == any_event_task_system())
    {
        p->flag = true;
        p->event = get_event_task_system();
    }

    if (!p->flag) return;
    p->flag = false;

    switch (p->state)
    {
        case ST_SYS_MAIN:
            if (p->event == EV_SYS_ENTER)
            {
                p->state = ST_SYS_MOTOR_1;
                p->motor_index = 0;
                put_event_task_display(0, 0, "> Motor 1       ");
                put_event_task_display(0, 1, "  Motor 2       ");
            }
            break;

        case ST_SYS_MOTOR_1:
            if (p->event == EV_SYS_NEXT)
            {
                p->state = ST_SYS_MOTOR_2;
                p->motor_index = 1;
                put_event_task_display(0, 0, "  Motor 1       ");
                put_event_task_display(0, 1, "> Motor 2       ");
            }
            else if (p->event == EV_SYS_ENTER)
            {
                p->state = ST_SYS_POWER;
                put_event_task_display(0, 0, "M1 > Power      ");
                snprintf(line2, sizeof(line2), "     %s        ",
                         p->motors[0].power == POWER_ON ? "ON " : "OFF");
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ESC)
            {
                p->state = ST_SYS_MAIN;
                snprintf(line1, sizeof(line1), "M1:%s,%d,%s     ",
                         p->motors[0].power == POWER_ON ? "ON" : "OFF",
                         p->motors[0].speed,
                         p->motors[0].spin == SPIN_LEFT ? "L" : "R");
                snprintf(line2, sizeof(line2), "M2:%s,%d,%s     ",
                         p->motors[1].power == POWER_ON ? "ON" : "OFF",
                         p->motors[1].speed,
                         p->motors[1].spin == SPIN_LEFT ? "L" : "R");
                put_event_task_display(0, 0, line1);
                put_event_task_display(0, 1, line2);
            }
            break;

        case ST_SYS_MOTOR_2:
            if (p->event == EV_SYS_NEXT)
            {
                p->state = ST_SYS_MOTOR_1;
                p->motor_index = 0;
                put_event_task_display(0, 0, "> Motor 1       ");
                put_event_task_display(0, 1, "  Motor 2       ");
            }
            else if (p->event == EV_SYS_ENTER)
            {
                p->state = ST_SYS_POWER;
                put_event_task_display(0, 0, "M2 > Power      ");
                snprintf(line2, sizeof(line2), "     %s        ",
                         p->motors[1].power == POWER_ON ? "ON " : "OFF");
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ESC)
            {
                p->state = ST_SYS_MAIN;
                snprintf(line1, sizeof(line1), "M1:%s,%d,%s     ",
                         p->motors[0].power == POWER_ON ? "ON" : "OFF",
                         p->motors[0].speed,
                         p->motors[0].spin == SPIN_LEFT ? "L" : "R");
                snprintf(line2, sizeof(line2), "M2:%s,%d,%s     ",
                         p->motors[1].power == POWER_ON ? "ON" : "OFF",
                         p->motors[1].speed,
                         p->motors[1].spin == SPIN_LEFT ? "L" : "R");
                put_event_task_display(0, 0, line1);
                put_event_task_display(0, 1, line2);
            }
            break;

        case ST_SYS_POWER:
            if (p->event == EV_SYS_NEXT)
            {
                p->state = ST_SYS_SPEED;
                snprintf(line1, sizeof(line1), "M%d > Speed      ", p->motor_index + 1);
                snprintf(line2, sizeof(line2), "     %d          ", p->motors[p->motor_index].speed);
                put_event_task_display(0, 0, line1);
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ENTER)
            {
                p->motors[p->motor_index].power = (p->motors[p->motor_index].power == POWER_ON) ? POWER_OFF : POWER_ON;
                snprintf(line2, sizeof(line2), "     %s        ",
                         p->motors[p->motor_index].power == POWER_ON ? "ON " : "OFF");
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ESC)
            {
                p->state = (p->motor_index == 0) ? ST_SYS_MOTOR_1 : ST_SYS_MOTOR_2;
                if (p->motor_index == 0) {
                    put_event_task_display(0, 0, "> Motor 1       ");
                    put_event_task_display(0, 1, "  Motor 2       ");
                } else {
                    put_event_task_display(0, 0, "  Motor 1       ");
                    put_event_task_display(0, 1, "> Motor 2       ");
                }
            }
            break;

        case ST_SYS_SPEED:
            if (p->event == EV_SYS_NEXT)
            {
                p->state = ST_SYS_SPIN;
                snprintf(line1, sizeof(line1), "M%d > Spin       ", p->motor_index + 1);
                snprintf(line2, sizeof(line2), "     %s        ",
                         p->motors[p->motor_index].spin == SPIN_LEFT ? "LEFT " : "RIGHT");
                put_event_task_display(0, 0, line1);
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ENTER)
            {
                p->motors[p->motor_index].speed = (p->motors[p->motor_index].speed + 1) % 10;
                snprintf(line2, sizeof(line2), "     %d          ", p->motors[p->motor_index].speed);
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ESC)
            {
                p->state = (p->motor_index == 0) ? ST_SYS_MOTOR_1 : ST_SYS_MOTOR_2;
                if (p->motor_index == 0) {
                    put_event_task_display(0, 0, "> Motor 1       ");
                    put_event_task_display(0, 1, "  Motor 2       ");
                } else {
                    put_event_task_display(0, 0, "  Motor 1       ");
                    put_event_task_display(0, 1, "> Motor 2       ");
                }
            }
            break;

        case ST_SYS_SPIN:
            if (p->event == EV_SYS_NEXT)
            {
                p->state = ST_SYS_POWER;
                snprintf(line1, sizeof(line1), "M%d > Power      ", p->motor_index + 1);
                snprintf(line2, sizeof(line2), "     %s        ",
                         p->motors[p->motor_index].power == POWER_ON ? "ON " : "OFF");
                put_event_task_display(0, 0, line1);
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ENTER)
            {
                p->motors[p->motor_index].spin = (p->motors[p->motor_index].spin == SPIN_LEFT) ? SPIN_RIGHT : SPIN_LEFT;
                snprintf(line2, sizeof(line2), "     %s        ",
                         p->motors[p->motor_index].spin == SPIN_LEFT ? "LEFT " : "RIGHT");
                put_event_task_display(0, 1, line2);
            }
            else if (p->event == EV_SYS_ESC)
            {
                p->state = (p->motor_index == 0) ? ST_SYS_MOTOR_1 : ST_SYS_MOTOR_2;
                if (p->motor_index == 0) {
                    put_event_task_display(0, 0, "> Motor 1       ");
                    put_event_task_display(0, 1, "  Motor 2       ");
                } else {
                    put_event_task_display(0, 0, "  Motor 1       ");
                    put_event_task_display(0, 1, "> Motor 2       ");
                }
            }
            break;

        default:
            p->state = ST_SYS_MAIN;
            break;
    }
}
void task_system_set_mode(task_system_mode_t task_system_mode)
{
	g_task_system_mode = task_system_mode;
}

/********************** end of file ******************************************/
