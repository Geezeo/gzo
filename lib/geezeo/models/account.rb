module Geezeo

  # The account information model
  #
  # == Fields
  # [+id+] (READONLY) the id of the account
  # [+name+] (REQUIRED) the name of the account
  # [+balance+] (REQUIRED) the balance of the account
  # [+reference_id+] the reference id of the account
  # [+aggregation_type+] the aggregation type of the account
  # [+state+] the state of the account
  # [+harvest_updated_at+] the harvest updated at of the account
  # [+account_type+] the account type of the account
  # [+fi+] the fi of the account
  class Account < Hashie::Mash
    def recent_transactions
      transactions_adapter.find(self).flatten
    end

    def transactions(transaction_id="")
      transactions_adapter.find_all(self, transaction_id).flatten
    end

    def transactions_adapter
      Geezeo::Adapters::Transactions.new(self.credentials)
    end
  end
end