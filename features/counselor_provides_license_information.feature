@http://www.pivotaltracker.com/story/show/4713704 @counselors
Feature: Counselor Provides License Information
  In order to be vetted as an iCouch counselor
  As a counselor on the Professional Information Sign Up page
  I want to provide license information

  Background:
    Given I have finished step 1 of counselor registration
    When I choose "Female"
    And I choose "No" in the "Are you currently licensed?" section
    And I choose "No" in the "Has your license ever been suspended" section

  Scenario: no
    When I choose "No" in the "Are you currently licensed?" section
    And I press "Continue Registration"
    Then I should see "Session Preferences"

  Scenario: yes
    When I choose "Yes" in the "Are you currently licensed?" section
    And I press "Continue Registration"
    Then I should see "License number can't be blank"
    And I should see "Licensing authority can't be blank"
    When I fill in "License number" with "7"
    And I fill in "Licensing authority" with "New York"
    And I press "Continue Registration"
    Then I should see "Session Preferences"
