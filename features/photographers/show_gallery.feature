Feature: Show Gallery/Galleries
  As a photographer
  I can view galleries
  So that I can see all my pretty pictures
  
  Scenario: View my galleries
    Given I am signed up as "photographer@example.com/password"
    When I sign in as "photographer@example.com/password"
    And I go to the dashboard page
    And I follow "Create Gallery"
    Then I should see "Create a new gallery"
    When I fill in "Title" with "My sweet vacation"
    And I press "Create Gallery"
    And I go to the dashboard page
    And I should see "My sweet vacation"
    
  Scenario: View only my galleries
    Given I am signed up as "photographer_2@example.com/password"
    And I am signed up as "photographer@example.com/password"
    When I sign in as "photographer_2@example.com/password"
    And I create a gallery with title "Photographer 2's gallery"
    And I sign out
    And I sign in as "photographer@example.com/password"
    And I go to the dashboard page
    Then I should not see "Photographer 2's gallery"
    
  Scenario: View my own gallery
    Given I am signed up as "photographer@example.com/password"
    When I sign in as "photographer@example.com/password"
    And I create a gallery with title "My sweet vacation"
    And I should be on the gallery page for "My sweet vacation"
    
  Scenario: Can't view someone else's gallery
    Given I am signed up as "photographer_2@example.com/password"
    And I am signed up as "photographer@example.com/password"
    When I sign in as "photographer_2@example.com/password"
    And I create a gallery with title "Photographer 2's gallery"
    And I sign out
    And I sign in as "photographer@example.com/password"
    And I go to the the gallery page for "Photographer 2's gallery"
    Then I should see "Gallery not found"
    