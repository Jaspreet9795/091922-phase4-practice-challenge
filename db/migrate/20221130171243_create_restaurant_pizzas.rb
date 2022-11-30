class CreateRestaurantPizzas < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurant_pizzas do |t|
      t.belongs_to :pizza 
      t.belongs_to :restaurant 
      t.integer :price

      t.timestamps
    end
  end
end
