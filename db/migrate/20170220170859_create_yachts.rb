class CreateYachts < ActiveRecord::Migration[5.0]
  def change
    create_table :yachts do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :price
      t.string :photos
      t.integer :length
      t.integer :width
      t.integer :capacity
      t.boolean :available, default: true
      t.boolean :air_c
      t.integer :crew
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
