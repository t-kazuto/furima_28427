class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :exhibitor_move_to_index, only: [:index]

  def index
    @item = Item.find(params[:item_id])
  end

  def create
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
end
