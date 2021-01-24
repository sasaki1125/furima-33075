require 'rails_helper'
RSpec.describe HistoryDestination, type: :model do
  before do
    @historydestination = FactoryBot.build(:history_destination)
    @product = FactoryBot.build(:product)
    @user = FactoryBot.build(:user)
  end
  
  
  context '登録できるとき' do
    it "全て入力されていれば登録できる" do
      expect(@historydestination).to be_valid
    end
    it "現像物の記入がなくても登録できる" do
      @historydestination.building_name = ""
      expect(@historydestination).to be_valid
      
    end
  end
  
  context '登録できないとき' do
    it "tokenがない場合は登録できないとき" do
      @historydestination.token = ""
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Token can't be blank") 
    end
    it "郵便番号がない場合は登録できないとき" do
      @historydestination.post_code = ""
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Post code can't be blank") 
    end
    it "郵便番号-がない場合は登録できないとき" do
      @historydestination.post_code = "1234567"
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Post code is invalid") 
    end
    it "郵便番号が全角の場合は登録できないとき" do
      @historydestination.post_code = "１２３ー４５６７"
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Post code is invalid") 
    end
    it "住所がない場合は登録できないとき" do
      @historydestination.city = ""
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("City can't be blank") 
    end
    it "都道府県が1の場合は登録できないとき" do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture must be other than 1")        
    end
    it "電話番号がない場合は登録できないとき" do
      @historydestination.phone_number = ""
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Phone number can't be blank") 
    end
    it "電話番号に英数字がある場合は登録できないとき" do
      @historydestination.phone_number = "0123abc456789"
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Phone number is invalid") 
    end
    it "電話番号に-がある場合は登録できないとき" do
      @historydestination.phone_number = "012-2345-6789"
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Phone number is invalid") 
    end
    it "電話番号が全角の場合は登録できないとき" do
      @historydestination.phone_number = "０１２３４５６７８９"
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Phone number is invalid") 
    end
    it "電話番号が11桁内でないと登録できないとき" do
      @historydestination.phone_number = "123456789123"
      @historydestination.valid?
      expect(@historydestination.errors.full_messages).to include("Phone number is invalid") 
    end
    
  end
end
