Feature: Visitor View Photo
  As a visitor
  I can see thumbnails for photos in a gallery
  so that I can get a glance of its contents
  
  Scenario: View Photo
    Given the following gallery exists:
      | title   | user                            |
      | kittens | email: photographer@example.net |
    And a photo belongs to the "kittens" gallery with image "features/fixtures/kitty.jpg"
    And I am on the homepage
    When I follow "Galleries"
    And I follow "kittens"
    And I should see the thumbnails for "kittens"