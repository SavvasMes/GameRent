class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :game
      t.references :customer
      t.datetime :return_date
      t.text :comments
      t.timestamps
    end
  end
end
