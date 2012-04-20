@http://www.pivotaltracker.com/story/show/4713660 @clients
Feature: Client Skips Additional Information On Sign Up
  In order to immediately start using the system
  As a Client on the Profile Sign Up page
  I want to skip the Profile page

  Scenario:
    Given I have finished step 2 of client registration
    When I follow "Skip This"
    Then I should be on the client_dashboard page
