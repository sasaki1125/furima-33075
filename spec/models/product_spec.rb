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
    it "category_idがない場合は登録できないとき" do
      @product.category_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")       
    end
    it "judgment_idがない場合は登録できないとき" do
      @product.judgment_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Judgment can't be blank")       
    end
    it "status_idがない場合は登録できないとき" do
      @product.status_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Status can't be blank")       
    end
    it "prefecture_idがない場合は登録できないとき" do
      @product.prefecture_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Prefecture can't be blank")       
    end 
    it "day_idがない場合は登録できないとき" do
      @product.day_id = ""
      @product.valid?
      expect(@product.errors.full_messages).to include("Day can't be blank")       
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