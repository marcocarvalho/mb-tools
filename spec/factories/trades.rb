FactoryGirl.define do
  factory :trade do
    date Time.new
    price 1.5
    amount 1.5
    sequence :tid do |n|
      n
    end
    kind 'sell'

    trait :sell do
      kind 'sell'
    end

    trait :buy do
      kind 'buy'
    end
  end
end
