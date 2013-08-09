class CreateRivers < ActiveRecord::Migration
  def change
    create_table :rivers do |t|
      t.string :name
      t.string :url
      t.datetime :fetched_at

      t.timestamps
    end
  end
end
