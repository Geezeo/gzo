[![Build Status](https://travis-ci.org/fuzz/geezeo.png?branch=master)](https://travis-ci.org/fuzz/geezeo)
[![Code Climate](https://codeclimate.com/github/fuzz/geezeo.png)](https://codeclimate.com/github/fuzz/geezeo)
[![Coverage Status](https://coveralls.io/repos/fuzz/geezeo/badge.png?branch=master)](https://coveralls.io/r/fuzz/geezeo?branch=master)

# Geezeo

A simple Ruby wrapper for the Geezeo API

## Installation

Add this line to your application's Gemfile:

    gem "geezeo"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install geezeo


## Contributing

### Credentials
The tests will run without credentials using the included VCR cassettes.

If you wish to record new cassettes please set VCR_RECORD.

	bundle exec rspec VCR_RECORD=true

For this to work you must have a file ~/.geezeo/credentials.rb with valid
Geezeo API credentials.

	```ruby
	Geezeo.configure do |config|
      config.api_key = "abc123"
      config.user_id = "testy"
    end
    ```

If you wish to contribute your cassettes back to the project please anonymize
them by replacing all occurrences of your api_key and user_id with "abc123"
and "testy" respectively. This will be necessary in order for further test
runs to pass without setting VCR_RECORD.


1. Fork it
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create new Pull Request
