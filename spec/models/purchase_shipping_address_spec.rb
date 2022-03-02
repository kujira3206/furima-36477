require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      product = FactoryBot.create(:product)
      user = FactoryBot.create(:user)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, product_id: product.ship_id)
     
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
      end
      it 'buildingはからでも保存できること' do
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できない' do
      end
      it 'zip_codeが半角のハイフンを含んでないと保存できないこと' do
      end
      it 'zip_codeが半角数字でないと保存できないこと' do
      end
      it 'shipping_areaを選択していないと保存できないこと' do
      end
      it 'minicipalitiesが空だと保存できないこと' do
      end
      it 'block_numberが空だと保存できないこと' do
      end
      it 'telが空だと保存できないこと' do
      end
      it 'telは10桁以内は保存できない' do
      end
      it 'telは11桁以上は保存できない' do
      end
      it 'telは半角数字以外は保存できない' do
      end
      it 'productが紐づいてないと保存できない' do
      end
      it 'userが紐づいてないと保存できない' do
      end

    end
  end
end
