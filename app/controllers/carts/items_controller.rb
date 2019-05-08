class Carts::ItemsController < ApplicationController
  def create
    product_id = params[:product_id]
    quantity = params[:quantity] || 1
    if quantity > 0
      Item.create({product_id: product_id, quantity: quantity})
    end
    object = PrepareCartObject.new
    render json: object.call
  end

  private

  def item_params
    params.require(:item).permit(:id, :product_id, :quantity);
  end
end