When /^I create a gallery with title "(.*)"$/ do |title|
  When %{I go to the dashboard page}
  And %{I follow "Create Gallery"}
  And %{I should see "Create a new gallery"}
  And %{I fill in "Title" with "#{title}"}
  And %{I press "Create Gallery"}
end