FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Baked Ziti #{n}" }
    instructions "Put pasta, cheese, and sauce in pan. Put in oven and bake until crispy."
    ingredients "Ziti, cheese, sauce"
    duration "1 hour"
  end
end
