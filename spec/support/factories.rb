FactoryGirl.define do
  factory :company do
    sequence(:name) { |n| "Company #{n}" }

    trait :addressed do
      full_address '222 3rd Street, Suite 400, Cambridge, MA, 02142'
      city 'Cambridge'
      state 'MA'
      zipcode '02142'
    end

    trait :unparsed_address do
      full_address '222 3rd Street, Suite 400, Cambridge, MA, 02142'
    end
  end
end
