
FactoryGirl.define do
  factory :landing_page, :class => Refinery::LandingPages::LandingPage do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

