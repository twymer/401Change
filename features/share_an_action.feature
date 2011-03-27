@wip1
Feature: Sharing an action
  This is a definitioin of the feature

Scenario: Navigate to Needs page
  Given I am on the home page
  When I follow "Share an action"
  Then I should be on the share an action page

Scenario: Navigate from find a need page
  Given the following needs
  	| description       |
  	| Feed the homeless |
  	| Bring world peace |
  And I am on the find a need page
  When I follow "I helped" for "Feed the homeless"
  Then I should be on the share an action page
  And need should be "Feed the homeless"
  
@nyi
Scenario: I can submit a valid action
  Given I am on the share an action page
  When I submit a valid action
  Then there should be an action in the database
  And I should get confirmation that sharing succeeded
  

