class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def index
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

 private

  def item_params
   params.require(:item).permit(:image, :category_id, :condition_id, :shipping_area_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
