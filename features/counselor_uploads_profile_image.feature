@http://www.pivotaltracker.com/story/show/4713670 @counselors
Feature: Counselor Uploads Profile Image
  In order to have clients feel comfortable talking to me
  As a counselor
  I want to upload a profile image

  Scenario:
    Given I am signed in as a counselor
    When I follow "My account"
    And I attach the file "spec/fixtures/scott.png" to "Avatar"
    And I press "Save settings"
    Then I should see an image named "profile_scott.png"
