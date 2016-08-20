COMPILER = avr-gcc
MCU = atmega328p
PORT=/dev/ttyUSB0
OBJCOPY = avr-objcopy
CFLAGS = -Os
BAUDRATE = 57600

program: compile
	avrdude -F -V -c arduino -p $(MCU) -P $(PORT) -b $(BAUDRATE) -U flash:w:Blink_led.hex

compile: Blink_led.elf
	$(OBJCOPY) -O ihex -R .eeprom Blink_led.elf Blink_led.hex

Blink_led.elf: Blink_led.c
	$(COMPILER) -mmcu=$(MCU) -Wall $(CFLAGS) -o Blink_led.elf Blink_led.c

clean:
	rm -f Blink_led.elf Blink_led.hex