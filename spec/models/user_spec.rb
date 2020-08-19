require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nickname、email、password、password_confirmation、family_name、
    first_name、family_name_katakana、first_name_katakana、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空では登録できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'family_name_katakanaが空では登録できない' do
      @user.family_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
    end

    it 'first_name_katakanaが空では登録できない' do
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'パスワードが英数だけの場合登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'family_nameが英数字である場合登録できない' do
      @user.family_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    it 'first_nameが英数字である場合登録できない' do
      @user.first_name = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'family_name_katakanaがカタカナでない場合登録できない' do
      @user.family_name_katakana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name katakana is invalid')
    end

    it 'first_name_katakanaがカタカナでない場合登録できない' do
      @user.first_name_katakana = 'あ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name katakana is invalid')
    end
  end
end
