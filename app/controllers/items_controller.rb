class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    redirect_to item_path(item)
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])
  end

  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to item_path(item)
  end

  private
  def item_params
    params.permit(
      :name,
      :description,
      :price,
      :category
    )
  end
end