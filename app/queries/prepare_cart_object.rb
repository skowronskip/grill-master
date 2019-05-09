class PrepareCartObject
  def initialize
    @items = Item.all.includes(:product)
    @discounts = Discount.all
  end

  def call
    {
        items: prepare_items,
        discounts: prepare_discounts
    }
  end

  private

  def prepare_items
    @items.map do |item|
      {
          id: item[:id],
          quantity: item[:quantity],
          product: {
              id: item.product[:id],
              name: item.product[:name],
              price: item.product[:price]
          }
      }
    end
  end

  def prepare_discounts
    @discounts.map do |item|
      {
          id: item[:id],
          kind: item[:kind],
          name: item[:name],
          product_ids: item[:product_ids],
          price: item[:price],
          count: item[:count]
      }
    end
  end
end