Feature: View Photos
  As a photographer
  I can select a thumbnail
  So that I can view full size image
 
  Background:
    Given the following gallery exists:
    | title    | user                             |
    | kittens  | email: photographer@example.net  |
    And a photo with title "kitty" belongs to the "kittens" gallery with image "features/fixtures/kitty.jpg"
    And I am on the gallery page for "kittens"
  
  Scenario: View Full Size Photo
    When show me the page
    When I follow "kitty"
    Then I should see the image for "kitty"
