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

#ifndef TASK_SYSTEM_ATTRIBUTE_H_
#define TASK_SYSTEM_ATTRIBUTE_H_

/********************** CPP guard ********************************************/
#ifdef __cplusplus
extern "C" {
#endif

/********************** inclusions *******************************************/

/********************** macros ***********************************************/

/********************** typedef **********************************************/
/* Events to excite Task System */
typedef enum task_system_ev {EV_SYS_IDLE,
							 EV_SYS_BTN_A,
							 EV_SYS_ENTER,
							 EV_SYS_NEXT,
							 EV_SYS_ESC} task_system_ev_t;

/* State of Task System */
typedef enum task_system_st {ST_SYS_IDLE,
							 ST_SYS_ACTIVE,
							 ST_SYS_MAIN,
							 ST_SYS_MOTOR_1,
							 ST_SYS_MOTOR_2,
							 ST_SYS_POWER,
							 ST_SYS_SPEED,
							 ST_SYS_SPIN,
							 ST_SYS_CFG_POWER,
							 ST_SYS_CFG_SPEED,
							 ST_SYS_CFG_SPIN} task_system_st_t;




typedef enum { POWER_OFF, POWER_ON} motor_power_t;
typedef enum { SPIN_LEFT, SPIN_RIGHT} motor_spin_t;

typedef struct {
    motor_power_t power;
    uint8_t       speed; // 0 a 9
    motor_spin_t  spin;
} motor_config_t;

typedef struct {
    uint32_t         tick;
    task_system_st_t state;
    task_system_ev_t event;
    bool             flag;

    // Variables internas del menú
    uint8_t        motor_index;       // 0 = Motor 1, 1 = Motor 2
    motor_config_t motors[2];         // Configuración [0]: Motor 1, [1]: Motor 2
} task_system_dta_t;

/********************** external data declaration ****************************/
extern task_system_dta_t task_system_dta_list[];

/********************** external functions declaration ***********************/

/********************** End of CPP guard *************************************/
#ifdef __cplusplus
}
#endif

#endif /* TASK_SYSTEM_ATTRIBUTE_H_ */

/********************** end of file ******************************************/
