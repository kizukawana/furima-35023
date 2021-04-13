require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it "すべての情報が入力されていなければ登録できない" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
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
     it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
     end
     it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
     end
     it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     it "メールアドレスが一意性でなければ登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      # binding.pry
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "メールアドレスは＠を含まないと登録できない" do
      @user.email = 'hoge.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it "パスワードが5文字以下では登録できない" do
      @user.password = '00aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "パスワードとパスワード（確認用）、値の一致していなければ登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "パスワードが半角、英数混合でなければ登録できない" do
      @user.password = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "名前は漢字、平仮名、カタカナ以外では登録できない" do
      @user.last_name_kanji = '123121233'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji is invalid")
     end
     it "名字は漢字、平仮名、カタカナ以外では登録できない" do
      @user.first_name_kanji = '123121233'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji is invalid")
     end
     it "名字名前のフリガナは全角カタカナ以外では登録できない" do
      @user.first_name_kana = '123121233'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end
     it "名前のフリガナは全角カタカナ以外では登録できない" do
      @user.first_name_kana = '123121233'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end
     it "全角では登録できない" do
      @user.password = '１１１１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is invalid")
     end
    end
  end
end