Feature: Sharing a need
  This is a definitioin of the feature
  
Scenario: Navigate to Share a Need page
  Given I am on the home page
  When I follow "Share a need"
  Then I should be on the share a need page
  
Scenario: Description box exists on page
  Given I am on the share a need page
  Then I should see a description
