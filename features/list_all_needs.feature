Feature: View all needs page
  This tests the viewing of all needs

Scenario: Navigate to Needs page
  Given I am on the share a need
  When I follow "Find a need"
  Then I should be on the find a need page


Scenario: 
  Given the following needs
  	| description       |
  	| Feed the homeless |
  	| Bring world peace |
  And I am on the find a need page
  Then I should see a "Feed the homeless" need on the list
  And I should see a "Bring world peace" need on the list
