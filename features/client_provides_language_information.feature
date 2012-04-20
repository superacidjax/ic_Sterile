@http://www.pivotaltracker.com/story/show/4713658 @clients
Feature: Client Provides Language Information
  In order to be connect with counselors according to my spoken languages
  As a Client on the Profile Sign Up page
  I want to provide language information

  Scenario:
    Given I have finished step 2 of client registration
    When I check "English" in the "Your counselor should speak" section
    When I check "Spanish" in the "Your counselor should speak" section
    And I press "Save and Continue"
    Then I should be on the client_dashboard page
