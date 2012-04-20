@http://www.pivotaltracker.com/story/show/4713688 @admin
Feature: Admin Signs In
  In order to manage the system
  As an Admin
  I want to sign in

  Background:
    Given the following admin:
      | email    | stacey@example.com |
      | password | whatever           |
    And I am on the homepage
    When I follow "Sign in"

  Scenario: success
    When I fill in "Email" with "stacey@example.com"
    And I fill in "Password" with "whatever"
    And I press "Sign in"
    Then I should see "Signed in successfully"

  Scenario: incorrect password
    When I fill in "Email" with "stacey@example.com"
    And I fill in "Password" with "your hair looks stupid"
    And I press "Sign in"
    Then I should see "Invalid email or password"
