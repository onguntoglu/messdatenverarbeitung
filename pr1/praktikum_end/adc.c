/**
 * \addtogroup adc
 *
 * \file adc.c
 * \author Marjan Chowdhury, Onur Akdemir, Ongun Türkcüoglu, Serdar Gareayaghi
 * \date 19-05-2018
 * ------------------------------------------------------
 * \brief functions to access the adc - MDV Praktikum 1, Termin 2
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

ISR(ADC_vect) {

	counter++;

	uint16_t valADC = ADC;		// read result from ADC
	uint16_t valADC_offset = valADC - 512; // offset of 512 bits
	filterWrite2Buf(valADC_offset);	 // pass variable to the function

	if(counter == sampleCountGlobal){
		ADCSRA &= ~(1 << ADIE); // ADC-Interrupt turn off
		TCCR1B &= ~((1 << CS10) | (1 << CS11) | (1 << CS12)); // turn off Timer
		counter = 0;
		sampleCountGlobal = 0;	// both variables set to 0
	}

}

/*** FUNCTIONS ***/
void adcInit() {
	cli();
	ADMUX |= (1 << REFS1) | (1 << REFS0); // 2.56V reference voltage for ADC
	ADCSRB |= (0 << MUX0) | (0 << MUX1) | (0 << MUX2) | (0 << MUX3) | (0 << MUX4); // select ADC0
	ADCSRA |= (1 << ADATE); // Auto-trigger mdoe enabled
	ADCSRA |= (1 << ADPS2) | (1 << ADPS0); // ADC-prescaler set to 1/32
	ADCSRB |= (1 << ADTS2) | (1 << ADTS0); // Timer/Counter1 Compare-Match set 
	ADCSRA |= (1 << ADIE); // enable ADC
	ADCSRA |= (1 << ADEN); // enable ADC-Interrupt
	//ADCSRA |= (1 << ADSC); // start ADC-conversion
	sei();

}

void adcStart(uint16_t sampleRateCode, uint32_t sampleCount, trigger_t triggerMode, int16_t triggerLevel) {
	cli();
	uint32_t sampleCountGlobal = sampleCount;	// global Var for sampleCount
	OCR1A = sampleRateCode;	// set Compare-Match to var sampleRateCode
	TCNT1 = 0;				// start Timer at 0
	TIMSK1 = (1 << OCIE1A) | (1 << OCIE1B); // enable Timer-Compare-Match Interrupt
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
