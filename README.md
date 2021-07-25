# Overview

This is a project for the Udacity Cloud DevOps course. The objective is to demonstrate cloud-based Continous Integration/Continous Delivery (CI/CD) with a course-provided Python web application. That web appliction will be deployed in Azure as an Azure Web App, with continous integration and delivery through GitHub and Azure Pipelines. 

## Project Plan

* The Trello board for the project could be found here: https://trello.com/b/kzbnPlqm 
* Spreadsheets with the original and final project plans are in the Github repo here: <TODO: Add spreadsheet>

## Instructions

### Architecture - CI/CD setup


<TODO:
* Architectural Diagram (Shows how key parts of the system work)>

### Instructions for running the Python project

<TODO:  Instructions for running the Python project.  How could a user with no context run this project without asking you for any help.  Include screenshots with explicit steps to create that work. Be sure to at least include the following screenshots:

* Project running on Azure App Service

* Project cloned into Azure Cloud Shell

* Passing tests that are displayed after running the `make all` command from the `Makefile`

* Output of a test run

* Successful deploy of the project in Azure Pipelines.  [Note the official documentation should be referred to and double checked as you setup CI/CD](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).

* Running Azure App Service from Azure Pipelines automatic deployment

* Successful prediction from deployed flask app in Azure Cloud Shell.  [Use this file as a template for the deployed prediction](https://github.com/udacity/nd082-Azure-Cloud-DevOps-Starter-Code/blob/master/C2-AgileDevelopmentwithAzure/project/starter_files/flask-sklearn/make_predict_azure_app.sh).
The output should look similar to this:

```bash
udacity@Azure:~$ ./make_predict_azure_app.sh
Port: 443
{"prediction":[20.35373177134412]}
```

* Output of streamed log files from deployed application

> 

## Enhancements

Following are to be considered as future enhancements for this project:

* <TODO: >
* Currently this project uses GitHub for code version control, GitHub Actions for CI, and Azure Pipelines for CD. To simplify the architecture and to remove reliance of muliple platforms, move to either Azure or GitHub as the single version control and CI/CD platform.

## Demo 

A video demonstration of the project is available here: <TODO: Add link Screencast on YouTube>
