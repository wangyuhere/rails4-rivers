class AddTypeOfMediaToPearl < ActiveRecord::Migration
  def change
    add_column :pearls, :type_of_media, :string
  end
end
