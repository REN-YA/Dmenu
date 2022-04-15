class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer      :store_id
      t.integer      :category_id
      t.integer      :genre_id
      t.string      :name
      t.integer      :selling_price
      t.integer      :cost
      t.integer      :cost_rate
      t.text      :material
      t.text      :make
      
      t.timestamps
    end
  end
end
