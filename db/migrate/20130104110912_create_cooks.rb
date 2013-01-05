class CreateCooks < ActiveRecord::Migration
  def change
    create_table :cooks do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
