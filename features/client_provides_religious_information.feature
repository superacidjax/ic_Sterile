@http://www.pivotaltracker.com/story/show/4713656 @clients
Feature: Client Provides Religious Information
  In order to be connect with counselors according to my religious expertise
  As a Client on the Profile Sign Up page
  I want to provide religious information

  Scenario:
    Given I have finished step 2 of client registration
    When I check "Catholicism" in the "You would prefer a counselor familiar with the following" section
    And I press "Save and Continue"
    Then I should be on the client_dashboard page
