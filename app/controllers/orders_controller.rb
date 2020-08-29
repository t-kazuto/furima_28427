class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :exhibitor_move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = UserItemAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def exhibitor_move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
       redirect_to root_path
    else
       render :index
    end
  end

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :address, :phone_number, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
