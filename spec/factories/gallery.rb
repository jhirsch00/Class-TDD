Factory.define :gallery do |g|
  g.title { Factory.next(:title) }
  g.association :user
end

# sequences
Factory.sequence(:title) do |n|
  "My sweet vacation ##{n}"
end