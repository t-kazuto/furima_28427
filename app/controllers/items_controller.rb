class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :item_show, only: [:show]


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def item_show
    @item = Item.find(params[:id])
  end
end
