class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      #t.integer :category_id, null: false
      t.string :name, null: false
      t.text :introduction
      t.string :quality, null: false
      t.boolean :characteristics, null: false, default: true
      t.string :praice

      t.timestamps
    end
  end
end
