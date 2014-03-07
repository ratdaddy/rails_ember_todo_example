FactoryGirl.define do
  factory :item do
    user
    sequence(:summary) { |n| "todo item#{n}" }
    is_completed true
    due_date Date.today
    sequence(:priority) { |n| (n % 3) + 1 }
  end
end
