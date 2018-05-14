/**
 * \addtogroup adc
 *
 * \file adc.c
 * \author Juergen Funck <juergen.funck@tu-berlin.de>
 * \date 2011-03-25
 * ------------------------------------------------------
 * \brief functions to access the adc
 */

#include "adc.h"
#include "filter.h"

/*** GLOBAL VARIABLES ***/

uint32_t counter = 0;
uint32_t sampleCountGlobal = 0;


/*** INTERRUPT ROUTINES ***/
ISR(TIMER1_COMPA_vect) {
}

ISR(TIMER1_COMPB_vect) { 
}

/**
 * \fn ISR(ADC_vect)
 * \author Juergen Funck <juergen.funck@tu-berlin.de>
 * \date 2011-03-25
 * \brief Interrupt-Routine for the ADC-Interrupt. 
 *		  Gets called when an analog-to-digital conversion is complete
 */
ISR(ADC_vect) {

	counter++;

	uint16_t valADC = ADC;		// alternatively read result from ADC
	uint16_t valADC_offset = valADC - 512;
	filterWrite2Buf(valADC_offset);
	
	ADCSRA |= (1 << ADSC);	

	if(counter == sampleCountGlobal){
		ADCSRA |= (0 << ADIE); // ADC-Interrupt turn off
		TCCR1B |= (0 << CS10) | (0 << CS11) | (0 << CS12); // turn off Timer
		counter = 0;
		sampleCountGlobal = 0;	// both set to 0
		cli(); // deactive global interrupts
	}

}

/*** FUNCTIONS ***/
void adcInit() {

	ADMUX |= (1 << REFS1) | (1 << REFS0); // 2.56V reference voltage for ADC
	ADCSRB |= (0 << MUX0) | (0 << MUX1) | (0 << MUX2) | (0 << MUX3) | (0 << MUX4); // select ADC0
	ADCSRA |= (1 << ADATE); // Auto-trigger mdoe enabled
	ADCSRA |= (1 << ADPS2) | (1 << ADPS0); // ADC-prescaler set to 1/32
	ADCSRB |= (1 << ADTS2) | (1 << ADTS0); // Timer/Counter1 Compare-Match set 
	ADCSRA |= (1 << ADIE); // enable ADC
	ADCSRA |= (1 << ADEN); // enable ADC-Interrupt
	//ADCSRA |= (1 << ADSC); // start ADC-conversion

}

void adcStart(uint16_t sampleRateCode, uint32_t sampleCount, trigger_t triggerMode, int16_t triggerLevel) {
	uint32_t sampleCountGlobal = sampleCount;	// global Var for sampleCount
	OCR1A = sampleRateCode;	// set Compare-Match to var sampleRateCode
	TCNT1 = 0;				// start Timer at 0
	TIMSK1 = (1 << OCIE1A) | (1 << OCIE2B); // enable Timer-Compare-Match Interrupt
	TCCR1A = 0; // Output-Compare disable
	TCCR1B |= (1 << CS10); // Timer prescaler set to CPU-clock
	TCCR1B |= (1 << WGM12); // CTC-Modus set
	counter = 0;
	sei();

}

uint8_t adcIsRunning() {
	if (counter == sampleCountGlobal) {
		return 0;
	}
	else {
	return 1;
	}
}
