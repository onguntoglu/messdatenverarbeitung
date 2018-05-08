#define F_CPU 7372800UL

#include <inttypes.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/signature.h>
#include <avr/interrupt.h>


void controlLEDs(uint16_t value){
	if(value <= 0 && value <= 127){
		
	}

	else if(value <= 128 && value <= 511){

	}

	else if(value <= 128 && value <= 511){

	}

	else if(value <= 128 && value <= 511){

	}

}


ISR(ADC_vect){
	uint8_t theLowADC = ADCL; // first 8 bits from ADCL
	uint16_t theTenBitResults = (ADCH << 8) | theLowADC; // 2 more bits to achieve values up to 1023
	controlLEDs(theTenBitResults);	
	ADCSRA |= (1 << ADSC);	
}


void init(void){
	// initialize ADC and IO
	ADMUX |= (0 <<  MUX4) | (0 <<  MUX3) | (0 <<  MUX2) | (0 <<  MUX1) | (0 <<  MUX0); // Single-ended input ADC0
	ADMUX |= (1 << REFS1) | (1 << REFS0); // set internal reference for ADC, 2.56V
	ADCSRA |= (1 << ADEN); // enable ADC
	ADCSRA |= (1 << ADPS2) | (0 << ADPS1) | (1 << ADPS0); // ADC-prescaler set to 1/32
	ADCSRA |= (1 << ADIE); // enable ADC interrupt
}

int main(void){

	init(); // run func init()
	sei();	// enable global interrupts
	ADCSRA |= (1 << ADSC); // start ADC conversation
		while(1){
		}
}

