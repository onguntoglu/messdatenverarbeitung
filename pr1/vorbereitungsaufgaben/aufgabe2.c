#define F_CPU 7372800UL

#include <inttypes.h>
#include <util/delay.h>
#include <avr/io.h>
#include <avr/signature.h>
#include <avr/interrupt.h>


void controlLEDs(uint16_t value){
	if(value >= 0 && value <= 127){
		PORTC |= (1<<PC1) | (1 << PC4) | (1 << PC5);
	}

	else if(value >= 128 && value <= 511){
		PORTC &=  ~((1<<PC1) | (1 << PC4) | (1 << PC5));
		PORTC |= (1 << PC1) | (1 << PC4);
		// PC5 red, turn on red
	}

	else if(value >= 512 && value <= 768){
		PORTC &=  ~((1<<PC1) | (1 << PC4) | (1 << PC5));
		PORTC |= (1 << PC1);
		// PC1 green
		// PC5 red, turn on red and green
	}

	else if(value >= 769 && value <= 1023){
		PORTC &=  ~((1<<PC1) | (1 << PC4) | (1 << PC5));
		// PC4 orange
	}

}


ISR(ADC_vect){
	uint16_t resultADC = ADC; // read ADC
	controlLEDs(resultADC);	
	//ADCSRA |= (1 << ADSC);	
}


void init(void){
	// initialize ADC and IO
	ADMUX |= (0 <<  MUX4) | (0 <<  MUX3) | (0 <<  MUX2) | (0 <<  MUX1) | (0 <<  MUX0); // Single-ended input ADC0
	ADMUX |= (1 << REFS1) | (1 << REFS0); // set internal reference for ADC, 2.56V
	ADCSRA |= (1 << ADEN); // enable ADC
	ADCSRA |= (1 << ADPS2) | (0 << ADPS1) | (1 << ADPS0); // ADC-prescaler set to 1/32
	ADCSRA |= (1 << ADIE); // enable ADC interrupt
	ADCSRA |= (1 << ADATE); // Auto-trigger enabled;
	ADCSRB |= (0 << ADTS2) | (0 << ADTS1) | (0 << ADTS0); // free-running mode enabled
}

int main(void){

	init(); // run func init()
	sei();	// enable global interrupts
	ADCSRA |= (1 << ADSC); // start ADC conversation

	DDRC |= (1<<PC1) | (1 << PC4) | (1 << PC5);

		while(1){
		}
}

