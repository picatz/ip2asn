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

Get raw JSON response:
```ruby
raw_json = IP2ASN.check("8.8.8.8" json: true)
```

Download the [IPv4 to ASN map](https://iptoasn.com/data/ip2asn-v4.tsv.gz) and save the file as `ipv4.tsv`:
```ruby
IP2ASN.download_ipv4_to_asn_map(file: "ipv4.tsv")
```

Download the [IPv4 to ASN map](https://iptoasn.com/data/ip2asn-v4-u32.tsv.gz) and save the file as `ipv4_u32.tsv` with IPv4 addresses as 32-bit unsigned integers:
```ruby
IP2ASN.download_ipv4_to_asn_map(file: "ipv4_u32.tsv", u32: true)
```

Read content of the IPv4 map, line by line (this time not saving to a file):
```ruby
IP2ASN.download_ipv4_to_asn_map do |line|
  # do something with line from file
  puts line
end
```

Download the [IPv6 to ASN map](https://iptoasn.com/data/ip2asn-v6.tsv.gz) and save the file as `ipv6.tsv`:
```ruby
IP2ASN.download_ipv6_to_asn_map(file: "ipv6.tsv")
```

Download the combined [IPv4+IPv6 to ASN map](https://iptoasn.com/data/ip2asn-combined.tsv.gz) and save the file as `ip.tsv`:
```ruby
IP2ASN.download_ip_to_asn_map(file: "ip.tsv")
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
