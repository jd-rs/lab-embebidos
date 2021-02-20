from grove_rgb_lcd import *
import time
import grovepi
from grovepi import *
import math

button = 4 # Port for button
sensor = 0 # Port for sensor (Analog 0)

pinMode(button, "INPUT") # Assign mode for button as input

while True:
    try:
        button_status = digitalRead(button) # Read the button status
        if button_status: # The button is in HIGH position
            setRGB(0,255,0) # Set LCD background to Green
            temp = grovepi.temp(sensor, '1.1')
            print("temp=", temp)
            setText("Temp =" + str(int(temp)) + " C")
            time.sleep(.5)  
        else: # The button is in OFF position
            setRGB(255, 0,0) # Set LCD background to red
            setText("Presiona el\n boton")
    except (IOError, TypeError) as e:
        print("Error")