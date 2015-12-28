FactoryGirl.define do
  factory :trade do
    date Time.new
    price 1.5
    amount 1.5
    sequence :tid do |n|
      n
    end
    kind Trade.kinds.values.sample(1).first

    trait :sell do
      kind Trade.kinds['sell']
    end

    trait :buy do
      kind Trade.kinds['buy']
    end
  end
end
