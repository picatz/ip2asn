require "unirest"
require "ip2asn/version"

module IP2ASN
  URL = "https://api.iptoasn.com/v1/as/ip/".freeze
  
  def self.check(ip_address, json: false)
    resp = Unirest.get URL + ip_address
    if resp.code != 200
      raise resp.body
    end
    return resp.body unless json
    return resp.raw_body
  end
end
