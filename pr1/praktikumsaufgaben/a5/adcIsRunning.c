uint8_t adcIsRunning(){
	if (ADSC == 1) {
	return 1;
	}
	else {
	return 0;
	}
}
