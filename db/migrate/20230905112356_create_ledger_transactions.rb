class CreateLedgerTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :ledger_transactions do |t|
      t.string :activity_id, null: false
      t.datetime :date, null: false
      t.string :transaction_type, null: false
      t.string :method, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.decimal :balance, precision: 10, scale: 2, null: false

      t.references :requester, foreign_key: { to_table: :transaction_parties }
      t.references :source, foreign_key: { to_table: :transaction_parties }
      t.references :destination, foreign_key: { to_table: :transaction_parties }

      t.timestamps
    end
  end
end
