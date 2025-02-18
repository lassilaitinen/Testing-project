## Quick start
#### Requirements
- OS: Linux, macOS, Windows 
- Install Docker (https://docs.docker.com/install/)
- (Linux only) Install docker-compose (https://docs.docker.com/compose/install/)


#### Install Robot Framework and deploy Bunnybook on your local machine
Open a shell and clone this repository:  
`git clone https://github.com/pietrobassi/bunnybook.git`  

Navigate inside project root folder:  
`cd bunnybook`  

Install Robot Framework:

`pip install robotframework`

Install Selenium: 

`pip install --upgrade robotframework-seleniumlibrary`

Start all services:  
`docker-compose up`  

After some time (first execution might be slow), open Chrome or Firefox and navigate to:  
http://localhost

Remember to add e2e-tests, github/workflows and performance_test folders to bunnybook folder to be able to run tests and workflows. 

After all services started open new window in terminal and go to e2e folder. Then execute `robot .` to run all e2e tests.


