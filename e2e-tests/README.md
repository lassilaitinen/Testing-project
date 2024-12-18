![GHA workflow badge](https://github.com/lassilaitinen/bunnybook/actions/workflows/main.yml/badge.svg)

# Testing guidelines
This guide explains how to execute the tests in this project.

## 1. Deploy the app to your computer
#### This part includes the same guidelines about getting the app than the original app.

You need to have Docker installed: (https://docs.docker.com/install/)

Open a shell and clone this repository:  
`git clone https://github.com/pietrobassi/bunnybook.git`  

Navigate inside project root folder:  
`cd bunnybook`  

Start all services:  
`docker compose up`  

After some time (first execution might be slow), open Chrome or Firefox and navigate to:  
http://localhost 

## 2. Implement the testing environment

#### 2.1. Install Python

Open new shell and install Python by following these guidelines: https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#python-installation

#### 2.2. Install the Robot Framework

After installing Python, install Robot framework with following instructions:

Open shell, go to the root folder of the project and run commands:

Install Robot Framework:
`pip install robotframework`

Verify the installation:
`robot --version`

#### 2.3. Add tests

In this folder are folder named 'e2e-tests' and '.github'. Add these (or the whole zip-folder) to the project, into the root folder. Now the app includes the tests.

## 3. Run tests

Tests should be found in the 'e2e-tests'- folder of the project. In the root folder of the project, run the following command to run tests:
`robot e2e-tests`

Note that in order to run the tests, you need to execute the `docker compose up` command in one shell, and in other shell you can execute the tests. This is because the app needs to be running if you want to execute the tests. The CI-pipeline runs 'smoke'-tagged tests in every push, and all tests daily.