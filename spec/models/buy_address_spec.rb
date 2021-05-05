require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '商品購入登録' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buy_address = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
      sleep 0.8
    end

    context '商品の購入登録ができる時' do
      it 'user_id, item_id, postal_code, shipping_area_id, town, address, phone, tokenが存在すれば登録できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも購入登録できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入登録が出来ない時' do
      it 'postal_codeが空だと購入できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含まなければ購入登録できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'shipping_area_idは1以外選択していないと購入登録できないこと' do
        @buy_address.shipping_area_id = 1
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'townが空だと購入登録できないこと' do
        @buy_address.town = ' '
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Town can't be blank")
      end
      it 'addressが空だと購入登録できないこと' do
        @buy_address.address = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'tokenが空だと購入登録できないこと' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'phoneは数値以外が含まれていると登録出来ない事' do
        @buy_address.phone = 'ああああaaaa'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone is not a number")
      end
      it 'phoneは11桁以内でなければ登録出来ない事' do
        @buy_address.phone = '123456789012'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it 'phoneが空だと保存できないこと' do
        @buy_address.phone = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Phone can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_address.item_id = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
