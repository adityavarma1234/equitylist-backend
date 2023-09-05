class Api::TransactionsController < ApplicationController
  def index
	 # For less complexity picking up first values always instead of providing sign up for specific account
    @ledger_transactions = Account.first.ledger_transactions
    # Select the desired attributes for the JSON response
    json_response = @ledger_transactions.map do |transaction|
      {
      	id: transaction.id,
        date: transaction.date,
        transaction_type: transaction.transaction_type,
        description: transaction.destination&.description, # Assuming you want the destination description
        amount: transaction.amount,
        balance: transaction.balance
      }
    end

    render json: json_response
  end
end
