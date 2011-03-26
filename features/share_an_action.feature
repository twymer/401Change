@wip1
Feature: Sharing an action
  This is a definitioin of the feature

Scenario: Navigate to Needs page
  Given I am on the home page
  When I follow "Share an action"
  Then I should be on the share an action page

Scenario: I can submit a valid action
  Given I am on the share an action page
  When I submit a valid action
  Then there should be an action in the database
  And I should get confirmation that sharing succeeded
  
