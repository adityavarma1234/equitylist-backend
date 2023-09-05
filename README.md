# Backend for equitylist

```
bundle install
rails runner db/seed_data.rb # to seed data
```

Here account has many ledger transactions which inturn has source, requester and destination. Based on the transaction the account balance keeps getting updated