module ActiveTax
  class Tax
    attr_accessor :state, :address, :api_class

    def self.rate(address={})
      raise StandardError, "You must provide a state to use ActiveTax::Tax.rate" unless address[:state]
      self.new(address).rate
    end

    def initialize(address)
      self.state = address[:state]
      self.address = address

      determine_state_api
    end

    def rate_from_address(address={})
      raise "#rate_from_address is deprecated. Use #rate instead."
    end

    def tax
      @tax ||= self.api_class.tax(address)
    end

    def rate
      tax && tax.rate
    end

    def location_code
      tax && tax.location_code
    end

    def result_code
      tax && tax.result_code
    end

    private

    def determine_state_api
      case self.state.upcase
      when "WA", "WASHINGTON" then self.api_class = States::WA
      else raise StandardError, "API for #{self.state.upcase} not yet implemented in ActiveTax."
      end
    end

    def api_data

    end
  end
end
