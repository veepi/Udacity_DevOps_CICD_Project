#!/usr/bin/env bash

if [ "$1" != "" ]; then
   HOSTNAME=$1
else
   HOSTNAME="localhost"
fi

PORT=5000
echo "Host: $HOSTNAME"
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
     -X POST http://$HOSTNAME:$PORT/predict
