FactoryBot.define do
  factory :post, class: "HisAdapter::Post"  do
    name { "MyString" }
    body { "MyString" }
  end
end
