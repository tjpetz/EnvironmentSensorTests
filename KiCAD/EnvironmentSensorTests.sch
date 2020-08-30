EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "Environment Sensor Test"
Date "2020-08-28"
Rev "v01"
Comp ""
Comment1 ""
Comment2 "creativecommons.org/licenses/by/4.0/"
Comment3 "License: CC BY 4.0"
Comment4 "Author: Thomas J. Petz, Jr."
$EndDescr
NoConn ~ 4350 3750
NoConn ~ 4350 3850
NoConn ~ 4350 4050
NoConn ~ 4350 4150
NoConn ~ 4350 4250
NoConn ~ 4350 4350
NoConn ~ 4350 4450
NoConn ~ 4350 4550
NoConn ~ 4350 4650
NoConn ~ 4350 4750
NoConn ~ 4350 4850
NoConn ~ 4350 4950
NoConn ~ 4350 5050
NoConn ~ 5350 4150
Wire Wire Line
	5850 4750 5850 3850
Wire Wire Line
	5850 3850 6200 3850
Wire Wire Line
	5950 4850 5950 3750
Wire Wire Line
	5950 3750 6200 3750
$Comp
L power:GND #PWR01
U 1 1 5F49E358
P 3400 4400
F 0 "#PWR01" H 3400 4150 50  0001 C CNN
F 1 "GND" H 3405 4227 50  0000 C CNN
F 2 "" H 3400 4400 50  0001 C CNN
F 3 "" H 3400 4400 50  0001 C CNN
	1    3400 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F49EAEE
P 4850 5650
F 0 "#PWR02" H 4850 5400 50  0001 C CNN
F 1 "GND" H 4855 5477 50  0000 C CNN
F 2 "" H 4850 5650 50  0001 C CNN
F 3 "" H 4850 5650 50  0001 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F49F28C
P 6550 4350
F 0 "#PWR03" H 6550 4100 50  0001 C CNN
F 1 "GND" H 6555 4177 50  0000 C CNN
F 2 "" H 6550 4350 50  0001 C CNN
F 3 "" H 6550 4350 50  0001 C CNN
	1    6550 4350
	1    0    0    -1  
$EndComp
NoConn ~ 4950 3350
NoConn ~ 5350 3750
NoConn ~ 5350 3850
NoConn ~ 5350 4350
NoConn ~ 5350 4450
NoConn ~ 5350 4550
NoConn ~ 5350 4650
NoConn ~ 5350 4950
NoConn ~ 5350 5050
NoConn ~ 4950 5350
NoConn ~ 4650 3350
Wire Wire Line
	3400 3100 3400 3500
Wire Wire Line
	6550 3100 6550 3550
Wire Wire Line
	6550 4250 6550 4350
Wire Wire Line
	4850 5350 4850 5650
Wire Wire Line
	6200 3950 6100 3950
Wire Wire Line
	6100 4050 6200 4050
NoConn ~ 6850 4000
NoConn ~ 6850 3800
Wire Wire Line
	8000 3550 8000 3100
Wire Wire Line
	8000 3100 6550 3100
Connection ~ 6550 3100
$Comp
L power:GND #PWR04
U 1 1 5F49C197
P 8000 4400
F 0 "#PWR04" H 8000 4150 50  0001 C CNN
F 1 "GND" H 8005 4227 50  0000 C CNN
F 2 "" H 8000 4400 50  0001 C CNN
F 3 "" H 8000 4400 50  0001 C CNN
	1    8000 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4250 8000 4400
Wire Wire Line
	7400 4750 7400 4000
Wire Wire Line
	7400 4000 7650 4000
Wire Wire Line
	5350 4750 5850 4750
Connection ~ 5850 4750
Wire Wire Line
	5850 4750 7400 4750
Wire Wire Line
	7500 4850 7500 3800
Wire Wire Line
	7500 3800 7650 3800
Wire Wire Line
	5350 4850 5950 4850
Connection ~ 5950 4850
Wire Wire Line
	5950 4850 7500 4850
Text Notes 4100 2800 0    50   ~ 0
Nano 33 BLE Sense is powered by USB.
Text Notes 950  1250 0    50   ~ 0
The purpose of this circuit is to allow a comparison of the humidty and temperature sensors between the on-board HTS-221, an Analog Devices ADT7410 Temperature Sensor and a DHT-11 temperature and humidity sensor.
NoConn ~ 6100 3950
NoConn ~ 6100 4050
Wire Wire Line
	3800 3850 4000 3850
Wire Wire Line
	4000 3850 4000 3950
Wire Wire Line
	4000 3950 4350 3950
Wire Wire Line
	3400 4150 3400 4400
$Comp
L zzzMyParts:Arduino_Nano_33 A2
U 1 1 5F4C3453
P 4850 4350
F 0 "A2" H 4500 5350 50  0000 C CNN
F 1 "Arduino_Nano_33" H 5350 3400 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 5400 5300 50  0001 C CIN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 4850 4350 50  0001 C CNN
	1    4850 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 3100 4800 3100
Wire Wire Line
	4800 3350 4800 3100
Connection ~ 4800 3100
Wire Wire Line
	4800 3100 6550 3100
$Comp
L zzzMyParts:DHT-11_Board A?
U 1 1 5F4C3D8C
P 3650 3800
F 0 "A?" H 4178 3821 50  0000 L CNN
F 1 "DHT-11_Board" H 4178 3730 50  0000 L CNN
F 2 "" H 3650 3800 50  0001 C CNN
F 3 "" H 3650 3800 50  0001 C CNN
	1    3650 3800
	-1   0    0    -1  
$EndComp
$Comp
L zzzMyParts:AdaFruit_ADT7410_Board A?
U 1 1 5F4C550F
P 6350 3900
F 0 "A?" H 6525 4431 50  0000 C CNN
F 1 "AdaFruit_ADT7410_Board" H 6525 4340 50  0000 C CNN
F 2 "" H 6350 3900 50  0001 C CNN
F 3 "" H 6350 3900 50  0001 C CNN
	1    6350 3900
	1    0    0    -1  
$EndComp
$Comp
L zzzMyParts:SSD1306_128x64_OLED A?
U 1 1 5F4C654E
P 7850 3850
F 0 "A?" H 8278 3846 50  0000 L CNN
F 1 "SSD1306_128x64_OLED" H 8278 3755 50  0000 L CNN
F 2 "" H 7850 3850 50  0001 C CNN
F 3 "" H 7850 3850 50  0001 C CNN
	1    7850 3850
	1    0    0    -1  
$EndComp
$EndSCHEMATC
