# Overview

This project was prepared for the Udacity Cloud DevOps course. The objective is to demonstrate cloud-based Continous Integration/Continous Delivery (CI/CD) with a course-provided Python web application. That web appliction will be deployed in Azure as an Azure Web App, with continous integration and delivery through GitHub and Azure Pipelines.

### Build status: 

![Build workflow status](https://github.com/veepi/Udacity_DevOps_CICD_Project/actions/workflows/main.yml/badge.svg)


## Project Plan

* The Trello board for the project could be found here: https://trello.com/b/kzbnPlqm 
* Spreadsheets with the original and final project plans are in the Github repo here: <TODO: Add spreadsheet>

---

## Instructions

### Architecture 

#### System overview:
* The program 'Flask Prediction App' is a web application that implements a Web API to obtain housing price predictions.
* It implements an API method named `predict` that takes a JSON payload and returns a JSON response.
* The application is developed in Python 3 with Flask web application toolkit.
* The web applicaiton is deployed in the cloud using Azure App Services (PaaS) service.
* The source code is maintained in GitHub.
* GitHub Actions is used for continous integration, build and to run tests implmeneted with pytest.
* Azure Pipelines service is used for continous integration, build and deploy to Aure App Services.
  
#### CI/CD setup:
* The following architectural diagram shows how key parts of the system works to enable CI/CD for this project.
  
  ![DevOps architecture](./docs/Architecture%20Diagram.png)

### Instructions for installing and running the program

#### Cloning the repo and installing the application:
To begin in a fresh Azure environment, follow these steps:

* Login to Azure portal, and open Azure Cloud Shell. Otherwise, login to your local development workstation. 
* Once the shell has loaded, clone this GitHub repo with `git clone git@github.com:veepi/Udacity_DevOps_CICD_Project.git` as shown in the following image:
   ![Cloning the project in Azure Cloud Shell](./docs/Repo%20clones%20in%20AZ.png)

* Run `make setup` to create the virtual environment.
* Activate the Python virtual environment with `source ~/.udacity-devops/bin/activate`
* Install dependencies with `make install`.
  
  ![Setting up the python project](./docs/Make%20setup%20and%20install.png)

* To lint, run `make lint`. * To run the unit tests, run `make test`. 
* Note that install, lint and test steps could be executed with `make all`. The following screenshot shows the output from that command.
  
    ![Excuting the pytest with make test](./docs/make%20all%20output.png)

#### To test the code locally:

* To test the code locally, run the program with `python app.py`.
* Open another terminal window, and the `make_prediction.sh` bash script. The image below shows the expected output.
  
  ![Output from a test on local development environment](./docs/5-3%20Testing%20that%20the%20Azure%20webpp%20is%20working%20-%202.png)

* Load test can be run with `make loadtest`. That command starts a headless test that runs for 1 minutes.
* Locust can be run with web GUI for an interactive load test. Example ouput shown below.
  
  ![Load testing in GUI on webapp](./docs/Load%20testing%20with%20locust%20on%20webapp.png)

#### Deploying the app on Azure App Services through Azure Cloud Shell:

* To deploy the python web app on Azure App Services, run `az webapp up -n flask-pred-app`. Here, the name of the application is 'flask-pred-app'. This step is shown in the image below.
  
  ![Deploying via Azure Cloud Shell](./docs/5-2%20Creating%20Azure%20webapp.png)

#### Automatic deployment with Azure Pipelines:

* Azure Pipelines could be configured build and deploy the application whenever it detects a change to the source code in GitHub. [The official documentation on how to setup that from Microsoft is available here](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).
* In summary, createa new pipeline in Azure DevOps and link it to this GitHub repo (This GitHub repository has Azure Pipelines integration enabled).
* The pipeline configuration is available in the [YAML file](./azure-pipelines.yml).
* Once configured, Azure pipeline will be tridggered by a commit to the main branch of this GitHub repo. It will automaitcally build and deploy the web application. The following image shows the expected output in Azure Pipelines when a build and deployment workflow is successful.

  ![Running Azure App Service from Azure Pipelines automatic deployment](./docs/Azure%20Pipelines%20-%20Successful%20build%20and%20deploy.png)

#### Testing the Azure WebApp

* To test the web application, run the `make_predict_azure_app.sh` script in either Azure Cloud Shell, or an internet connected local workstation. The output should look similar to this:
  ![make_predict_azure_app output in AZ CS](./docs/make_predict_azure%20via%20AZ%20CS.png)

#### Viewing web logs of the Azure WebApp.

* The logs of the deployed web app can be streamed with the `az webapp logs tail` command (in Azure Cloud Shell, or in locally if azure cli is installed). Following image shows the command and example ouput from this app when a request is received.
![Output of streamed log files from deployed application](./docs/webapp%20logs%20livestream.png)

---

## Enhancements

Following are to be considered as future enhancements for this project.
* Currently this project uses GitHub for code version control, GitHub Actions for CI, and Azure Pipelines for CD. To simplify the architecture and to remove reliance of muliple platforms, move to either Azure or GitHub as the single version control and CI/CD platform.
* Deployment workflow could be improved to automatically deploy to testing/staging environemnts, and then to production in a controlled manner with Azure Pipeline Gates.

---

## Demo 

A video demonstration of the project is available here: <TODO: Add link Screencast on YouTube>
