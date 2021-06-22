require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージ投稿機能' do
    context 'メッセージが投稿できるとき' do
      it 'message_textが入力されているときに投稿できること' do
        expect(@message).to be_valid
      end
    end

    context 'メッセージが投稿できないとき' do
      it 'message_textが空では投稿できないこと' do
        @message.message_text = ''
        @message.valid?
        expect(@message.errors.full_messages).to include("Message text can't be blank")
      end
    end
  end
end
