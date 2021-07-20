class Customers::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_Items.all
  end

  def create
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end
end
