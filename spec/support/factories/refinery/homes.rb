
FactoryGirl.define do
  factory :home, :class => Refinery::Homes::Home do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

