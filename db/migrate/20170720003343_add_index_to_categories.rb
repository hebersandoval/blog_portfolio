class AddIndexToCategories < ActiveRecord::Migration[5.0]
  def change
    add_index :categories, :slug
  end
end
