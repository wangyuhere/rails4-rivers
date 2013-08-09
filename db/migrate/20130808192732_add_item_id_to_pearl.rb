class AddItemIdToPearl < ActiveRecord::Migration
  def change
    add_column :pearls, :item_id, :string
  end
end
