@http://www.pivotaltracker.com/story/show/12164123 @clients
Feature: Client edits account information
  In order to keep my information current
  As a client
  I want to edit my account information

  Background:
    Given I am signed in as the following client:
      | first_name | Barry                  |
      | last_name  | Zuckerkorn             |
      | email      | zuckerkorn@example.com |
      | password   | password               |
    When I follow "My account"

  Scenario:
    When I fill in "First name" with "Bob"
    And I fill in "Last name" with "Loblaw"
    And I fill in "Skype ID" with "bob_loblaw"
    And I select "Canada" from "Country"
    And I select "(GMT-05:00) Eastern Time (US & Canada)" from "Time zone"
    And I fill in "City" with "Toronto"
    And I fill in "State/Province" with "Ontario"
    And I fill in "Zip/Postal" with "M4B 1B3"
    And I fill in "Email" with "lawblog@example.com"
    And I press "Save"
    Then I should see "Successfully updated your account."

  Scenario: new password
    When I fill in "Password" with "newpassword"
    When I fill in "Password confirmation" with "newpassword"
    And I press "Save"
    And I follow "Sign out"
    And I follow "Sign in"
    And I fill in "Email" with "zuckerkorn@example.com"
    And I fill in "Password" with "newpassword"
    And I press "Sign in"
    Then I should see "Signed in successfully"

  Scenario: validation errors
    When I fill in "First name" with ""
    And I fill in "Last name" with ""
    And I fill in "Email" with ""
    And I press "Save"
    Then I should see "First name can't be blank"
    And I should see "Last name can't be blank"
    And I should see "Email can't be blank"
