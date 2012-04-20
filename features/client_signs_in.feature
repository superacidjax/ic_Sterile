@http://www.pivotaltracker.com/story/show/4713737 @clients
Feature: Client Signs In
  In order to get counseling remotely
  As a Client on the landing page
  I want to sign in

  Background:
    Given the following client:
      | email    | julie@example.com |
      | password | whatever          |
    And I am on the homepage
    Then I should see "For Counselors"
    When I follow "Sign in"

  Scenario: success
    When I fill in "Email" with "julie@example.com"
    And I fill in "Password" with "whatever"
    And I press "Sign in"
    Then I should see "Signed in successfully"
    But I should not see "For Counselors"

  Scenario: incorrect password
    When I fill in "Email" with "julie@example.com"
    And I fill in "Password" with "your hair looks stupid"
    And I press "Sign in"
    Then I should see "Invalid email or password"
