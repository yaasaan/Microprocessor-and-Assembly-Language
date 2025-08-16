@ECHO OFF
del "e:\_project\micro\t10\t10.map"
del "e:\_project\micro\t10\labels.tmp"
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "e:\_project\micro\t10\labels.tmp" -fI  -o "e:\_project\micro\t10\t10.hex" -d "e:\_project\micro\t10\t10.obj" -e "e:\_project\micro\t10\t10.eep" -m "e:\_project\micro\t10\t10.map" -W+ie   "E:\_Project\micro\T10\T10.asm"
