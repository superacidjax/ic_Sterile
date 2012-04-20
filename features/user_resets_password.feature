@http://www.pivotaltracker.com/story/show/4870578
Feature: User Resets Password
  In order to get back in the system when I have forgotten my password
  As a User on the sign in page
  I want to reset my password

  - click forgot password
  - I am taken to the reset password page
  - provide email
  - click reset password
  - I receive an email with a reset password link
  - click the reset password link
  - I am taken to the new password page
  - provide
  -- password
  -- password confirmation
  - click save
  - I am taken to my dashboard
  - my password is changed

  Scenario:
    Given the following client:
      | email    | wallace@example.com |
    And I am on the homepage
    When I follow "Sign in"
    And I follow "Forgot password"
    And I fill in "Email" with "wallace@example.com"
    And I press "Retrieve Password"
    Then "wallace@example.com" should receive 1 email
    When I open the email
    And I follow the first link in the email
    And I fill in "Password" with "whatever"
    And I fill in "Password confirmation" with "whatever"
    And I press "Change My Password"
    Then I should see "Your password was changed successfully. You are now signed in."
