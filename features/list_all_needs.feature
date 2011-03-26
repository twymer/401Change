@wip
Feature: Finding a need
  This is a definitioin of the feature
  
Scenario: Navigate to Needs page
  Given I am on the home page
  When I follow "Find a need"
  Then I should be on the find a need page

Scenario:
  Given I am on the find a need page
  Then I should see all the needs

@nyi
Scenario: 
  Given I am on the find a need page
  And the following needs
  	| description       |
  	| feed the homeless |
  	| bring world peace |
  Then I should see a "feed the homeless" need on the list
  And I should see a "Bring world peace" need on the list
