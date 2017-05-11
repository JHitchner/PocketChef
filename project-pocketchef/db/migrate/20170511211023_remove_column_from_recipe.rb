class RemoveColumnFromRecipe < ActiveRecord::Migration[5.1]
  def change
    remove_column :recipes, :ingredients, :string
  end
end
