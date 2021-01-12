require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
      it "すべての項目の入力が存在すれば登録ができること" do
        @user = FactoryBot.build(:user) 
        expect(@user).to be_valid
      end
      it "nikcnameがない場合は登録できないこと" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messges).to include("Nickname can't be blank") 
      end
      it "emailがない場合は登録できないこと" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messges).to include("Email can't be blank") 
      end
      it "passwordがない場合は登録できないこと" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messges).to include("Password can't be blank") 
      end
      it "passwordは英語のみでは登録できないこと" do
        @user.password_confimation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messges).to include("Password is invalid") 
      end
      it "passwordは6文字以上でないと登録できないこと" do
        @user.password = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        it "last_nameがない場合は登録できないこと" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "last_nameは漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
          @user.last_name = "yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it "last_name_kanaがない場合は登録できないこと" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it "last_name_kanaはカタカナ以外の場合は登録できないこと" do
          @user.last_name_kana = "山田"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")

          @user.last_name_kana = "tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")

          @user.last_name_kana = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end

        it "family_nameがない場合は登録できないこと" do
          @user.first_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("family name can't be blank")
        end

        it "family_nameは漢字、ひらがな、カタカナ以外の場合は登録できないこと" do
          @user.fir
          
          st_name = "yamada"
          @user.valid?
          expect(@user.errors.full_messages).to include("family name is invalid")
        end

        it "family_name_kanaがない場合は登録できないこと" do
          @user.first_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("family name kana can't be blank")
        end

        it "family_name_kanaはカタカナ以外の場合は登録できないこと" do
          @user.first_name_kana = "太郎"
          @user.valid?
          expect(@user.errors.full_messages).to include("family name kana is invalid")

          @user.first_name_kana = "tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("family name kana is invalid")

          @user.first_name_kana = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("family name kana is invalid")
        end

        it "birthdayがない場合は登録できないこと" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
end