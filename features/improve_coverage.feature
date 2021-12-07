Feature: Verify login controller methods

Background: We are on the login page

Scenario: test all oauth buttons
 Given I am on google login
 And I am on github login
 Then I should be redirected to the home page
 
Scenario: test my events methods
 Given I look up representative Martin J. Jenkins
 
Scenario: test my events item
  Given I am on the create new my events page
  And I am on create new my events

 
Scenario: test my news item
  Given I am on the my news item page
  And I create a new my news item
  

