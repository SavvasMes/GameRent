class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name, null: false, uniq: true
      t.string :platform
      t.string :category
      t.integer :release_date
      t.text :description
      t.timestamps
    end
  end
end
