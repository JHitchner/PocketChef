class AddColumnsToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :title, :string
    add_column :recipes, :date, :date
  end
end
