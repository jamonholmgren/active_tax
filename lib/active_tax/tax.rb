module ActiveTax
  class Tax
    attr_accessor :state, :api_class

    def self.rate(address={})
      raise StandardError, "You must provide a state to use ActiveTax::Tax.rate" unless address[:state]
      self.new(address[:state]).rate_from_address(address)
    end

    def initialize(state)
      self.state = state
    end

    def rate_from_address(address={})
      self.state = address[:state] if address[:state]

      case self.state.upcase
      when "WA"
        self.api_class = States::WA
      else
        raise StandardError, "API for #{self.state.upcase} not yet implemented in ActiveTax."
      end

      self.api_class.rate(address)
    end
  end
end