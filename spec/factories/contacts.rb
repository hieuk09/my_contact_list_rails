FactoryGirl.define do
  factory :contact do
    sequence(:name) { |n| "name #{n}" }
    sequence(:telephone) { |n| "0123456#{n}" }
  end
end
