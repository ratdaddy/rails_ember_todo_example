FactoryGirl.define do
  factory :item do
    user
    sequence(:summary) { |n| "todo item#{n}" }
    is_completed true
  end
end
