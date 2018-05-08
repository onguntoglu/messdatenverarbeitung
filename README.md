# messdatenverarbeitung
MDV-Praktikum Termin 2, 16-18 Uhr

Installation Instructions:

1) Download AVR Studio 4.19:
  https://www.microchip.com/avr-support/avr-and-sam-downloads-archive
  
2) Download AVR-Toolchain:
  https://sourceforge.net/projects/winavr/files/
  - DO NOT install in ProgramFiles or ProgramFiles(x86), Default path C:\ recommended

3) When you create a project in AVR Studio, go to Project -> Configuration Options -> Custom Options
   -> UNCHECK "Use AVR Toolchain"
   
   Manually select avr-gcc under: C:\WinAVR-20100110\bin\avr-gcc.exe
   Manually select make under: C:\WinAVR-20100110\utils\bin\make.exe
   
   More information: https://stackoverflow.com/a/18770622
   
4) Download msys1.0.dll from https://github.com/onguntoglu/messdatenverarbeitung/blob/master/DLL/msys-1.0.dll

5) Paste in the folder: C:\WinAVR-20100110\utils\bin

6) You should now be able to compile, build and debug.
