@http://www.pivotaltracker.com/story/show/4713700 @clarify @counselors
Feature: Counselor Provides License Suspension Information
  In order to be vetted as an iCouch counselor
  As a counselor on the Account Sign Up page
  I want to provide license suspension information

  Background:
    Given I have finished step 1 of counselor registration
    When I choose "Female"
    And I choose "No" in the "Are you currently licensed?" section

  Scenario: no
    When I choose "No" in the "Has your license ever been suspended" section
    And I press "Continue Registration"
    Then I should see "Session Preferences"

  Scenario: yes
    When I choose "Yes" in the "Has your license ever been suspended" section
    And I press "Continue Registration"
    Then I should see "License suspension authority can't be blank"
    And I should see "License suspension date can't be blank"
    When I fill in "Licensing authority" with "Toronto" in the "Has your license ever been suspended" section
    And I fill in "Approximate date" with "2/10/2010" in the "Has your license ever been suspended" section
    And I press "Continue Registration"
    Then I should see "Session Preferences"
