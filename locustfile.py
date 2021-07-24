from os import environ
from json import JSONDecodeError
from locust import HttpUser, task, between

class Prediction_User(HttpUser):

    wait_time = between(1, 3)

    host = environ.get("PRED_APP_URL", "https://flask-pred-app.azurewebsites.net")

    req_json = {'CHAS': {'0': 0}, \
        'RM': {'0': 6.575}, \
        'TAX': {'0': 296.0}, \
        'PTRATIO': {'0': 15.3}, \
        'B': {'0': 396.9}, \
        'LSTAT': {'0': 4.98}}


    @task
    def request_n_check_prediction(self):
        with self.client.post("/predict", json=self.req_json, catch_response=True) as response:
            try:
                if round(response.json()['prediction'][0] ,2) !=  20.35:
                    response.failure(f"Did not get the expected prediction: {response}")
            except JSONDecodeError:
                response.failure(f"Response could not be decoded as JSON: {response}")
            except KeyError:
                response.failure(f"Response did not have the key 'prediction': {response}")

