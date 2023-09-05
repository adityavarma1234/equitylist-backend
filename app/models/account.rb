# app/models/account.rb
class Account < ApplicationRecord
  has_many :ledger_transactions, dependent: :destroy

  validates :balance, numericality: true
end
