require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @item = FactoryBot.build(:item, :image)
      @item.image = fixture_file_upload('spec/fixtures/public/images/test_image.png')
    end

    it 'name、explanation、category_id、condition_id、shipping_charges_id、shipping_area_id、shipping_days_id、price、imageが存在すれば登録できる' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'explanationが空では登録できない' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'category_idが空では登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'category_idが空では登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'condition_idが空では登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition Select')
    end

    it 'shipping_charges_idが空では登録できない' do
      @item.shipping_charges_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charges Select')
    end

    it 'shipping_area_idが空では登録できない' do
      @item.shipping_area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping area Select')
    end

    it 'shipping_days_idが空では登録できない' do
      @item.shipping_days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping days Select')
    end

    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300円以下では登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it 'priceが9,999,999円以上では登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it 'priceが半角数字以外では登録できない' do
      @item.price = 'あ'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'imageが空では登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
