class Removecategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :games, :category
  end
end
