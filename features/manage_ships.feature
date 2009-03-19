Feature: Manage ships
  In order to show ships
  A User should be able to
  Create a list of ships
  
  Scenario: Register new ships
    Given that I have created a ship "big ship"
    When I go to the ships page
    Then I should see "big ship"    
    
  Scenario: Create new ship
    Given I am on the new ship page  
    When I fill in "Name" with "Deathstar" 
    And I fill in "Description" with "That's no moon, that's a battlestation."    
    And I press "Create"
    Then the name should be "Deathstar"  
    Then the description should be "That's no moon, that's a battlestation." 
    

  
