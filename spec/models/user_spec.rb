require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'name、nickname、email、password、password_confirmationが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上で半角英数字混合であれば登録できること' do
          @user.password = 'a12345'
          @user.password_confirmation = 'a12345'
          expect(@user).to be_valid
        end
      end

      context '新規登録できないとき' do
        it 'nameが空では登録できないこと' do
          @user.name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Name can't be blank")
        end

        it 'nameが全角入力でなければ登録できないこと' do
          @user.name = 'ｱｲｳｴｵ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Name is invalid")
        end

        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        
        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに@が含まれていないと登録できないこと' do
          @user.email = 'test'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it '重複したemailが存在する場合登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが5文字以下だと登録できないこと' do
          @user.password = 'a1234'
          @user.password_confirmation = 'a1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'a12345'
          @user.password_confirmation = 'a12344'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが英語のみでは登録できないこと' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordが全角文字では登録できないこと' do
          @user.password = 'ああああああ'
          @user.password_confirmation = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end
      end
    end
  end
end
