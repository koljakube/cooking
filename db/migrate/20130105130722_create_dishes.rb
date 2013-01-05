class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end
