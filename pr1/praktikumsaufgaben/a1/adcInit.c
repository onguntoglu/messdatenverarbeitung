/*
* brief initializes the ADC
* authors 
* date of implementation 09-05-2018
*/
void adcInit(){
	ADMUX |= (1 << REFS1) | (1 << REFS0); // 2.56V reference voltage for ADC
	ADCSRB |= (0 << MUX0) | ( << MUX1) | (0 << MUX2) | (0 << MUX3) | (0 << MUX4); // select ADC0
	ADCSRA |= (1 << ADATE); // Auto-trigger mdoe enabled
	ADCSRA |= (1 << ADPS2) | (1 << ADPS0); // ADC-prescaler set to 1/32
	ADCSRB |= (1 << ADTS2) | (1 << ADTS0); // Timer/Counter1 Compare-Match set 
}
