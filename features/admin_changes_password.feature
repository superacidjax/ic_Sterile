Feature: Admin Changes Password
  In order to keep Admin secure
  -- I want to be able to change the admin password as needed.

  Background:
    Given I am signed in as an admin
    And I follow "Change password"

  Scenario: success
    When I fill in "New password" with "newpass"
    And I fill in "Confirm password" with "newpass"
    And I press "Save"
    Then I should see "Password changed successfully"

  Scenario: password and confirmation must match
    When I fill in "New password" with "newpass"
    And I fill in "Confirm password" with "diffpass"
    And I press "Save"
    Then I should see "Password doesn't match confirmation"
    And I should not see "Password changed successfully"

