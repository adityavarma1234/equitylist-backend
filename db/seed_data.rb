# db/seed_data.rb
require 'json'

# Load JSON data from the file
json_file_path = Rails.root.join('db', 'data', 'complicated_ledger.json')
json_data = JSON.parse(File.read(json_file_path))

# Loop through each transaction in the JSON data and create database records
json_data.each do |transaction_data|

  ledger_transaction = LedgerTransaction.find_or_initialize_by(
    activity_id: transaction_data['activity_id'],
    date: transaction_data['date'],
    transaction_type: transaction_data['type'],
    method: transaction_data['method'],
    amount: transaction_data['amount'],
    balance: transaction_data['balance']
  )

  # Create Requester, Source, and Destination Transaction Parties
  requester_data = transaction_data['requester']
  if requester_data
    requester = TransactionParty.create(
      type: requester_data['type']
    )
  end

  source_data = transaction_data['source']
  source = TransactionParty.find_or_initialize_by(id: source_data['id'])
  source.update!(
    type: source_data['type'],
    description: source_data['description']
  )


  destination_data = transaction_data['destination']
  destination = TransactionParty.find_or_initialize_by(id: destination_data['id'])
  destination.update!(
    type: destination_data['type'],
    description: destination_data['description']
  )

  account = Account.find_or_initialize_by(description: destination_data['description'])
  account.balance = transaction_data['balance']
  account.save

  # Associate Transaction Parties with the Ledger Transaction
  ledger_transaction.requester = requester
  ledger_transaction.source = source
  ledger_transaction.destination = destination
  ledger_transaction.account = account

  # Save the Ledger Transaction with associated parties
  ledger_transaction.save
end
