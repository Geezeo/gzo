require "coveralls"
Coveralls.wear!

require "pry"

require "webmock/rspec"
require "vcr"

require "geezeo"

if ENV["VCR_RECORD"]
  require "geezeo/local_credentials"
else
  Geezeo.configure do |config|
    config.api_key = "abc123"
    config.user_id = "testy"
  end
end

RSpec.configure do |config|

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end
