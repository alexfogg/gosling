class AddAudiosTable < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :name
      t.text :url
      t.timestamps
    end
  end
end