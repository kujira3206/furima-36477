require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

 describe '商品出品' do
  context '商品出品できる場合' do
    it "商品名と商品説明、カテゴリーと商品の状態、配送料の負担と発送元の地域、発送までの日数と価格があれば保存できる"do
      expect(@product).to be_valid
    end
  end
  context '商品出品できない場合' do
    it "商品名がないと保存できない" do
      @product.product_name = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product name can't be blank")
   end
    it "商品説明がないと保存できない" do
      @product.product_explanation = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Product explanation can't be blank")
    end
    it "カテゴリーが１の場合保存できない" do
      @product.category_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
    it "商品の状態が１の場合保存できない" do
      @product.product_status_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Product status can't be blank")
    end
    it "配送料の負担が１の場合保存できない" do
      @product.shipping_charge_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
    end
  
    it "発送元の地域が１の場合保存できない" do
      @product.shipping_area_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Shipping area can't be blank")
    end
  
    it "発送までの日数が１の場合保存できない" do
      @product.ship_id = '1'
      @product.valid?
      expect(@product.errors.full_messages).to include("Ship can't be blank")
    end
  
    it "価格が無いと保存できない" do
      @product.price = ''
      @product.valid?
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
  
    it "商品画像がないと保存できない" do
      @product.image = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("Image can't be blank")
    end
    it "userが紐づいてないと保存できない" do
      @product.user = nil
      @product.valid?
      expect(@product.errors.full_messages).to include("User must exist")
    end
    it "価格が¥300以上でないと保存できない" do
      @product.price = '0'
      @product.valid?
      expect(@product.errors.full_messages).to include()
    end
    it "価格が¥9,999,999以下でないと保存できない" do
      @product.price = '10000000'
      @product.valid?
      expect(@product.errors.full_messages).to include()
    end
    it "価格は半角数字でないと保存できない" do
      @product.price = '１１１'
      @product.valid?
      expect(@product.errors.full_messages).to include()
    end
  end
 end
end
