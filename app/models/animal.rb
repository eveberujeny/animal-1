class Animal < ApplicationRecord
  with_options presence: true do
    validates :animal_name
    validates :animal_type_id, numericality: { other_than: 1 }
    validates :animal_pedigree
    validates :birthday
    validates :introduction
    validates :user
    validates :image
  end
  
  belongs_to :user
  has_one_attached :image
  has_many :tweets, dependent: :destroy
  has_many :likes
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :animal_type
end
