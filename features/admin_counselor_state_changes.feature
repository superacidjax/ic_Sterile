Feature: Admin changes the state of a counselor
  In order to manage the state of a counselor
  As an Admin on the counselor details page
  I want to be able to:
  -approve, reject, disapprove, reapprove
  as I need.

  Background:
    Given the following counselor:
      | first name | Ramona    |
      | last name  | Flowers   |
      | status     | submitted |
    And I am signed in as an admin
    And I follow "Counselors"
    And I follow "Ramona Flowers"

  Scenario: new counselor approval
    When I press "Approve Counselor"
    Then I should see "Active" in the "Ramona" row

    When I follow "Ramona Flowers"
    And I press "Deactivate Counselor"
    Then I should see "Deactivated" in the "Ramona" row

    When I follow "Ramona Flowers"
    And I press "Reactivate Counselor"
    Then I should see "Active" in the "Ramona" row


  Scenario: new counselor rejection
    When I press "Reject Counselor"
    Then I should see "Rejected" in the "Ramona" row

    When I follow "Ramona Flowers"
    And I press "Approve Counselor"
    Then I should see "Active" in the "Ramona" row
