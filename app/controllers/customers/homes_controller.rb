class Customers::HomesController < ApplicationController
  def top
    @items = Item.all
    @item = Item.order(created_at: :desc).limit(4)
  end

  def about
  end
end
