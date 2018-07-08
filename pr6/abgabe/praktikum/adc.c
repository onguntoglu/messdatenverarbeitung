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
 volatile uint32_t adc_value_counter = 0;
 volatile uint32_t adc_sampleCount = 0;
 //volatile uint8_t adc_stop_flag = 1; 

/*** INTERRUPT ROUTINES ***/
ISR(TIMER1_COMPA_vect) 
{

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
ISR(ADC_vect) 
{
	adc_value_counter++;
	int16_t x;
	x=ADC-512;
	filterWrite2Buf(x);
		if(adc_sampleCount==adc_value_counter)
		{
			ADCSRA &= ~(1<<ADIE);
			TCCR1B =0;
			
		}
}

/*** FUNCTIONS ***/
void adcInit() {
	cli();
	ADMUX = (1<<REFS1) | (1<<REFS0);//Referentspannung waehlen
	//ADC0 bereits eingang im single-ended-mode
	ADCSRA = (1<<ADPS2) | (1<<ADPS0);//ADU Takt=CPU_takt/32
	//free-running ist auch bereits an
	ADCSRA |= (1<<ADIE);//interrupenable
	ADCSRA |= (1<<ADEN);//ADU einschalten
	ADCSRA |= (1<<ADATE);
	ADCSRB |= (1<<ADTS2) | (1<<ADTS0);
	TCCR1B = 0;
	sei();
}

void adcStart(uint16_t sampleRateCode, uint32_t sampleCount, trigger_t triggerMode, int16_t triggerLevel) {
	cli();
	OCR1A= sampleRateCode;
	OCR1B= sampleRateCode>>2 ;
	adc_sampleCount = sampleCount;
	adc_value_counter = 0;
	TCNT1  = 0;
	// Timer  s t a r t e t  bei  0
	TIMSK1 |= (1<<OCIE1A ) | (1<<OCIE1B) ;
	TCCR1A = 0;
	TCCR1B |= (1<<WGM12) | (1<<CS10);
	ADCSRA |= (1<<ADIE);
	sei();
}

uint8_t adcIsRunning() {

		if(adc_sampleCount==adc_value_counter)
		{
		return 0;
		}

	return 1;
}
