[![Build Status](https://travis-ci.org/fuzz/geezeo.png?branch=master)](https://travis-ci.org/fuzz/geezeo)
[![Code Climate](https://codeclimate.com/github/fuzz/geezeo.png)](https://codeclimate.com/github/fuzz/geezeo)
[![Coverage Status](https://coveralls.io/repos/fuzz/geezeo/badge.png?branch=master)](https://coveralls.io/r/fuzz/geezeo?branch=master)
[![Dependency Status](https://gemnasium.com/fuzz/geezeo.png?travis)](https://gemnasium.com/fuzz/geezeo)

# Geezeo

A simple Ruby wrapper for the Geezeo API

## Installation

Add this line to your application's Gemfile:

    gem "geezeo"

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install geezeo

## Usage

```ruby
client = Geezeo.client("my-api-key", "my-user-id")

# For more methods read through spec/functional or generate the yard doc
client.accounts             # return all accounts
client.accounts.find(123)   # return account 123
client.user                 # return current user
```

Alternately you can set up local credentials using a configure block inside a
file named ~/.geezeo/credentials.rb

```ruby
Geezeo.configure do |config|
  config.api_key = "abc123"
  config.user_id = "testy"
end
```

Once your local credentials are set up you can instantiate a client with

```ruby
client = Geezeo.c
```

You will need local credentials set up if you wish to record VCR cassettes
(see below).

## Contributing

### Credentials

The tests will run without credentials using the included VCR cassettes.

If you wish to record new cassettes please set VCR_RECORD. You may want to
delete any cassettes being re-recorded to ensure consistency.

	bundle exec rake VCR_RECORD=true

For this to work you must have a ~/.geezeo/credentials.rb file with valid
Geezeo API credentials.

```ruby
Geezeo.configure do |config|
  config.api_key = "abc123"
  config.user_id = "testy"
end
```

When you are finished recording you must anonymize your cassettes to strip out
your real credentials. Running tests without VCR_RECORD set will fail until
you do this.

	bundle exec rake vcr:anonymize

### Pull requests

1. Fork it
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create new Pull Request
