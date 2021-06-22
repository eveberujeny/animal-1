FactoryBot.define do
  factory :animal do
    animal_name     {'ベル'}
    animal_type_id  { 2 }
    animal_pedigree {'トイプードル'}
    birthday        {'2000-01-01'}
    introduction    {'テストです'}
    association :user

    after(:build) do |animal|
      animal.image.attach(io: File.open('public/images/image6.jpeg'), filename: 'image6.jpeg')
    end
  end
end