require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品購入機能' do
    before do
      @order = FactoryBot.build(:user_item_address)
    end

    it 'token、postal_code、prefecture_id、city、address、phone_number、user_id、item_idが存在すれば登録できる' do
      expect(@order).to be_valid
    end

    it 'tokenが空では登録できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では登録できない' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがなければ登録できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid")
    end

    it 'prefecture_idが空では登録できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture Select")
    end

    it 'cityが空では登録できない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では登録できない' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空では登録できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンがあり、11桁以上だと登録できない' do
      @order.phone_number = '000-0000-00000'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end

