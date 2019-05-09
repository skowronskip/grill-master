class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.integer :kind
      t.text :name
      t.integer :product_ids, array: true, default: []
      t.float :price
      t.integer :count

      t.timestamps
    end
  end
end
