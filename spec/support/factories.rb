FactoryGirl.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }

    trait :addressed do
      full_address ADDRESS
      city 'Cambridge'
      state 'MA'
      zipcode '02142'
    end

    trait :unparsed_address do
      full_address ADDRESS
    end
  end
end
