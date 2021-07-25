setup:
	python3 -m venv ~/.udacity-devops

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	# Tempoarily disabled warnings as the old Flask verion used relies some depreciated features
	python -m pytest --disable-pytest-warnings -vv test_app.py

lint:
	pylint --disable=R,C,W1203,W0702 app.py

loadtest:
	python -m locust -f locustfile.py --headless -u 10 -r 10 --run-time 1m

all: install lint test
