Feature: Manage permissions
  In order to take advantage of this site
  a malicious user
  seeks for vulnerabilities and obviously fails

  Scenario: Initially the captcha is not present
    When I go to the home page
    Then I should not see "Please prove you're human"

  Scenario: Multiple form filling introduces captcha
    When I create a handbook 3 times
    Then I should see "Please prove you're human"
