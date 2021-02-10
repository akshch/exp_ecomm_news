class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :author
      t.string :title
      t.text :description
      t.string :url
      t.string :image_url
      t.datetime :published_at
      t.text :content

      t.timestamps
    end
  end
end
