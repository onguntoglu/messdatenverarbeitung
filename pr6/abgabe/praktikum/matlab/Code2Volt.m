function voltage = Code2Volt(code, adu_steigung, adu_offset)

voltage = (code - adu_offset)/adu_steigung;

end