Feature: Manage handbooks
  In order to entertain himself
  target application user
  wants to know what this site is about
  
  Scenario: Register new handbook
    Given I am on the homepage
    And I fill in "Your email" with "nbartlomiej@gmail.com"
    And I fill in "Company name" with "Flower Power"
    When I press "SEND ME MY COMPANY HANDBOOK!"
    Then I should see "Company handbook creation process initiated."
