class Admins::ItemsController < ApplicationController
  def show
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :image_id, :introduction, :genre_id, :price, :is_active)
  end
end
