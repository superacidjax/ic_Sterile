@http://www.pivotaltracker.com/story/show/4713712 @counselors
Feature: Counselor Signs Up
  In order to counsel remote patients
  As a counselor on the landing page
  I want to sign up as a counselor

  Background:
    Given I am on the homepage
    When I follow "For Counselors"
    And I follow "Sign up now!"

  Scenario: success
    When I fill in "First name" with "Ramona"
    And I fill in "Last name" with "Flowers"
    And I select "Canada" from "Country"
    And I select "(GMT-05:00) Eastern Time (US & Canada)" from "Time zone"
    And I fill in "Phone number" with "212 664 7665"
    And I fill in "Skype ID" with "my_skype_id"
    And I fill in "City" with "Toronto"
    And I fill in "State/Province" with "Ontario"
    And I fill in "Zip/Postal" with "M4B 1B3"
    And I fill in "Email" with "ramona@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I check "I agree"
    And I press "Continue Registration"
    Then I should be on the new_counselor_account_professional_information page

  Scenario: blank form
    When I press "Continue Registration"
    Then I should see "First name can't be blank"
    And I should see "Last name can't be blank"
    And I should see "Country can't be blank"
    And I should see "Time zone can't be blank"
    And I should see "City can't be blank"
    And I should see "Zip/Postal can't be blank"
    And I should see "Email can't be blank"
    And I should see "Password can't be blank"
    And I should see "must be accepted"
    And I should see "Skype ID can't be blank"

  Scenario: cancel
    When I follow "Cancel"
    Then I should be on the homepage
