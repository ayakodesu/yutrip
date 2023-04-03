class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name, null: false
      t.text :introduction
      t.integer :quality, null: false
      t.integer :characteristics, null: false
      t.integer :praice
      t.integer :category_id, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps
    end
  end
end
