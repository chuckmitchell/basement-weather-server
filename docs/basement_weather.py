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
api = twitter.Api(consumer_key="QeT4mgIqGqAi6y7sKEgkcR8HQ",
                  consumer_secret="zM2dFpIk3YojKBdlZOwTCC82tEP3RxffLZG6MQJQwTBeckG8Pk",
                  access_token_key="771330006068830209-4QTn99ThbM6V2DT0hxlNymQOLykbmMM",
                  access_token_secret="akoFlkoNgov5aDJrmkCJTtSqQgvs2Q2Phl0rjVgVjh9Zi")

status = api.PostUpdate(message+" "+date)
print "%s just posted: %s" % (status.user.name, status.text)