@http://www.pivotaltracker.com/story/show/4713698 @counselors
Feature: Counselor Provides Specialty Information
  In order to connect with patients according to my specialties
  As a counselor on the Personal Information Sign Up page
  I want to provide information about my specialties

  - provide professional information
  - click Save and Continue
  - I am taken to the Profile Sign Up page
  - select one or many specialties from a list of
  -- Abuse
  -- Addiction
  -- Anger
  -- Anxiety
  -- Attention and Behavior
  -- Bipolar (and related disorders)
  -- Bullying
  -- Children/Parenting
  -- Crisis
  -- Culture/Religion
  -- Depression
  -- Eating Disorders
  -- Expat/Culture Shock
  -- Family
  -- Fears/Phobias
  -- Goals and Plans
  -- Grief/Loss
  -- Job/Career
  -- Life Transitions
  -- Military Issues
  -- Money/Finances
  -- Moods/Personality
  -- Panic Attacks
  -- Post Traumatic Stress
  -- Pregnancy/Child Birth
  -- Pre-Marriage
  -- Relationships
  -- School/Academics
  -- Self Improvement/Motivations
  -- Separation Issues
  -- Stress
  -- Suicide
  -- Thinking Problems
  - click Save and Finish
  - I am taken to the Thank You For Signing Up page

  Scenario:
    Given the following issues:
      | name      |
      | Abuse     |
      | Addiction |
    And I have finished step 2 of counselor registration
    When I check "Abuse" in the "I specialize in" section
    And I check "Addiction" in the "I specialize in" section
    And I press "Finish Registration"
    Then I should see "Thank you for signing up"
