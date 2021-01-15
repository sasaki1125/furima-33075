require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  context '登録できるとき' do
    it "全て入力されていればOK" do
      expect(@product).to be_valid
    end
  end

  
    it "nameがない場合は登録できないとき" do
      @product.name = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Name can't be blank") 
    end
    it "descriptionがない場合は登録できないとき" do
      @product.description = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Description can't be blank")       
    end
    it "category_idの場合は登録できないとき" do
      @product.category_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Category is not a number")       
    end
    it "category_id 1の場合は登録できないとき" do
      @product.category_id = "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Category must be other than 1")       
    end
    it "judgment_idの場合は登録できないとき" do
      @product.judgment_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Judgment is not a number")       
    end
    it "judgment_id 1の場合は登録できないとき" do
      @product.judgment_id = "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Judgment must be other than 1")       
    end
    it "status_idの場合は登録できないとき" do
      @product.status_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Status is not a number")       
    end
    it "status_id 1の場合は登録できないとき" do
      @product.status_id = "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Status must be other than 1")       
    end
    it "prefecture_idの場合は登録できないとき" do
      @product.prefecture_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture is not a number")       
    end
    it "prefecture_id 1の場合は登録できないとき" do
      @product.prefecture_id = "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture must be other than 1")       
    end 
    it "day_idの場合は登録できないとき" do
      @product.day_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Day is not a number")       
    end
    it "day_id 1の場合は登録できないとき" do
      @product.day_id = "1"
      @product.valid?
      expect(@product.errors.full_messages).to include("Day must be other than 1")       
    end
    it "priceがない場合は登録できないとき" do
      @product.price = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")       
    end
    it "priceが299円以下の場合は登録できないとき" do
      @product.price = "299"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be greater than 299")       
    end
    it "priceが9999999円以上の場合は登録できないとき" do
      @product.price = "19999999"
      @product.valid?
      expect(@product.errors.full_messages).to include("Price must be less than 9999999")       
    end
  
end
