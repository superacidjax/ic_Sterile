@http://www.pivotaltracker.com/story/show/4713662 @clients
Feature: Client Provides Counseling History
  In order to get the most out of a counseling relationship
  As a Client on the Personal Information page
  I want to provide my counseling history

  Scenario:
    Given I have finished step 2 of client registration
    When I choose "Yes" in the "Have you ever had counseling before?" section
    And I choose "Yes" in the "Are you currently seeing a counselor/psychologist/psychiatrist?" section
    And I press "Save and Continue"
    Then I should be on the client_dashboard page
