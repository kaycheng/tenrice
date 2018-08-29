class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :title
      t.text :description
      t.string :open_hours
      t.string :photo

      t.timestamps
    end
  end
end
