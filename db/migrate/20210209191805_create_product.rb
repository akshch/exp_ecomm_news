class CreateProduct < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :material_code, null: false
      t.string :category, null: false
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :products, :material_code, unique: true
  end
end
