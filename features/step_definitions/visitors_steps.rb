Given /^a photo belongs to the "([^"]*)" gallery with image "([^"]*)"$/ do |gallery_title, file_path|
  Factory :photo, :gallery => Gallery.find_by_title!(gallery_title), :image => File.open(file_path)
end

Given /^a photo with title "([^"]*)" belongs to the "([^"]*)" gallery with image "([^"]*)"$/ do |photo_title, gallery_title, file_path|
  Factory :photo, :gallery => Gallery.find_by_title!(gallery_title), :image => File.open(file_path), :title => photo_title
end

Then /^I should see the thumbnails for "([^"]*)"$/ do |gallery_title|
  gallery = Gallery.find_by_title!(gallery_title)
  page.should have_css("img[src$='#{gallery.photos.first.image.url(:thumb)}']")
end