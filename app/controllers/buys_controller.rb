class BuysController < ApplicationController

 def index
  @item = Item.find(params[:item_id])
  @buy_address = BuyAddress.new
 end

 def new
 end

 def create
  @item = Item.find(params[:item_id])
  @buy_address = BuyAddress.new(buy_params)
   if @buy_address.valid?
      @buy_address.save
      redirect_to root_path
   else
      render :index
   end
 end

 def buy_params
  params.require(:buy_address).permit(:shipping_cost_id, :postal_code, :shipping_area_id, :town, :building_name, :address, :phone).merge(item_id: params[:item_id], user_id: current_user.id)
 end
 
end