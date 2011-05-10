When /^I create a gallery with title "(.*)"$/ do |title|
  When %{I go to the dashboard page}
  And %{I follow "Create Gallery"}
  And %{I should see "Create a new gallery"}
  And %{I fill in "Title" with "#{title}"}
  And %{I press "Create Gallery"}
end

Then /^I should see the image for "([^"]*)"$/ do |photo_name|
  photo = Photo.find_by_title!(photo_name)
  page.should have_css("img[src$='#{photo.image.url}']")
end