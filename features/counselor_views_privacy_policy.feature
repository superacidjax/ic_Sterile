@http://www.pivotaltracker.com/story/show/4713708 @counselors
Feature: Counselor Views Privacy Policy
  In order to feel good about the security of my information on iCouch
  As a Counselor on the Account Sign Up page
  I want to view the privacy policy

  Scenario: counselor
    Given I am on the new counselor account page
    When I follow "Privacy Policy"
    Then I should see "Here's our privacy policy:"

  Scenario: client
    Given I am on the new client account page
    When I follow "Privacy Policy"
    Then I should see "Here's our privacy policy:"
