FactoryBot.define do
  factory :post do
    title {"cat"}
    text {"hello!"}
    image {"hoge.jpg"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    user
  end
end