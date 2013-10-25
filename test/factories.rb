FactoryGirl.define do
  factory :product do
    sequence(:title) { |n| "Hobbit część #{n}" }
    price 39.99
    description "Tam i z powrotem"
  end
end

