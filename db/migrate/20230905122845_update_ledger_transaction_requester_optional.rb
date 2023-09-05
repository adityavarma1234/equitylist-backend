class UpdateLedgerTransactionRequesterOptional < ActiveRecord::Migration[7.0]
  def change
    change_column :ledger_transactions, :requester_id, :integer, null: true
  end
end
