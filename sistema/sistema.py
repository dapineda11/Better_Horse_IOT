#!/usr/bin/python3
#librerias
import sys
import time
from datetime import datetime
import Adafruit_DHT as dht
from hx711 import HX711
import RPi.GPIO as GPIO
import paho.mqtt.publish as pub
import json
import requests

SPICLK = 11
SPIMISO = 9
SPIMOSI = 10
SPICS = 8
mq2_dpin = 26
mq2_apin = 0

def servooo():
    consulta = requests.get("https://thingspeak.com/channels/1744196/feeds.json?results=1")
    data = consulta.json()
    temp = data["feeds"][0]["field1"]
    print(temp)
    if int(temp) == 1:
        p.start(4)
        p.ChangeDutyCycle(8.5)
        time.sleep(0.5)
        p.ChangeDutyCycle(5.5)
        time.sleep(0.5)
        p.ChangeDutyCycle(0)
#read SPI data from MCP3008 chip,8 possible adc's (0 thru 7)
def readadc(adcnum, clockpin, mosipin, misopin, cspin):
        if ((adcnum > 7) or (adcnum < 0)):
                return -1
        GPIO.output(cspin, True)	

        GPIO.output(clockpin, False)  # start clock low
        GPIO.output(cspin, False)     # bring CS low

        commandout = adcnum
        commandout |= 0x18  # start bit + single-ended bit
        commandout <<= 3    # we only need to send 5 bits here
        for i in range(5):
                if (commandout & 0x80):
                        GPIO.output(mosipin, True)
                else:
                        GPIO.output(mosipin, False)
                commandout <<= 1
                GPIO.output(clockpin, True)
                GPIO.output(clockpin, False)

        adcout = 0
        # read in one empty bit, one null bit and 10 ADC bits
        for i in range(12):
                GPIO.output(clockpin, True)
                GPIO.output(clockpin, False)
                adcout <<= 1
                if (GPIO.input(misopin)):
                        adcout |= 0x1

        GPIO.output(cspin, True)

        adcout >>= 1       # first bit is 'null' so drop it
        return adcout

channel_id = "1743612"
channel_id_servo = "1744196"

mqtt_host = "mqtt3.thingspeak.com"
mqtt_client_id = "MSg6KCQREzUWNzwRKRsJAjM"
mqtt_username = "MSg6KCQREzUWNzwRKRsJAjM"
mqtt_password = "yIkkpwLAglzwPhuQPqWXJhNd"


tTransport = "websockets"
tPort = 80
topic ="channels/" + channel_id + "/publish"
topic_servo ="channels/" + channel_id_servo + "/publish"


fecha = datetime.now()

hx = HX711(5, 6)
hx.set_reading_format("MSB", "MSB")
hx.set_reference_unit(210)
hx.reset()
hx.tare()
servoPIN = 17

GPIO.setup(servoPIN, GPIO.OUT)
p = GPIO.PWM(servoPIN, 50) # GPIO 17 for PWM with 50Hz"""

cont = 5
#bucle infinito para la medicion constante de nuestros sensores
while True:
    #if cont >= 5:
     #   cont = 0
    servooo()
    consulta = requests.get("https://thingspeak.com/channels/1744196/feeds.json?results=1")
    data = consulta.json()
    temp = data["feeds"][0]["field1"]
    #cont = cont + 1
    peso = hx.get_weight(5)
    humedad, temperatura = dht.read_retry(dht.DHT11, 4)
    COlevel=readadc(mq2_apin, SPICLK, SPIMOSI, SPIMISO, SPICS)
    print("Peso: ", peso)
    print("humedad: ", humedad)
    print("temperatura: ", temperatura)
    if GPIO.input(mq2_dpin):
        print("Gas not leak")
        gasss = 0
        time.sleep(0.5)
    else:
        print("Gas leakage")
        print("Poncentaje de meta = " +str((COlevel*100)/1024)+" %")
        time.sleep(0.5)
        gasss = (COlevel*100)/1024

    enviando = "field1=" + str(temperatura) + "&field2=" + str(humedad) + "&field3=" + str(peso) + "&field4=" + str(gasss) + "&field5=" + str(fecha) + "&field6=" + str(1)
    enviar = "field1=" + str(0)
    
    try :
        pub.single(topic, enviando, hostname = mqtt_host ,transport = tTransport, port = tPort, client_id = mqtt_client_id, auth = {'username':mqtt_username, 'password': mqtt_password})
    except (KeyboardInterrupt):
        break
    except:
       print("interupcion")
       
    if int(temp) == 1:
        try :
            pub.single(topic_servo, enviar, hostname = mqtt_host ,transport = tTransport, port = tPort, client_id = mqtt_client_id, auth = {'username':mqtt_username, 'password': mqtt_password})
        except (KeyboardInterrupt):
            break
        except:
           print("interupcion")
           
    

    time.sleep(1)