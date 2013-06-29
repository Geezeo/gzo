module Geezeo

  # The transaction model
  #
  # == Fields
  # [+id+] (READONLY) the id of the transaction
  # [+reference_id+] the reference id of the transaction
  # [+transaction_type+] (REQUIRED) the type of transaction (Credit or Debit)
  # [+memo+] the memo of the transaction
  # [+balance+] (REQUIRED) the balance of the transaction
  # [+posted_at+] when the transaction was posted
  # [+created_at+] when the transaction record was created
  # [+nickname+] the nickname of the transaction
  # [+original_name+] the original name of the transaction
  # [+check_number+] the check number of the transaction
  # [+tags+] tags associated with the transaction
  class Transaction < Hashie::Mash; end
end