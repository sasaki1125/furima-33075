require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
      
    end
    context '新規登録がうまくいかないとき' do
      it "nikcnameがない場合は登録できないこと" do
        user = build(:user, nickname: nil)
        user.valid?
        expect(user.errors[:nickname]).to include("を入力してください")
      end
      it "emailがない場合は登録できないこと" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("は不正な値です", "を入力してください")
      end
      it "first_nameがない場合は登録できないこと" do
        user = build(:user, first_name: nil)
        user.valid?
        expect(user.errors[:first_name]).to include("は不正な値です", "を入力してください")
      end
      it "last_nameがない場合は登録できないこと" do
        user = build(:user, last_name: nil)
        user.valid?
        expect(user.errors[:last_name]).to include("は不正な値です", "を入力してください")
      end
      it "first_name_kanaがない場合は登録できないこと" do
        user = build(:user, first_name_kana: nil)
        user.valid?
        expect(user.errors[:first_name_kana]).to include("は不正な値です", "を入力してください")
      end
      it "last_name_kanaがない場合は登録できないこと" do
        user = build(:user, last_name_kana: nil)
        user.valid?
        expect(user.errors[:last_name_kana]).to include("は不正な値です", "を入力してください")
      end
      it "birthdayがない場合は登録できないこと" do
        user = build(:user, birthday: nil)
        user.valid?
        expect(user.errors[:birthday]).to include("を入力してください")
      end
      it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
      end
      it " 重複したemailが存在する場合は登録できないこと " do
        user = create(:user)
        another_user = build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors[:email]).to include("はすでに存在します")
      end
   
    
    end
  end
end