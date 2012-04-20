@http://www.pivotaltracker.com/story/show/4870487
Feature: User Chooses Remember Me On Sign In
  In order to save time signing in to the application
  As any registered User on the sign in page
  I want the system to remember my sign in information on my computer

  Background:
    Given the following client:
      | first name | Wallace             |
      | last name  | Wells               |
      | email      | wallace@example.com |
      | password   | password            |
    And I am on the homepage
    When I follow "Sign in"
    And I fill in "Email" with "wallace@example.com"
    And I fill in "Password" with "password"

  Scenario: checked
    When I check "Remember me"
    And I press "Sign in"
    Then I should see "Welcome, Wallace"
    When my browser is closed and reopened
    And I go to the homepage
    Then I should see "Welcome, Wallace"

  Scenario: unchecked
    When I press "Sign in"
    Then I should see "Welcome, Wallace"
    When my browser is closed and reopened
    And I go to the homepage
    Then I should not see "Welcome, Wallace"
