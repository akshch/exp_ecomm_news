class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :slug
      t.string :name
      t.references :news, foreign_key: true

      t.timestamps
    end
  end
end
