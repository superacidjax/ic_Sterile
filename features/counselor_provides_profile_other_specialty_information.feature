@http://www.pivotaltracker.com/story/show/4713697 @counselors
Feature: Counselor Provides Profile Other Specialty Information
  In order to be connect with patients according to my specialties
  As a counselor on the Profile Sign Up page
  I want to provide other specialty information

  Scenario:
    Given I have finished step 2 of counselor registration
    When I fill in "Other" with "Skating" in the "I specialize in" section
    And I press "Finish Registration"
    Then I should see "Thank you for signing up"
