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

  IPV4_TO_ASN_MAP_URL = "https://iptoasn.com/data/ip2asn-v4.tsv.gz".freeze
  IPV4_TO_ASN_MAP_URL_as_u32 = "https://iptoasn.com/data/ip2asn-v4-u32.tsv.gz".freeze

  def self.download_ipv4_to_asn_map(**options)
    if options[:file]
      if File.file?(options[:file]) 
        raise "File #{options[:file]} already exists!"
      end
    end
    if options[:u32]
      url = IPV4_TO_ASN_MAP_URL_as_u32
    else
      url = IPV4_TO_ASN_MAP_URL
    end   
    resp = Unirest.get url
    if resp.code != 200
      raise resp.body
    end
    reader = Zlib::GzipReader.new(StringIO.new(resp.raw_body))
    if options[:file]
      IO.copy_stream(reader, options[:file])
      reader = Zlib::GzipReader.new(StringIO.new(resp.raw_body)) # remake reader stream
    end
    if block_given?
      until reader.eof?
        yield reader.readline 
      end
    else
      return reader.read
    end
  end  

  IPV6_TO_ASN_MAP_URL = "https://iptoasn.com/data/ip2asn-v6.tsv.gz".freeze

  def self.download_ipv6_to_asn_map(**options)
    if options[:file]
      if File.file?(options[:file]) 
        raise "File #{options[:file]} already exists!"
      end
    end
    resp = Unirest.get IPV6_TO_ASN_MAP_URL 
    if resp.code != 200
      raise resp.body
    end
    reader = Zlib::GzipReader.new(StringIO.new(resp.raw_body))
    if options[:file]
      IO.copy_stream(reader, options[:file])
      reader = Zlib::GzipReader.new(StringIO.new(resp.raw_body)) # remake reader stream
    end
    if block_given?
      until reader.eof?
        yield reader.readline 
      end
    else
      return reader.read
    end
  end  

  IP_TO_ASN_MAP_URL = "https://iptoasn.com/data/ip2asn-combined.tsv.gz".freeze

  def self.download_ip_to_asn_map(**options)
    if options[:file]
      if File.file?(options[:file]) 
        raise "File #{options[:file]} already exists!"
      end
    end
    resp = Unirest.get IP_TO_ASN_MAP_URL 
    if resp.code != 200
      raise resp.body
    end
    reader = Zlib::GzipReader.new(StringIO.new(resp.raw_body))
    if options[:file]
      IO.copy_stream(reader, options[:file])
      reader = Zlib::GzipReader.new(StringIO.new(resp.raw_body)) # remake reader stream
    end
    if block_given?
      until reader.eof?
        yield reader.readline 
      end
    else
      return reader.read
    end
  end  
end
