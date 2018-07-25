class ItemsController < ApplicationController

  def new

  end

  private
  def item_params
    params.require(:item).permit(
      :name
      :description
      :price
    )
  end
end