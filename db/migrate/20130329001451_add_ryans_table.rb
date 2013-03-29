class AddRyansTable < ActiveRecord::Migration
  def change
    create_table :ryans do |t|
      t.string :name
      t.text :img
      t.timestamps
    end
  end
end
