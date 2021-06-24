class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, }
    validates :nickname
  end

  VALID_PASSWORD_REGEX = /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]/
  validates :password, format: { with: VALID_PASSWORD_REGEX }  

  has_many :animals
  has_many :tweets
  has_many :messages
  has_many :likes
  has_many :comments
end
