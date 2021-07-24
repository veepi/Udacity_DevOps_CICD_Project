#!/usr/bin/env bash

# setup and install dependenceis
make setup
source ~/.udacity-devops/bin/activate
make install

# create the Azure web app 
az webapp up -n flask-pred-app

# execute the test script that uses the deployed webapp
./make_predict_azure_app.sh

# run a locust load test for 1 minute
python -m locust -f locustfile.py --headless -u 10 -r 10 --run-time 1m