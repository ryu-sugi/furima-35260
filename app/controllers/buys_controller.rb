class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find_params, only: [:index, :create]
  before_action :sold_out_item, only: :index

  def index
    @buy_address = BuyAddress.new
  end

  def new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_find_params
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.buy.present? || current_user == @item.user
  end

  def buy_params
    params.require(:buy_address).permit(:shipping_cost_id, :postal_code, :shipping_area_id, :town, :building_name, :address, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp.api_key = 'sk_test_ade063c0925bd21ebc31949c'
    Payjp::Charge.create(
      amount: @item.value,  
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
