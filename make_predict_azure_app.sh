#!/usr/bin/env bash

if [ "$1" != "" ]; then
   APP_NAME=$1
else
   APP_NAME="flask-pred-app"
fi

PORT=443
echo "App name: $APP_NAME"
echo "Port: $PORT"


# POST method predict
curl -d '{
   "CHAS":{
      "0":0
   },
   "RM":{
      "0":6.575
   },
   "TAX":{
      "0":296.0
   },
   "PTRATIO":{
      "0":15.3
   },
   "B":{
      "0":396.9
   },
   "LSTAT":{
      "0":4.98
   }
}'\
     -H "Content-Type: application/json" \
     -X POST https://$APP_NAME.azurewebsites.net:$PORT/predict 
     #your application name <yourappname>goes here