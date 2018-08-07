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
    @deal = Deal.new
    if params[:deal]
      @deal = Deal.create(
        amount: params[:deal][:amount],
        price: params[:deal][:price],
        message: params[:message],
        item_id: @item.id
      )

    end
  end
  
  def update
    item = Item.find_by(id: params[:id])
    item.update(item_params)
    redirect_to item_path(item)
  end

  def deals_index
    @item = Item.find(params[:id])
    @deals = @item.deals
    render template: 'deal/show'
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