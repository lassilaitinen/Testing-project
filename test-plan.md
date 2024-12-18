# Test Plan for Bunnybook App

## Introduction
Bunnybook is a small-scale social media application. The user can register and log in to the application. After logging in, the user can create posts, view posts from other users and comment posts. Also deleting self-written posts is something user can do.

## Approach
The testing of the Bunnybook application will be started by getting familiar with the application and its functionalities. This includes using the app and exploring functionalities which should be tested. The possibly identified issues and bugs in the application will be reported in seperate markdown-files. The project will be stored in GitHub.

The second part is to write the end-to-end tests using user stories. The goal is to cover the main functionalities of the application. After writign the end-to-end tests, the continous integration (CI) pipeline will be set up. After settung up a working CI-pipeline with working e2e-tests, the CI-pipeline will be extended by adding non-functional tests. CI-pipeline will execute all tests daily, and after every push to GitHub only 'smoke'-tagged test will be run.

## Resources
The testing project will be done by one tester, who plans, writes and executes the testing and the process as a whole. The tester is able to commit a few hours per day to this process. The tester has also other commitments, which can result as a longer process for this project. 

## Tools
In end-to-end testing, the Robot Framework is used to test the main functionalities. The continuous integration (CI) pipeline will be done using GitHub Actions. The non-functional test will be done by using k6 -tests.

## Scope
### In-scope
The main functionalities of the applications are within the scope of testing. These main functionalities are the base for user stories and include following features:
- logging in and out
- user registaration
- creating public and restrictered visibility posts
- user deleting own posts
- user commenting own posts and other users posts
- user viewing public post by other user

### Out-scope
Other functionalities in the app are out of the scope, such as these following features:
- searching other users and posts
- online/offline friend status
- notifications
- chat with all its functionalities, such as converstations history
- profile picture creation
- friend requests and suggestions

The app has also some API tests, which are not included in this testing project. The API tests should be improved by adding more functionalities to be tested, for example by testing the notifications and testing the chat functionality. Another way to improve the API testing is to include it to the CI-pipeline, so possible errors can be seen right away.

These are all important features if the app reaches production. However, these are not the main functionalities. The app can be used without testing these features, but in production these functionalities should also be tested, alongside the API tests. 

## Schedule of Intended Testing Activities
The whole testing process is intended to be done within a two weeks from the start of the process.