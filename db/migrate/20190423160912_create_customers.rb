class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :uid, uniq: true, null: false
      t.integer :birthdate
      t.timestamps
    end
  end
end
