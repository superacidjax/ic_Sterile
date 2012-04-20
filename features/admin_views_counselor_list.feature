@http://www.pivotaltracker.com/story/show/4713687 @admin
Feature: Admin Views Counselor List
  In order to vet new counselors
  As an Admin that is signed in
  I want to view the counselors list

  Scenario: success
    Given the following counselors:
      | first name | last name | email               | status  |
      | Matthew    | Patel     | matthew@example.com | pending |
      | Lucas      | Lee       | lucas@example.com   | active  |
    And I am signed in as an admin
    When I follow "Counselors"
    Then I should see the following table:
      | Name          | Email               | Status  |
      | Lucas Lee     | lucas@example.com   | Active  |
      | Matthew Patel | matthew@example.com | Pending |
