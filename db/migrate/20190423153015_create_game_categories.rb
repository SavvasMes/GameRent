class CreateGameCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :game_categories do |t|
      t.string :name, uniq: true, null: false
      t.string :description

      t.timestamps
    end
    add_reference(:games, :game_category)
  end
end

