class Comment < ApplicationRecord

  with_options presence: true do
    validates :comment_text
    validates :user
    validates :animal
  end

  belongs_to :user
  belongs_to :animal
end
