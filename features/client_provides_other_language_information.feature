@http://www.pivotaltracker.com/story/show/4713657 @clients
Feature: Client Provides Other Language Information
  In order to be connect with counselors according to my spoken languages
  As a client on the Profile Sign Up page
  I want to provide other language information

  Scenario:
    Given I have finished step 2 of client registration
    When I fill in "Other" with "Pig latin, Elvish" in the "Your counselor should speak" section
    And I press "Save and Continue"
    Then I should be on the client_dashboard page
