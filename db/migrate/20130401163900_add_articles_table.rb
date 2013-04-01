class AddArticlesTable < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :url
      t.text :summary
      t.string :pub
      t.text :guid
      t.timestamps
    end
  end
end
