# app/models/transaction_party.rb
class TransactionParty < ApplicationRecord
  self.inheritance_column = :_type_disabled 

  has_many :ledger_transactions_as_requester, class_name: 'LedgerTransaction', foreign_key: 'requester_id', dependent: :destroy
  has_many :ledger_transactions_as_source, class_name: 'LedgerTransaction', foreign_key: 'source_id', dependent: :destroy
  has_many :ledger_transactions_as_destination, class_name: 'LedgerTransaction', foreign_key: 'destination_id', dependent: :destroy


end
