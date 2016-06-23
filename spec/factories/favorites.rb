FactoryGirl.define do
  factory :favorite do
    user
    association :favorited, factory: :recipe
  end
end
