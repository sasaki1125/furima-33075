require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    context '新規登録できるとき' do
      it "すべての項目の入力が存在すれば登録ができること" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nikcnameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank") 
      end
      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank") 
      end
      it "emailに@がない場合は登録できないこと" do
        @user.email = "sample.gmailcom"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid") 
      end
      it "重複しているemailがある場合は登録できないこと"do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと"do
        @user.password = "a1234567"
        @user.password_confirmation = "b1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank") 
      end
      it "passwordは数字のみでは登録できないこと" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordは英語のみでは登録できないこと" do
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password") 
      end
      it "passwordは6文字以上でないと登録できないこと" do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは全角では登録できないこと" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "password_confirmationがない場合は登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
        it "family_nameがない場合は登録できないこと" do
          @user.family_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it "family_nameは漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
          @user.family_name = "yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end

        it "family_name_kanaがない場合は登録できないこと" do
          @user.family_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana can't be blank")
        end

        it "family_name_kanaはカタカナ以外の場合は登録できないこと" do
          @user.family_name_kana = "山田"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")

          @user.family_name_kana = "tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")

          @user.family_name_kana = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name kana is invalid")
        end

        it "first_nameがない場合は登録できないこと" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it "first_nameは漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
          @user.first_name = "yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it "first_name_kanaがない場合は登録できないこと" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it "first_name_kanaはカタカナ以外の場合は登録できないこと" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")

          @user.first_name_kana = "tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")

          @user.first_name_kana = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end

        it "birth_dayがない場合は登録できないこと" do
          @user.birth_day = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth day can't be blank")
        end
    end
end