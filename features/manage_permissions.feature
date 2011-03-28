Feature: Manage permissions
  In order to take advantage of this site
  a malicious user
  seeks for vulnerabilities and obviously fails

  Scenario: Multiple form filling introduces captcha
    When I create a handbook 3 times
    Then I should see "Please proove you're not a robot"
