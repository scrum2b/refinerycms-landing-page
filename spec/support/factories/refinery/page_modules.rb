
FactoryGirl.define do
  factory :page_module, :class => Refinery::PageModules::PageModule do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

