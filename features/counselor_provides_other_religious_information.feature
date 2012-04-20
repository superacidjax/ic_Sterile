@http://www.pivotaltracker.com/story/show/4713693 @counselors
Feature: Counselor Provides Other Religious Information
  In order to be connect with patients according to my religious expertise
  As a counselor on the Profile Sign Up page
  I want to provide other religious information

  Scenario:
    Given I have finished step 2 of counselor registration
    When I fill in "Other" with "Flying Spaghetti Monster" in the "I'm familiar with these religion(s)" section
    And I press "Finish Registration"
    Then I should see "Thank you for signing up"
