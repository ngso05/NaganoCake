class Customers::ItemsController < ApplicationController
  def index
    @item_count = Item.count
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = Cart_Item.new
  end
end
