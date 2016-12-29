# Whois::Api

## Usage

## Installation

Add this line to your application's Gemfile:

```ruby
# whois-hash is already marked as dependency, but unfortunately not published in rubygems yet
gem 'whois-hash', :github => 'dayflower/whois-hash'
gem 'whois-api', :github => 'dayflower/whois-api'
```

And then execute:

    $ bundle

Then write following `config.ru`

```ruby
require "whois/api"

run Whois::Api.new
```

And then execute:

    $ bundle exec rackup

Enjoy it!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dayflower/whois-api.
