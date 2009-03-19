Feature: Manage ships
  In order to show ships
  A User should be able to
  Create a list of ships
  
  Scenario: Register new ships
    Given that I have created a ship "big ship"
    When I go to the ships page
    Then I should see "big ship"

  
