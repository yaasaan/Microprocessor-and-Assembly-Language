@ECHO OFF
del "e:\_project\micro\t11\t11.map"
del "e:\_project\micro\t11\labels.tmp"
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "e:\_project\micro\t11\labels.tmp" -fI  -o "e:\_project\micro\t11\t11.hex" -d "e:\_project\micro\t11\t11.obj" -e "e:\_project\micro\t11\t11.eep" -m "e:\_project\micro\t11\t11.map" -W+ie   "E:\_Project\micro\T11\T11.asm"
