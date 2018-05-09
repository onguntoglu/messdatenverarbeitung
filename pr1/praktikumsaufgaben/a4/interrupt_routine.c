ISR(ADC_vect){
	counter++;

	uint8_t theLowADC = ADCL; // first 8 bits from ADCL
	uint16_t theTenBitResults = (ADCH << 8) | theLowADC; // 2 more bits to achieve values up to 1023
	uint16_t valADC = ADC;		// alternatively read result from ADC
	int16_t offsetResult = 	theTenBitResults - 512;
	uint16_t valADC_offset = valADC - 512;
	filterWrite2Buff(valADC_offset);
	
	ADCSRA |= (1 << ADSC);	

	if(counter == sampleCountGlobal){
		ADCSRA |= (0 << ADIE); // ADC-Interrupt turn off
		TCCR1B |= (0 << CS10) | (0 << CS11) | (0 << CS12); // turn off Timer
		counter = 0;
		sampleCountGlobal = 0;	// both set to 0
		cli(); // deactive global interrupts
	}
	
}
