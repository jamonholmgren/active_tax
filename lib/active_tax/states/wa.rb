module ActiveTax
  module States
    class WA
      API_URI = "http://webgis.dor.wa.gov/webapi/AddressRates.aspx/text"

      def self.tax(address={})
        raise StandardError.new("You must provide a street address to access Washington State sales tax rates. #{address.inspect}") if !address[:address]

        # http://webgis.dor.wa.gov/webapi/AddressRates.aspx/text?output=text&addr=6500+Linderson+Way&city=Tumwater&zip=98501
        params = {
          output: "text",
          addr: "#{address[:address]}",
          city: "#{address[:city]}",
          zip: "#{address[:zip]}"
        }

        require 'net/http' # Needed for HTTP requests

        uri = URI("#{API_URI}")
        uri.query = URI.encode_www_form(params)

        res = Net::HTTP.get_response(uri)

        # LocationCode=3406 Rate=0.087 ResultCode=0
        if res.is_a?(Net::HTTPSuccess)
          normalize(self.parse_result(res.body))
        else
          false
        end
      end

      def self.rate(address={})
        tax_data = tax(address)
        tax_data && tax_data.rate
      end

      def self.parse_result(text)
        r = {}
        items = text.split(" ")
        items.each do |item|
          k, v = item.split("=")
          r[k] = v
        end
        r
      end

      def self.normalize(tax_data)
        Struct.new(:rate,                 :location_code,           :result_code)
              .new(tax_data["Rate"].to_f, tax_data["LocationCode"], tax_data["ResultCode"])
      end
    end
    WASHINGTON = WA unless defined?(WASHINGTON)
  end
end
