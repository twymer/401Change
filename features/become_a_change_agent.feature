Feature: Become a Change Agent
  In order to share the things I do to change the world
  As a visitor
  I want to be become a change agent

Scenario: Navigating to the Add Cause Page
  Given I am on the home page
  When I follow "Become a change agent"
  Then I should be on the become a change agent page


@wip
Scenario: Adding a Change Agent Sad Path
  Given I am on the become a change agent page
  When I press "Complete Registration"
  Then I am on the become a change agent page
  And 0 change agents should exist
  And nickname should have an error message
  And email should have an error message

@nyi
Scenario: Adding a Change Agent With Everything
  Given I am on the share a cause page
  When I fill in "name" with "This great cause"
  And I press "Suggest Cause"
  Then I should be on the home page
  Then I should see "Thank you for adding a Cause!"
