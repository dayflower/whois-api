# Whois::Api

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/dayflower/whois-api/tree/app)

Provides Whois JSON API server

## Installation

Add these lines to your application's Gemfile:

```ruby
# whois-hash is already marked as dependency, but unfortunately not published in rubygems yet
gem 'whois-hash', :github => 'dayflower/whois-hash'
gem 'whois-api', :github => 'dayflower/whois-api'
```

And then execute:

    $ bundle

## Usage

Simply execute:

    $ bundle exec whois-api-server

Or you can setup web app with your own `config.ru` like:

```ruby
require "whois/api"

run Whois::Api.new
```

Specify domain name on query with URL path, then you'll get:

```
$ curl -i http://localhost:9292/iana.org
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 8628
Server: WEBrick/1.3.1 (Ruby/2.2.5/2016-04-26)
Date: Fri, 13 Jan 2017 13:20:39 GMT
Connection: Keep-Alive

{
  "disclaimer": "Access to ...... snip ......",
  "domain": "iana.org",
  "domain_id": "D1073204-LROR",
  "status": [
    "serverDeleteProhibited https://icann.org/epp#serverDeleteProhibited",
    "serverRenewProhibited https://icann.org/epp#serverRenewProhibited",
    "serverTransferProhibited https://icann.org/epp#serverTransferProhibited",
    "serverUpdateProhibited https://icann.org/epp#serverUpdateProhibited"
  ],
  "available?": false,
  "registered?": true,
  "created_on": "1995-06-05T04:00:00Z",
  "updated_on": "2015-07-07T17:20:50Z",
  "expires_on": "2017-12-08T17:00:53Z",
  "registrar": {
  },
  "registrant_contacts": [
    {
      "id": "CR12376519",
      "type": 1,
      "name": "Domain Administrator",
      "organization": "ICANN",
      "address": "12025 Waterfront Drive\nSuite 300",
      "city": "Los Angeles",
      "zip": "90094-2536",
      "state": "California",
      "country": null,
      "country_code": "US",
      "phone": "+1.4242171313",
      "fax": "+1.4242171313",
      "email": "domain-admin@icann.org",
      "url": null,
      "created_on": null,
      "updated_on": null
    }
  ],
  ...... snip ......
```

Enjoy!

## See also

This module depends heavily on following great gems.

- https://github.com/weppos/whois
- https://github.com/weppos/whois-parser

To derive hash form of whois record, following module is used.

- https://github.com/dayflower/whois-hash

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dayflower/whois-api.
