require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end
  describe 'ツイートの投稿機能' do
    context 'ツイートが投稿できるとき' do
      
      it 'title、text、food_imageが全て入力されているときに投稿できること' do
        expect(@tweet).to be_valid
      end
    end

    context 'ツイートが投稿できないとき' do
      
      it 'titleが空では投稿できないこと' do
        @tweet.title = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空では投稿できないこと' do
        @tweet.text = ''
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Text can't be blank")
      end

      it 'food_imageが未選択では投稿できないこと' do
        @tweet.food_image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include("Food image can't be blank")
      end
    end
  end
end
