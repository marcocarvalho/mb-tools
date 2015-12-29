FactoryGirl.define do
  factory :api_token do
    token { SecureRandom.uuid }
  end
end
