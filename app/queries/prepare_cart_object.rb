class PrepareCartObject
  def initialize
    @items = Item.all.includes(:product)
  end

  def call
    {
        items: prepare_items
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
end