class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :category, null: false
      t.float :preparation_time, null: false
      t.float :cooking_time, null: false
      t.text :ingredients, null: false
      t.text :instructions, null: false
      t.integer :serving, null: false
      t.string :dificulty, null: false
      t.boolean :vegetarian

      t.string :image
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
