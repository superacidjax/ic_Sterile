@http://www.pivotaltracker.com/story/show/4713706 @counselors @javascript
Feature: Counselor Provides Professional Information
  In order to be vetted as an iCouch counselor
  As a counselor on the Account Sign Up page
  I want to provide my professional information

  Background:
    Given I am on the homepage
    And I follow "For Counselors"
    And I follow "Sign up now!"
    And I fill out step 1 of counselor registration
    And the following issues:
      | name  |
      | Abuse |
      | Anger |

  Scenario: success
    When I press "Continue Registration"
    #Then I should not see "EIN/SS#"
    When I choose "No" in the "Are you currently licensed?" section
    And I choose "No" in the "Has your license ever been suspended" section
    And I choose "Female"
    And I fill in "University" with "University of Toronto" in the "Undergraduate" section
    And I fill in "Degree" with "Psychology" in the "Undergraduate" section
    And I fill in "University" with "University of Toronto" in the "Graduate" section
    And I fill in "Degree" with "Psychosis" in the "Graduate" section
    And I fill in "University" with "University of Toronto" in the "Doctoral" section
    And I fill in "Degree" with "Psychopathy" in the "Doctoral" section
    And I fill in "Qualifications" with "Deliveries, Flaking, Skating"
    And I press "Continue Registration"
    Then I should see "Session Preferences"

  Scenario: US
    When I select "United States" from "Country"
    And I select "Florida" from "State/Province"
    And I press "Continue Registration"
    Then I should see "Employer id number"
