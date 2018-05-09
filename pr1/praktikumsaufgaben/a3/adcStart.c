/*

*/

void adcStart(uint16_t sampleRateCode, uint32_t sampleCount, trigger_t triggerMode, int16_t triggerLevel){
	uint32_t sampleCountGlobal = sampleCount;	// global Var for sampleCount
	OCR1A = sampleRateCode;	// set Compare-Match to var sampleRateCode
	TCTN1 = 0;				// start Timer at 0
	TIMSK1 = (1 << OCIE1A) | (1 << OCIE2A); // enable Timer-Compare-Match Interrupt
	TCCR1A = 0; // Output-Compare disable
	TCCR1B |= (1 << CS10); // Timer prescaler set to CPU-clock
	TCCR1B |= (1 << WGM12); // CTC-Modus set
			
}
