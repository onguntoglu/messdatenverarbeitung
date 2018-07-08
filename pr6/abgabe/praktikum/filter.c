/**
 * \addtogroup filter
 *
 * \file filter.c
 * \author Jürgen Funck
 * \date 23-03-2010
 * \brief functions to digitally filter data
 */

#include <avr/interrupt.h>
#include "filter.h"
#include "fifo.h"

/*** GLOBAL VARIABLES ***/
/// buffer for input values (FIFO)
volatile static fifo_t filtInBuf;
/// memory of the input-buffer
volatile static uint8_t filtInBufMem[2*(FILTER_IN_BUF_MASK)];
/// decimation switch
decimState_t decimation;
/// filter coefficients
static int16_t FIRkoeff[FILTER_ORD] = {FIR_COEFF};

/*** FUNCTIONS ***/
void filterInit() {
	//initialise In- and Outputbuffer
	fifoInit(&filtInBuf,  (uint8_t*)filtInBufMem,2*(FILTER_IN_BUF_MASK));
}

int16_t filterIdentity() {
	int16_t val;
	
	decimation 		  = OFF;
	while(fifoPopWord(&filtInBuf, &val));
	return val;
}

uint16_t filterFIR() {
	uint16_t i;
	int32_t accum = 0;
	int16_t val;

	// calculate output values of the filter
	for(i=0; i<FILTER_ORD; i++) {
		if(fifoReadWord(&filtInBuf, FILTER_ORD-(i+1), &val)==0) {
			accum += (((int32_t)FIRkoeff[i]) * val);
		}
	}
	// delete the oldest value from the buffer
	fifoPopWord(&filtInBuf, &val);

	// convert to integer values
	return (accum >> 15);	
}

uint16_t filterFIRDecim() {
if(filterWaitingVals() > 4){
		uint16_t i;
	int32_t accum = 0;
	int16_t val;

	// calculate output values of the filter
	for(i=0; i<FILTER_ORD; i++) {
		if(fifoReadWord(&filtInBuf, FILTER_ORD-(i+1), &val)==0) {
			accum += (((int32_t)FIRkoeff[i]) * val);
		}
	}
	// delete the oldest value from the buffer
	fifoPopWord(&filtInBuf, &val);
	fifoPopWord(&filtInBuf, &val);
	fifoPopWord(&filtInBuf, &val);
	fifoPopWord(&filtInBuf, &val);
	fifoPopWord(&filtInBuf, &val);

	// convert to integer values
	return (accum >> 15);
	}
}

inline uint8_t filterWrite2Buf(int16_t val) {
	return fifoPushWord(&filtInBuf, val);
}

inline uint16_t filterWaitingVals() {
	return fifoBytes(&filtInBuf)/2;
}

void filterReset() {
	fifoClear(&filtInBuf);
}
