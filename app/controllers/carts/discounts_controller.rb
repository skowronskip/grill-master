class Carts::DiscountsController < ApplicationController
  def create
    Discount.create(discount_params)
    object = PrepareCartObject.new
    render json: object.call
  end

  private

  def discount_params
    params.require(:discount).permit(:id, :kind, :name, :count, :price, product_ids: []);
  end
end