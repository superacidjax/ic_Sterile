@http://www.pivotaltracker.com/story/show/4713695 @counselors
Feature: Counselor Provides Other Language Information
  In order to be connect with patients according to my spoken languages
  As a counselor on the Profile Sign Up page
  I want to provide other language information

  Scenario:
    Given I have finished step 2 of counselor registration
    When I fill in "Other" with "Pig Latin" in the "I speak these languages" section
    And I press "Finish Registration"
    Then I should see "Thank you for signing up"
