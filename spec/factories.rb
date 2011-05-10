# Clearance

Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.email    { Factory.next :email }
  user.password { "password" }
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.after_build { warn "[DEPRECATION] The :email_confirmed_user factory is deprecated, please use the :user factory instead." }
end

# Gallery

Factory.define :gallery do |g|
  g.title { Factory.next :title }
  g.association :user
end

# sequences
Factory.sequence(:title) do |n|
  "My sweet vacation ##{n}"
end

# Photo

Factory.define :photo do |p|
  p.title { Factory.next :photo_title }
  p.description "this is a cute photo"
  p.association :gallery
  p.image_file_name "kitty.png"
end

# sequences
Factory.sequence(:photo_title) do |n|
  "my photo ##{n}"
end