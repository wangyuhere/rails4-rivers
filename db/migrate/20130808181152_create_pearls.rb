class CreatePearls < ActiveRecord::Migration
  def change
    create_table :pearls do |t|
      t.integer :river_id
      t.string :url
      t.string :header
      t.text :summary
      t.string :image
      t.datetime :published_at

      t.timestamps
    end
  end
end
