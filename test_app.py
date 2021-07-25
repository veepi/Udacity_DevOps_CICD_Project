import pytest
from app import app

@pytest.fixture
def client():
    return app.test_client()


def test_landing_page(client):    
    rv = client.get('/')    
    assert b"Sklearn Prediction Home" in rv.data


def test_prediction(client):
    req_json = {'CHAS': {'0': 0}, \
        'RM': {'0': 6.575}, \
        'TAX': {'0': 296.0}, \
        'PTRATIO': {'0': 15.3}, \
        'B': {'0': 396.9}, \
        'LSTAT': {'0': 4.98}}
        
    rv = client.post("/predict", json=req_json).get_json()    
    assert round(rv['prediction'][0] ,2) ==  20.35