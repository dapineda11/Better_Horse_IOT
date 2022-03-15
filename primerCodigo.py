#!/usr/bin/python3
#librerias prueba sebastian
#jejejejjee
import pyrebase
import sys
import time
import Adafruit_DHT as dht
from hx711 import HX711
EMULATE_HX711=False
#para calibrar la celda de carga
referenceUnit = 1
#pines para la salida de la celda de carga
hx = HX711(5, 6)
#formato de lectura y lectura de la celda de carga
hx.set_reading_format("MSB", "MSB")
hx.set_reference_unit(referenceUnit)
hx.reset()
hx.tare()
#funcion de limpieza en caso de una interrupcion o finalización de la medición
def cleanAndExit():
    print("Cleaning...")

    if not EMULATE_HX711:
        GPIO.cleanup()

    print("Bye!")
    sys.exit()
# configuracion para enviar datos a firebase
config = {
  "apiKey": "78oVm42tikAkxoZR7n5PammmWgoHY9Hxgnr0m2WO",
  "authDomain": "iot3s-d11fa.firebaseapp.com",
  "databaseURL": "https://iot3s-d11fa-default-rtdb.firebaseio.com",
  "storageBucket": "iot3s-d11fa.appspot.com"
}
#Configuracion del databse a crear
firebase = pyrebase.initialize_app(config)
db = firebase.database()

#bucle infinito para la medicion constante de nuestros sensores
while True:
    try:
        val = hx.get_weight(5)
        print("peso :", val)

        hx.power_down()
        hx.power_up()
        time.sleep(0.1)
    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()

    sensor = dht.DHT11
    pin = 4
    humedad, temperatura = dht.read_retry(sensor, pin)
    #diccionario para crear el database en firebase
    data = {
    "Humedad": humedad,
    "Temperatura": temperatura,
    "Peso": val
    }

    print("humedad: ", humedad)
    print("temperatura: ", temperatura)

    #se agregan los datos a firebase del diccionario data
    db.child("DHT11").child("1-set").set(data)
    db.child("DHT11").child("2-push").push(data)
    time.sleep(1)