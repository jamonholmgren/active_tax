require_relative './test_helper'

class TestTax < Minitest::Unit::TestCase
  def test_real_rate
    puts "test_real_rate"
    rate = ActiveTax::Tax.rate({
      address: "6500 Linderson Way",
      city: "",
      zip: "98501",
      state: "WA"
    })

    assert_in_delta rate * 100.0, 8.2, 2.5 # 8.2%, within about 2.5%
  end

  def test_bad_rate
    rate = ActiveTax::Tax.rate({
      address: "",
      city: "",
      zip: "",
      state: "WA"
    })

    assert_equal rate, -1
  end
end
