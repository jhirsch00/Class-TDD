Feature: Picture Uploads
  As a photographer
  I can upload a picture into my gallery
  So that I can share them with the world
  
  Scenario: Upload a photo
  Given I am signed in as "photographer@example.net/password"
  And the following gallery exists:
    | title   | user                            |
    | kittens | email: photographer@example.net |
  When I follow "Galleries"
  And I follow "kittens"
  And I follow "New Image"
  And I fill in "Title" with "kitty"
  And I fill in "Description" with "what a cute kitten"
  And I attach the file "features/fixtures/kitty.jpg" to "Image"
  And I press "Upload photo"
  Then I should see "Photo uploaded successfully"
  And I should be on the gallery page for "kittens"
  And I should see the image for "kitty"