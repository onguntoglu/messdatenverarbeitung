/*

*/

void adcStart(uint16_t sampleRateCode, uint32_t sampleCode, trigger_t triggerMode, int16_t triggerLevel){
	TCCR1B |= (1 << CS10); // Timer prescaler set to CPU-clock
	TCCR1B |= (1 << WGM12); // CTC-Modus set
		
}
