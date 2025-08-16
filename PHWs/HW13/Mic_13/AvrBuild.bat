@ECHO OFF
del "e:\_project\micro\t13\t13.map"
del "e:\_project\micro\t13\labels.tmp"
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "e:\_project\micro\t13\labels.tmp" -fI  -o "e:\_project\micro\t13\t13.hex" -d "e:\_project\micro\t13\t13.obj" -e "e:\_project\micro\t13\t13.eep" -m "e:\_project\micro\t13\t13.map" -W+ie   "E:\_Project\micro\T13\T13.asm"
