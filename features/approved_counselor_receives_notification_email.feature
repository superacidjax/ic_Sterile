@http://www.pivotaltracker.com/story/show/4713683 @counselors
Feature: Approved Counselor Receives Notification Email
  In order to know I am approved to use the system
  As an Approved Counselor
  I want to receive a notification email

  Scenario: success
    Given the following counselor:
      | first name | Ramona             |
      | email      | ramona@example.com |
      | status     | submitted          |
    And I am signed in as an admin
    When I follow "Counselors"
    And I follow "Ramona"
    And I press "Approve"
    Then "ramona@example.com" should receive 1 email
    When I open the email
    Then I should see "Ramona" in the email body
