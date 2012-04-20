@http://www.pivotaltracker.com/story/show/4713681 @admin
Feature: Admin Rejects New Counselor
  In order to allow new counselors to work through iCouch
  As an Admin on the counselor details page
  I want to reject a new counselor

  Scenario: success
    Given the following counselor:
      | first name | Ramona    |
      | status     | submitted |
    And I am signed in as an admin
    When I follow "Counselors"
    And I follow "Ramona"
    And I press "Reject"
    Then I should see "Rejected" in the "Ramona" row
    When I follow "Ramona"
    Then I should see "Rejected"
