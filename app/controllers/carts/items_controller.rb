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

  def update
    begin
      item = Item.find(params[:id])
      quantity = params[:quantity] || 1
      if quantity > 0
        item.update_attributes(item_params)
      else
        Item.destroy(params[:id])
      end
      object = PrepareCartObject.new
      render json: object.call
    rescue
      render json: {error: "Item not found"}
    end
  end

  private

  def item_params
    params.require(:item).permit(:id, :product_id, :quantity);
  end
end