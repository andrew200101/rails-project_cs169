Feature: Check that map is functional

Background: I am on the country map page

Scenario: Clicking on county redirects to proper search results
  Given I am on the California state map
  When I click on Alameda County 
  Then I should be on the search page
  And I should see Phong La




  
