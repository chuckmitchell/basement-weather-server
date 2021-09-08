#!/usr/bin/python
import sys
import subprocess
import Adafruit_DHT
# import twitter
import requests
import json
from decimal import Decimal

w1TempFileName = "/sys/bus/w1/devices/28-0116005b3fff/w1_slave"
bw_url = 'https://basementweather.herokuapp.com/readings.json'
date = subprocess.getoutput('TZ=":Canada/Atlantic" date')

#Get temp and humidity
#humidity, temperature = Adafruit_DHT.read_retry(11, 4)
#message = 'Temp: {0:0.1f} C  Humidity: {1:0.1f} %'.format(temperature, humidity)


#send to basementweather API
def post_to_bw_api(url, amb_temperature, humidity, probe_temperature):
  payload = {'temperature': '{0:0.1f}'.format(amb_temperature), 'humidity': '{0:0.1f}'.format(humidity), 'probe1_temperature': '{0:0.1f}'.format(probe_temperature)}
  headers = {'content-type': 'application/json'}
  r = requests.post(url, data=json.dumps(payload), headers=headers)
  return;

#send to twitter
#api = twitter.Api(consumer_key="",
#                  consumer_secret="",
#                  access_token_key="",
#                  access_token_secret="")

#status = api.PostUpdate(message+" "+date)
#print "%s just posted: %s" % (status.user.name, status.text)

def read_temp_probe():
  with open(w1TempFileName, 'r') as tempDataFile:
    tempData = tempDataFile.read()
  temp = tempData.split()[-1][2:] #Split the file contents into a list. Temp is the last element, trim off the first 2 characters.
  return float(float(temp)/1000.00);

probe_temp = read_temp_probe()
humidity, temperature = Adafruit_DHT.read_retry(22, 6)

if humidity is not None and temperature is not None:
  # probe_temp = 0.0

  output_string = 'Temp: {0:0.1f} C  Humidity: {1:0.1f} % Probe temp: {2:0.1f} C'.format(temperature, humidity, probe_temp)  
  print(output_string)
  post_to_bw_api(bw_url, temperature, humidity, probe_temp)
else:
  print('Failed to get reading. Try again!')
sys.exit(1)



