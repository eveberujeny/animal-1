FactoryBot.define do
  factory :message do
    message_text {'テストです'}
    association :user
    association :tweet
  end
end
