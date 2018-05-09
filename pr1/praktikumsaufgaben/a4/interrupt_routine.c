ISR(ADC_vect){
	uint8_t theLowADC = ADCL; // first 8 bits from ADCL
	uint16_t theTenBitResults = (ADCH << 8) | theLowADC; // 2 more bits to achieve values up to 1023
	int16_t offsetResult = 	theTenBitResults - 512;
	filterWrite2Buff(offsetResult);
	
	ADCSRA |= (1 << ADSC);	
}
