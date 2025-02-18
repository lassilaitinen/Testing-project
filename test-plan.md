# Bunnybook Test Plan

## Objectives
The goal of this test plan is to ensure that the Bunnybook application meets its functional requirements and provides a seamless user experience. This plan covers end-to-end testing for critical workflows, ensuring that key functionalities such as registration, login, posting, commenting, and deleting posts work as expected.

---

## Scope of Testing

### **In Scope**
1. **Functional Testing:**
   - Registration: Verifying that a user can successfully register.
   - Login: Validating that a user can log in with correct credentials and receive appropriate error messages for invalid credentials.
   - Posting: Ensuring users can create public and private posts.
   - Commenting: Verifying that users can comment on their own posts and others' posts.
   - Deleting Posts: Confirming that users can delete posts they created.

2. **End-to-End Testing Framework:**
   - **Framework:** Robot Framework with SeleniumLibrary.
   - **Browsers:** Tests will be run using `headlessfirefox` for consistency and ease of integration.
   - **Test Execution Platform:** Local and GitHub Actions for CI/CD pipeline.

3. **Happy Path Testing:** 
   - Covering main user workflows without deviating into edge cases or error handling beyond invalid credentials.

4. **Cross-User Scenarios:**
   - Ensuring interactions between multiple users, such as viewing and commenting on posts.

### **Out of Scope**
1. **Performance Testing:**
   - Load testing of the application.
   - Integration with tools like K6 to simulate high user traffic.

2. **UI Responsiveness and Accessibility:**
   - Testing application behavior on different devices and screen resolutions.

3. **API Integration Testing Improvements:**
   - Comprehensive API test coverage for all endpoints.
   - Improvements for test data handling:
     - Use dynamic fixtures or mocks instead of static data.
     - Automate database cleanup between tests.
   - Test maintainability:
     - Refactor repetitive API test code into reusable functions.
     - Introduce meaningful error messages for failed assertions.

---

## Test Schedule
| **Phase**               | **Activities**                                   | **Duration**    |
|--------------------------|-------------------------------------------------|-----------------|
| Test Planning            | Write the test plan and configure the environment | 1 day           |
| Test Case Development    | Create Robot Framework test cases               | 4 days          |
| Initial Test Execution   | Run tests locally to validate workflows         | 2 day           |
| CI/CD Integration        | Integrate tests into GitHub Actions             | 1 day           |
| Iterative Improvements   | Debug, refine, and stabilize failing tests       | 2 days        |

---

## Framework and Tools
1. **Framework:** Robot Framework with SeleniumLibrary for E2E testing.
2. **CI/CD:** GitHub Actions for automated test execution.
3. **Browsers:** Headless Firefox.
4. **Version Control:** Git for managing test scripts and automation files.

---

## Risks and Mitigations
1. **Risk:** Browser or driver version mismatches in CI/CD.
   - **Mitigation:** Use version pinning and browser setup actions in GitHub workflows.
   
2. **Risk:** Data dependencies causing test failures.
   - **Mitigation:** Use unique test data for each test and clean up database between runs.

3. **Risk:** Flaky tests due to dynamic elements.
   - **Mitigation:** Implement proper waits and dynamic locators.

---

## Improvements for API Integration Tests
1. **Coverage:**
   - Validate response schemas.
   - Add edge case tests (e.g., invalid inputs, unauthorized access).
   - Test token refresh and expiration.

2. **Data Management:**
   - Use dynamic test data.
   - Automate database setup and teardown.
   - Add parameterized tests for diverse inputs.

3. **Error Reporting:**
   - Log detailed failure data.
   - Use tools like Allure for better test reporting.

4. **Maintainability:**
   - Refactor repetitive code.
   - Modularize tests for easy expansion.
   - Use consistent naming and documentation.

---

## Conclusion
This test plan provides a structured approach to verifying the Bunnybook application's core functionalities. While the focus is on happy path tests for essential workflows, future efforts could expand into wider performance testing and enhanced API integration tests to ensure the application is production-ready.
