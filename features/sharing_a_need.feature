@wip
Feature: Sharing a need
  This is a definitioin of the feature
  
Scenario: Navigate to Share a Need page
  Given I am on the home page
  When I follow "Share a need"
  Then I should be on the share a need page

@nyi
Scenario: I can submit a valid need
  Given I am on the share a need page
  When I submit a valid need
  Then there should be a need in the database
  And I should get confirmation that sharing succeeded
  
@nyi
Scenario: When I share a need with gps location
  Given I am on the share a need page
  When I submit a valid need with a gps location
  Then I should get confirmation that sharing succeeded
  And there should be a need with a location in the database