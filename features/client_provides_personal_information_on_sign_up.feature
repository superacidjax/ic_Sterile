@http://www.pivotaltracker.com/story/show/4713666 @clients
Feature: Client Provides Personal Information on Sign Up
  In order to provide my counselor information about myself
  As a client on the Account Information page
  I want provide my personal information

  Background:
    Given I have finished step 1 of client registration

  Scenario: fields
    Then I should see "Avatar"
    And I should see "Single" in the "Relationship status" section
    And I should see "Separated" in the "Relationship status" section
    And I should see "Divorced" in the "Relationship status" section
    And I should see "Widow/Widower" in the "Relationship status" section
    And I should see "Engaged" in the "Relationship status" section
    And I should see "Married or Domestic Partnership" in the "Relationship status" section
    And I should see "Full-time" in the "Employment status" section
    And I should see "Part-time" in the "Employment status" section
    And I should see "Unemployed" in the "Employment status" section
    And I should see "Stay at home parent" in the "Employment status" section
    And I should see "In school" in the "Employment status" section
    And I should see "Self-employed" in the "Employment status" section
    And I should see "Retired" in the "Employment status" section
    And I should see "Less than high school" in the "Education" section
    And I should see "High school" in the "Education" section
    And I should see "Some college" in the "Education" section
    And I should see "2 year degree" in the "Education" section
    And I should see "4 year degree" in the "Education" section
    And I should see "Some graduate school" in the "Education" section
    And I should see "Advanced degree" in the "Education" section
    And I should see "Professional (law/medicine)" in the "Education" section
    And I should see "Trade/Technical school" in the "Education" section

  Scenario: success
    When I attach the file "spec/fixtures/scott.png" to "Avatar"
    When I choose "Male" in the "Gender" section
    And I choose "Single" in the "Relationship status" section
    And I choose "Full-time" in the "Employment status" section
    And I choose "Some college" in the "Education" section
    And I press "Save and Continue"
    Then I should not see "can't be blank"
    When I follow "Personal Information"
    Then I should see an image named "scott.png"



  Scenario: validation errors
    When I press "Save and Continue"
    Then I should see "Gender can't be blank"
    And I should see "Relationship status can't be blank"
    And I should see "Employment status can't be blank"
    And I should see "Education can't be blank"
