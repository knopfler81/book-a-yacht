class AddCabinToYachts < ActiveRecord::Migration[5.0]
  def change
  	add_column :yachts, :cabins, :integer
  end
end
