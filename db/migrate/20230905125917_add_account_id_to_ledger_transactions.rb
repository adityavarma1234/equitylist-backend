class AddAccountIdToLedgerTransactions < ActiveRecord::Migration[7.0]
  def change
    add_reference :ledger_transactions, :account, null: false, foreign_key: true
  end
end
