class Meals < ActiveRecord::Migration[5.2]
  def change
      create_table :meals do |t|
        t.string :foodType
        t.string :name
        t.integer :calories
        t.integer :fats
        t.integer :protein
        t.integer :carbs
        t.integer :user_id
      end
  end
end
