@http://www.pivotaltracker.com/story/show/4713667 @clients
Feature: Client Signs Up
  In order to find a counselor
  As a client on the landing page
  I want to sign up

  Background:
    Given the following issues:
      | name   |
      | anger  |
      | expat  |
      | abuse  |
      | eating |
      | goals  |
      | crisis |
      | grief  |
    And 2 counselor
    And those counselors collectively specialize in those issues except "grief"

  Scenario: success
    Given I am on the homepage
    And I follow "Get started now!"
    And I fill in "First name" with "Stephen"
    And I fill in "Last name" with "Stills"
    And I select "Canada" from "Country"
    And I select "(GMT-05:00) Eastern Time (US & Canada)" from "Time zone"
    And I fill in "City" with "Toronto"
    And I fill in "State/Province" with "Ontario"
    And I fill in "Zip/Postal" with "M4B 1B3"
    And I fill in "Skype ID" with "my_skype_id"
    And I fill in "Email" with "stephen@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I check "I agree"
    And I press "Finished"
    Then I should see "Welcome, Stephen"
    When I follow "fill out your account settings"
    And I choose "Male"
    And I choose "Single"
    And I choose "Retired"
    And I choose "High school"
    And I press "Save and Continue"
    Then I should see "Anger"
    And I should see "Expat"
    And I should see "Abuse"
    And I should see "Eating"
    And I should see "Goals"
    And I should see "Crisis"
    And I should not see "Grief"
    And I check "English"
    And I press "Save and Continue"
    Then I should be on the client_dashboard page

  Scenario: blank form
    Given I am on the homepage
    And I follow "Get started now!"
    And I press "Finished"
    Then I should see "First name can't be blank"
    And I should see "Last name can't be blank"
    And I should see "Country can't be blank"
    And I should see "Time zone can't be blank"
    And I should see "City can't be blank"
    And I should see "Zip/Postal can't be blank"
    And I should see "Email can't be blank"
    And I should see "Password can't be blank"
    And I should see "must be accepted"
    When I select "France" from "Country"
    And I press "Finished"
    Then I should not see "State/Province can't be blank"
    When I select "United States" from "Country"
    And I press "Finished"
    Then I should see "State/Province can't be blank"
