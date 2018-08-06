class DealsController < ApplicationController

  def new
    @deal = Deal.new
  end

  def create
    @deal = Deal.new(deal_params)
    if @deal.save
      redirect_to item_deal_path(@deal)
    else
      render :new
    end
  end

  def edit
    @deal = Deal.find_by(id: params[:id])
  end

  def index
    if params[:item_id]
      @item = Item.find_by(id: params[:item_id])
      if @item.nil?
        redirect_to items_path, alert: "Item not found"
      else
        @deals = @item.deals
      end
    end

    @deals = Deal.all
  end

  def show
    if params[:item_id]
      @item = Item.find_by(id: params[:item_id])
      @deal = @item.deals.find_by(id: params[:id])
      if @item.nil?
        redirect_to item_deals_path(@item), alert: "Deal not found"
      end
    else
      @deal = Deal.find(params[:id])
    end
  end

  private
  def deal_params
    params.permit(
      :price,
      :amount,
      :message,
      :item_id
    )
  end 

end