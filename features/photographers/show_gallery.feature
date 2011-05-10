Feature: Show Gallery/Galleries
  As a photographer
  I can view galleries
  So that I can see all my pretty pictures
  Background:
    Given the following gallery exists:
      | title              | user                             |
      | my sweet vacation  | email: photographer@example.net  |
      | my other vacation  | email: another_email@example.net |
    
  Scenario: View my galleries
    When I sign in as "photographer@example.net/password"
    And I go to the dashboard
    Then I should see "my sweet vacation"
    
  Scenario: View only my galleries
    When I sign in as "photographer@example.net/password"
    And I go to the dashboard page
    Then I should not see "my other vacation"
    
  Scenario: View my own gallery
    When I sign in as "photographer@example.com/password"
    And I go to the dashboard page
    And I go to the gallery page for "my sweet vacation"
    Then I should be on the gallery page for "my sweet vacation"
    
  Scenario: Can't view someone else's gallery
    Given I am signed up as "photographer_2@example.com/password"
    And I am signed up as "photographer@example.com/password"
    When I sign in as "photographer_2@example.com/password"
    And I create a gallery with title "Photographer 2's gallery"
    And I sign out
    And I sign in as "photographer@example.com/password"
    And I go to the the gallery page for "Photographer 2's gallery"
    Then I should see "Gallery not found"
    