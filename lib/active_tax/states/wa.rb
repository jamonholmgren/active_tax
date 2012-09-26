module ActiveTax
  module States
    module WA
      require 'net/http' # Needed for HTTP requests
      
      module_function

      API_URI = "http://dor.wa.gov/AddressRates.aspx"

      def rate(address={})
        # http://dor.wa.gov/AddressRates.aspx?output=text&addr=6500%20Linderson%20way&city=&zip=98501
        params = {
          output: "text",
          addr: "#{address[:address]}",
          city: "#{address[:city]}",
          zip: "#{address[:zip]}"
        }

        uri = URI("#{API_URI}#{options_string}")
        uri.query = URI.encode_www_form(params)

        res = Net::HTTP.get_response(uri)

        # LocationCode=3406 Rate=0.087 ResultCode=0
        if res.is_a?(Net::HTTPSuccess)
          result = parse_result(res.body)
          return result["Rate"].to_f
        else
          return false
        end
      end

      def parse_result(text)
        r = {}
        items = text.split(" ")
        items.each do |item|
          k, v = item.split("=")
          r[k] = v
        end
        r
      end
    end
  end
end