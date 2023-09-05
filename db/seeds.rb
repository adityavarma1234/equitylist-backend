# Sample Ledger Transaction
ledger_transaction = LedgerTransaction.create(
  activity_id: "1",
  date: "2014-10-01T01:00:29+00:00",
  transaction_type: "DEPOSIT",
  method: "ACH",
  amount: 1003.75,
  balance: 1003.75
)

# Create Requester, Source, and Destination Transaction Parties
requester = TransactionParty.create(
  type: "INVESTMENT"
)

source = TransactionParty.create(
  type: "EXTERNAL",
  description: "Chase ** 9867"
)

destination = TransactionParty.create(
  type: "INVESTOR",
  description: "Michael Daugherty"
)

# Associate Transaction Parties with the Ledger Transaction
ledger_transaction.requester = requester
ledger_transaction.source = source
ledger_transaction.destination = destination

# Save the Ledger Transaction with associated parties
ledger_transaction.save
