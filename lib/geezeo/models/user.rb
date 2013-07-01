module Geezeo

  # The user information model
  #
  # == Fields
  # [+id+] (READONLY) the id of the user
  # [+partner_customer_id+] the partner customer id of the user
  # [+first_name+] the first name of the user
  # [+last_name+] the last name of the user
  class User < Hashie::Mash; end
end
