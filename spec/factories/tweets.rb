FactoryBot.define do
  factory :tweet do
    title       {'テスト'}
    text        {'テストです'}
    association :user
    association :animal

    after(:build) do |tweet|
      tweet.food_image.attach(io: File.open("public/images/image6.jpeg"), filename: "image6.jpeg")
    end
  end
end