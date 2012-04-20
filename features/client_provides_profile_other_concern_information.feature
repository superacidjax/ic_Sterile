@http://www.pivotaltracker.com/story/show/4713659 @clients
Feature: Client Provides Profile Other Concern Information
  In order to be connect with counselors according to my concerns
  As a client on the Profile Sign Up page
  I want to provide other concerns

  Scenario:
    Given I have finished step 2 of client registration
    When I fill in "Other" with "Eviction" in the "What are your concerns?" section
    And I press "Save and Continue"
    Then I should be on the client_dashboard page
