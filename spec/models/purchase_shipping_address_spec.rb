require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      product = FactoryBot.create(:product)
      user = FactoryBot.create(:user)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, product_id: product.id, user_id: user.id) 
     
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_shipping_address).to be_valid
      end
      it 'buildingはからでも保存できること' do
        @purchase_shipping_address.building = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'zip_codeが空だと保存できない' do
        @purchase_shipping_address.zip_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Zip code can't be blank")
      end
      it 'zip_codeが半角数字、ハイフンを含んでないと保存できないこと' do
        @purchase_shipping_address.zip_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")

      end
      it 'shipping_areaを選択していないと保存できないこと' do
        @purchase_shipping_address.shipping_area_id = '1'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Shipping area can't be blank")
      end
      it 'minicipalitiesが空だと保存できないこと' do
        @purchase_shipping_address.minicipalities = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Minicipalities can't be blank")
      end
      it 'block_numberが空だと保存できないこと' do
        @purchase_shipping_address.block_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Block number can't be blank")
      end
      it 'telが空だと保存できないこと' do
        @purchase_shipping_address.tel = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telは10桁以内は保存できない' do
        @purchase_shipping_address.tel = '123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは11桁以上は保存できない' do
        @purchase_shipping_address.tel = '123456789012'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'telは半角数字以外は保存できない' do
        @purchase_shipping_address.tel = 'あ１２３？'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Tel is invalid")
      end
      it 'productが紐づいてないと保存できない' do
        @purchase_shipping_address.product_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'userが紐づいてないと保存できない' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end

    end
  end
end
