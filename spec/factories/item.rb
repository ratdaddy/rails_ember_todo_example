FactoryGirl.define do
  factory :item do
    sequence(:summary) { |n| "todo item#{n}" }
    is_completed true
  end
end
