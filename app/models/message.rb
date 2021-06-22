class Message < ApplicationRecord

  with_options presence: true do
    validates :message_text
    validates :user
    validates :tweet
  end

  belongs_to :user
  belongs_to :tweet
end
