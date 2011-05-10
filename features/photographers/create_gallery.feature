Feature: Create Gallery
  As a photographer
  I can create galleries
  So that I have a place to put pictures
  
  Background:
    Given I am signed up as "photographer@example.com/password"

  Scenario: Create a valid gallery
    When I sign in as "photographer@example.com/password"
    And I go to the dashboard page
    And I follow "Create Gallery"
    Then I should see "Create a new gallery"
    When I fill in "Title" with "My sweet vacation"
    And I press "Create Gallery"
    Then I should see "Gallery created successfully"
    And I should see "My sweet vacation"
    And I should be on the gallery page for "My sweet vacation"
  
  Scenario: Can't create a gallery without a title
    Given I am signed up as "photographer@example.com/password"
    When I sign in as "photographer@example.com/password"
    And I go to the dashboard page
    And I follow "Create Gallery"
    Then I should see "Create a new gallery"
    And I press "Create Gallery"
    Then I should see "Title can't be blank"
    And I should see "Create a new gallery"
    
  Scenario: Can't create a gallery if not signed in
    Given I go to the create gallery page
    Then I should see "Sign in"
    And I should be on the sign in page