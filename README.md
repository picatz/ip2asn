# Ip2asn
> IP address to autonomous system number (ASN)

This library uses the free IP-to-ASN service provided by [iptoasn.com](https://iptoasn.com/)  

## Installation

    $ gem install ip2asn

## Usage

```ruby
require 'ip2asn'

IP2ASN.check("8.8.8.8")
# => {
#      "announced"=>true,
#      "as_country_code"=>"US",
#      "as_description"=>"GOOGLE - Google LLC",
#      "as_number"=>15169,
#      "first_ip"=>"8.8.8.0",
#      "ip"=>"8.8.8.8",
#      "last_ip"=>"8.8.8.255"
# }
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
