class Admins::ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admins_items_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end
end
