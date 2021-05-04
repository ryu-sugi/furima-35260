require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録' do
    context '商品の出品登録ができる時' do
      it 'item_name、item_image、category_id、value、description、condition_id、shipping_cost_id、shipping_area_id、shipping_day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品登録ができない時' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idは1以外選択しなければ登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'condition_idは1以外選択しなければ登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'shipping_cost_idは1以外選択しなければ登録できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping cost must be other than 1')
      end
      it 'shipping_area_idは1以外選択しなければ登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it 'shipping_day_idは1以外選択しなければ登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end
      it 'valueが空では登録できない' do
        @item.value = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Value can't be blank")
      end
      it 'value全角文字では登録できないこと' do
        @item.value = '１２３'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not a number')
      end
      it 'valueは半角英数混合では登録できないこと' do
        @item.value = 'a1b2'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not a number')
      end
      it 'valueは半角英語だけでは登録できないこと' do
        @item.value = 'aaBB'
        @item.valid?
        expect(@item.errors.full_messages).to include('Value is not a number')
      end
      it 'valueは299円以下では登録できないこと' do
        @item.value = 298
        @item.valid?
        expect(@item.errors.full_messages).to include('Value must be greater than or equal to 299')
      end
      it 'valueは10,000,000円以上では登録できないこと' do
        @item.value = 10_000_001
        @item.valid?
        expect(@item.errors.full_messages).to include('Value must be less than or equal to 10000000')
      end
    end
  end
end
