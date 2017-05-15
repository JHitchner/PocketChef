class AddColumnToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :search, :string
  end
end
