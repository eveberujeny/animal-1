class Tweet < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :user
    validates :animal
    validates :food_image
  end

  belongs_to :user
  belongs_to :animal
  has_one_attached :food_image
  has_many :messages, dependent: :destroy
end
