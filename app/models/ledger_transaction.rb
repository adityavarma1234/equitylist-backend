# app/models/ledger_transaction.rb
class LedgerTransaction < ApplicationRecord
  validates :activity_id, presence: true
  validates :date, presence: true
  validates :transaction_type, presence: true
  validates :method, presence: true
  validates :amount, presence: true, numericality: true
  validates :balance, presence: true, numericality: true

  belongs_to :requester, class_name: 'TransactionParty', foreign_key: 'requester_id', dependent: :destroy, optional: true
  belongs_to :source, class_name: 'TransactionParty', foreign_key: 'source_id', dependent: :destroy
  belongs_to :destination, class_name: 'TransactionParty', foreign_key: 'destination_id', dependent: :destroy
  belongs_to :account, class_name: 'Account', foreign_key: 'account_id'

  enum type: { DEPOSIT: 'DEPOSIT', WITHDRAWAL: 'WITHDRAWAL', TRANSFER: 'TRANSFER' }

  self.inheritance_column = :_type_disabled

end
