require 'rails_helper'

RSpec.describe Animal, type: :model do
  before do
    @animal = FactoryBot.build(:animal)
  end
  describe 'ペット登録機能' do
    context 'ペットが登録できるとき' do
      
      it 'animal_name、animal_type_id、animal_pedigree、introduction、birthday、imageが全て入力できている時に登録できること' do
        expect(@animal).to be_valid
      end  
    end

    context 'ペットが登録できないとき' do

      it 'animal_nameが空では登録できないこと' do
        @animal.animal_name = ''
        @animal.valid?
        expect(@animal.errors.full_messages).to include("Animal name can't be blank")
      end

      it 'animal_type_idが未選択では登録できないこと' do
        @animal.animal_type_id = 1
        @animal.valid?
        expect(@animal.errors.full_messages).to include("Animal type must be other than 1")
      end

      it 'animal_pedigreeが空では登録できないこと' do
        @animal.animal_pedigree = ''
        @animal.valid?
        expect(@animal.errors.full_messages).to include("Animal pedigree can't be blank")
      end

      it 'introductionが空では登録できないこと' do
        @animal.introduction = ''
        @animal.valid?
        expect(@animal.errors.full_messages).to include("Introduction can't be blank")
      end

      it 'birthdayが空では登録できないこと' do
        @animal.birthday = ''
        @animal.valid?
        expect(@animal.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'imageが未選択では登録できないこと' do
        @animal.image = nil
        @animal.valid?
        expect(@animal.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
