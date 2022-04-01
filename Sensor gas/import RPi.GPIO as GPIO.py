import RPi.GPIO as GPIO
import time
# Configuracion de pines conectados desde el Puerto SPI en el ADC al Cobbler
SPICLK = 11
SPIMISO = 9
SPIMOSI = 10
SPICS = 8
mq2_dpin = 26
mq2_apin = 0

#inicializacion
def inicializacion():
    GPIO.setwarnings(False)
    GPIO.cleanup()			    #Limpiar al inicio y al final del script
    GPIO.setmode(GPIO.BCM)		#Especificar el sistema de numeración de pines

    # Configurar los pines de la interfaz SPI
    GPIO.setup(SPIMOSI, GPIO.OUT)
    GPIO.setup(SPIMISO, GPIO.IN)
    GPIO.setup(SPICLK, GPIO.OUT)
    GPIO.setup(SPICS, GPIO.OUT)
    GPIO.setup(mq2_dpin,GPIO.IN,pull_up_down=GPIO.PUD_DOWN)

#leer datos adc por SPI del MCP3008 (o MCP3204)
def leer_adc(num_ADC, pin_reloj, pin_mosi, pin_miso, pin_cs):
    if ((num_ADC > 7) or (num_ADC < 0)):  #8 datos adc posibles
            return -1
    GPIO.output(pin_cs, True)	
    GPIO.output(pin_reloj, False)         #Iniciar reloj en bajo
    GPIO.output(pin_cs, False)            #Pasar CS a bajo
    commandout = num_ADC
    commandout |= 0x18                    #Bit de inicio + bit de un solo extremo
    commandout <<= 3                      #Corriemiento de 3 bits ya que solo se necesita enviar 5 bits
    for i in range(5):
        if (commandout & 0x80):
            GPIO.output(pin_mosi, True)
        else:
            GPIO.output(pin_mosi, False)
        commandout <<= 1
        GPIO.output(pin_reloj, True)
        GPIO.output(pin_reloj, False)
        adcout = 0
    #Leer en un bit vacío, un bit nulo y 10 bits ADC
    for i in range(12):
        GPIO.output(pin_reloj, True)
        GPIO.output(pin_reloj, False)
        adcout <<= 1
        if (GPIO.input(pin_miso)):
            adcout |= 0x1

    GPIO.output(pin_cs, True)
        
    adcout >>= 1         #El primer bit es nulo
    return adcout


#main loop
def main():
    inicializacion()    #Inicializacion del sistema
    print("Por favor esperar...")
    time.sleep(20)
    while True:
        COlevel=leer_adc(mq2_apin, SPICLK, SPIMOSI, SPIMISO, SPICS) #Llamar funcion leer_adc
                                                                    #para leer niver de gas
        if GPIO.input(mq2_dpin):
            print("No fuga de gas")
            time.sleep(0.5)
        else:
            print("Fuga de gas")
            print("Valor de gas actual = ") +str("%.2f"%((COlevel/1024.)*3.3))+" V"
            #print("Valor de gas actual = ") +str("%.2f"%((COlevel/1024.)*3.3))+" V"
            time.sleep(0.5)
if __name__ =='__main__':
    try:
        main()
        pass
    except KeyboardInterrupt:
        pass
GPIO.cleanup()