Feature: Add a Cause
  In order to publicize a cause
  As a visitor
  I want to be able to add a cause

Scenario: Navigating to the Add Cause Page
  Given I am on the home page
  When I follow "Share a Cause"
  Then I should be on the share a cause page



Scenario: Adding a Change Agent Sad Path
  Given I am on the share a cause page
  When I press "Suggest Cause"
  Then I am on the share a cause page
  And 0 causes should exist
  And name should have an error message


Scenario: Adding a Change Agent With Everything
  Given I am on the share a cause page
  When I fill in "name" with "This great cause"
  And I press "Suggest Cause"
  Then I should be on the home page
  Then I should see "Thank you for adding a Cause!"
