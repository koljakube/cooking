class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.references :cook
      t.date :date
      t.integer :amount

      t.timestamps
    end
  end
end
