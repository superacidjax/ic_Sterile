@http://www.pivotaltracker.com/story/show/4713664 @clients
Feature: Client Skips Personal Information On Sign Up
  In order to immediately start using the system
  As a Client on the Personal Information Sign Up page
  I want to skip the Personal Information page

  Scenario:
    Given the following issues:
      | name | Anxiety |
    And I have finished step 1 of client registration
    When I follow "Skip This"
    And I press "Save and Continue"
    Then I should be on the client_dashboard page
