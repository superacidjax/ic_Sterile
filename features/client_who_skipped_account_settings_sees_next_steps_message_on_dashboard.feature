@http://www.pivotaltracker.com/story/show/4713734 @clients
Feature: Client Who Skipped Account Settings Sees Next Steps Message On Dashboard
  In order to connect with a counselor
  As a Client on my dashboard who skipped account settings on sign up
  I want to see a message with information on next steps

  Background:
    Given I have finished step 1 of client registration
    When I go to the homepage

  Scenario: fill out my account settings
    Then I should see "fill out your account settings"
    When I follow "fill out your account settings"
    Then I should see "Personal Information"
    And I should not see "Thanks, your account is now active"
    When I choose "Male" in the "Gender" section
    And I choose "Single" in the "Relationship status" section
    And I choose "In school" in the "Employment status" section
    And I choose "Some college" in the "Education" section
    And I press "Save"
    Then I should be on the edit client account additional information page
    And I should not see "fill out your account settings"
