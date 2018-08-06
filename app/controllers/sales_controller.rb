class SalesController < AppicationController

  def create
    sale = Sale.create(sale_params)
    redirect_to user_path(sale.user)
  end

  private
  def sale_params
    params.require(:sake).permit(
      :user_id,
      :item_id
    )
  end
end