@http://www.pivotaltracker.com/story/show/4713691 @counselors
Feature: Admin Receives Counselor Application Email
  In order to quickly vet new counselors
  As an Admin
  I want to receive a new counselor notification email

  Scenario: success
    Given the following admins:
      | email            |
      | ken@example.com  |
      | kyle@example.com |
    When I register as a counselor named "Knives Chau"
    Then "ken@example.com" should receive 1 email
    And "kyle@example.com" should receive 1 email
    When I open the email
    Then I should see "Knives Chau is ready for vetting" in the email subject
