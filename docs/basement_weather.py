#!/usr/bin/python
import sys
import commands
import Adafruit_DHT
import twitter
import requests
import json

date = commands.getoutput('TZ=":Canada/Atlantic" date')

#Get temp and humidity
humidity, temperature = Adafruit_DHT.read_retry(11, 4)
message = 'Temp: {0:0.1f} C  Humidity: {1:0.1f} %'.format(temperature, humidity)


#send to basementweather API
url = 'https://basementweather.herokuapp.com/readings.json'
payload = {'temperature': '{0:0.1f}'.format(temperature), 'humidity': '{0:0.1f}'.format(humidity)}
headers = {'content-type': 'application/json'}
r = requests.post(url, data=json.dumps(payload), headers=headers)

#send to twitter
api = twitter.Api(consumer_key="",
                  consumer_secret="",
                  access_token_key="",
                  access_token_secret="")

status = api.PostUpdate(message+" "+date)
print "%s just posted: %s" % (status.user.name, status.text)