class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :item_find_params, only: [:show, :destroy]
  before_action :move_to_index, only: :destroy


  def new
    @item = Item.new
  end

  def index
    @item = Item.all.order("id DESC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      return redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to action: :show
    end
  end

 private

  def item_params
   params.require(:item).permit(:item_name, :image, :category_id, :condition_id, :shipping_area_id, :shipping_day_id, :shipping_cost_id, :value, :description).merge(user_id: current_user.id)
  end

  def item_find_params
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end