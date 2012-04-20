@http://www.pivotaltracker.com/story/show/4713663 @clients
Feature: Client Provides Emergency Contact On Sign Up
  In order to enable my counselor to contact me in an emergency
  As a Client on the Personal Information page
  I want to provide my emergency contact information

  Background:
    Given the following issues:
      | name      |
      | Abuse     |
      | Addiction |

  Scenario: success
    Given I have finished step 2 of client registration
    When I fill in "Emergency contact name" with "Ramona Flowers"
    And I fill in "Emergency contact phone number" with "212 664 7665"
    And I fill in "Emergency contact relationship" with "Our bass player's girlfriend"
    And I check "I give permission"
    And I press "Save and Continue"
    Then I should be on the client_dashboard page


  # TODO: BRIAN: update test with desired funcationality
  @wip
  Scenario: with missing fields
    Given I have finished step 2 of client registration
    When I fill in "Emergency contact name" with "Ramona Flowers"
    And I press "Save and Continue"
    Then I should see "Phone number can't be blank"
    And I should see "Relationship can't be blank"
    And I should see "must be accepted"
    When I fill in "Name" with ""
    And I fill in "Emergency contact phone number" with "212 664 7665"
    And I fill in "Emergency contact relationship" with "Our bass player's girlfriend"
    And I check "I give permission"
    And I press "Save and Continue"
    Then I should see "Name can't be blank"
