class AddVideosTable < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :url
      t.timestamps
    end
  end
end