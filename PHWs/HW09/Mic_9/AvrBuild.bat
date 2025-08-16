@ECHO OFF
del "e:\_project\micro\t9\t9.map"
del "e:\_project\micro\t9\labels.tmp"
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "e:\_project\micro\t9\labels.tmp" -fI  -o "e:\_project\micro\t9\t9.hex" -d "e:\_project\micro\t9\t9.obj" -e "e:\_project\micro\t9\t9.eep" -m "e:\_project\micro\t9\t9.map" -W+ie   "E:\_Project\micro\T9\T9.asm"
