require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、email、passwordとpassword_confirmation、first_name、last_name、first_name_furigana、last_name_furigana, birth_dateが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_furiganaが空では登録できない' do
      @user.first_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'last_name_furiganaが空では登録できない' do
      @user.last_name_furigana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
    end
    it 'birth_dateが空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
    it "first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
        @user.last_name = "kana"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_name_furiganaは全角（カタカナ）でなければ登録できない" do
      @user.first_name = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include()
      end
      it "last_name_furiganaは全角（カタカナ）でなければ登録できない" do
      @user.last_name_furigana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end
    it 'emailに@が含まれていなければ登録できない' do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが半角英数字混合でななければ登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  end
end
