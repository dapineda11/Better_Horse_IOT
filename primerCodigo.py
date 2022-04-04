#!/usr/bin/python3
#librerias
import sys
import time
import Adafruit_DHT as dht
from hx711 import HX711
import RPi.GPIO as GPIO
import paho.mqtt.publish as pub
import ssl
#configuracion de thinkspeak, id y api key para escribir la información
channel_id = "1679940"
api_key = "0AP2LJWIQYJTV7TH"
#pagina a la cual se enviará las mediciones 
mqtt_host = "mqtt.thingspeak.com"
#protocolo de envio mqtt para las mediciones 
tTransport = "websockets"
tPort = 443
tTLS = {'ca_certs':"/etc/ssl/certs/ca-certificates.crt",'tls_version':ssl.PROTOCOL_TLSv1}

topic = "channels/" + channel_id + "/publish/" + api_key

# Configuracion de pines conectados desde el Puerto SPI en el ADC al Cobbler (Sensor de gas)
SPICLK = 11
SPIMISO = 9
SPIMOSI = 10
SPICS = 8
mq2_dpin = 26
mq2_apin = 0
sensor = dht.DHT11
#Configuración de pines de sensor de temperatura y celda de carga
pin = 4
hx = HX711(5, 6)
#Calibración celda de carga 
hx.set_reference_unit(508)
hx.reset()
hx.tare()



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

#funcion para leer datos adc por SPI del MCP3008
def leer_adc(num_ADC, pin_reloj, pin_mosi, pin_miso, pin_cs):
    if ((num_ADC > 7) or (num_ADC < 0)):  #8 datos adc posibles (Solo se hace por proteccion)
        return -1
    GPIO.output(pin_cs, True)	            #Iniciar CS en alto para evitar errores
    GPIO.output(pin_reloj, False)           #Iniciar reloj en bajo
    GPIO.output(pin_cs, False)              #Pasar CS a bajo para iniciar con la comunicacion SPI
    commandout = num_ADC                    #Se iguala el commandout al numero del canal de ADC
    commandout |= 0x18                      #Bit de inicio + bit de un solo extremo
    commandout <<= 3                        #Corrimiento de 3 bits ya que solo se necesita enviar 5 bits
    for i in range(5):                  #loop para configurar bit de start, Single/Diff, D2, D1 y D0
        if (commandout & 0x80):             #Configuracion de envio Din para config ADC(01000)
            GPIO.output(pin_mosi, True)     #Señal Din en alto
        else:
            GPIO.output(pin_mosi, False)    #Señal Din en bajo
        commandout <<= 1                    #corrimiento de 1 bit a la izquierda
        GPIO.output(pin_reloj, True)        
        GPIO.output(pin_reloj, False)       #Cambio de señal del reloj para avanzar con la comunicacion SPI
    adcout = 0
    for i in range(12):                 #Leer un bit vacío, 10 bits ADC y un bit nulo
        GPIO.output(pin_reloj, True)        
        GPIO.output(pin_reloj, False)       #Cambio de señal del reloj para avanzar con la comunicacion SPI
        adcout <<= 1                        #corrimiento de 1 bit a la izquierda
        if (GPIO.input(pin_miso)):          #Lectura 10 bits del ADC
            adcout |= 0x1                   

    GPIO.output(pin_cs, True)               #Pasar CS a alto para finalizar la comunicacion SPI
    adcout >>= 1                            #El primer bit es nulo
    return adcout
#main loop
def Sensor_gas():
    COlevel=leer_adc(mq2_apin, SPICLK, SPIMOSI, SPIMISO, SPICS) #Llamar funcion leer_adc 
                                                                #para leer niver de gas.
    if GPIO.input(mq2_dpin):                                    #Lectura de la salida 
        print("No fuga de gas")                                 #digital del sensor.
        time.sleep(0.5)
    else:
        print("Fuga de gas")                                    #Imprimir gas o no gas y valor
        print("Valor de gas actual = ") +str("%.2f"%((COlevel/1024.)*5))+" V"
        time.sleep(0.5)


#bucle infinito para la medicion constante de nuestros sensores
inicializacion()    #Inicializacion del sistema Sensor gas
while True:
    peso = hx.get_weight(5)
    humedad, temperatura = dht.read_retry(sensor, pin)
    Sensor_gas()
    print("Peso: ", peso)
    print("humedad: ", humedad)
    print("temperatura: ", temperatura)

    enviando = "field1=" + str(temperatura) + "&field2=" + str(humedad) + "&field3=" + str(peso)

    pub.single(topic, payload = enviando, hostname = mqtt_host , port = tPort, tls = tTLS, transport = tTransport)
        
    time.sleep(1)