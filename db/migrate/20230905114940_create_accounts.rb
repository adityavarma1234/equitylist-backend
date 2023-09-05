class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :description, null: false
      t.decimal :balance, precision: 10, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
