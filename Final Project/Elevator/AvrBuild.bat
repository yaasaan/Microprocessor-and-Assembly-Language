@ECHO OFF
del "d:\other\elevator\elevator.map"
del "d:\other\elevator\labels.tmp"
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "d:\other\elevator\labels.tmp" -fI  -o "d:\other\elevator\elevator.hex" -d "d:\other\elevator\elevator.obj" -e "d:\other\elevator\elevator.eep" -m "d:\other\elevator\elevator.map" -W+ie   "D:\Other\Elevator\Elevator.asm"
