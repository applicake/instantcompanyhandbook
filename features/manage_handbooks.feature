Feature: Manage handbooks
  In order to entertain himself
  target application user
  wants to know what this site is about
  
  Scenario: Register new handbook
    Given I am on the homepage
    And I fill in "Company Name" with "FlowerPower"
    And I press "Generate"
    Then I should see "Your handbook has been generated"
