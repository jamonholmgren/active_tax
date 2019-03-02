require_relative './test_helper'

class TestTax < Minitest::Test
  def test_real_rate
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

    assert_equal rate, false
  end

  def test_other_tax_info
    tax = ActiveTax::Tax.new({
      address: "6500 Linderson Way",
      city: "Tumwater",
      zip: "98501",
      state: "WA"
    })

    assert_in_delta tax.rate * 100.0, 8.2, 2.5 # 8.2%, within about 2.5%
    assert_equal tax.location_code, "3406"
    assert_equal tax.result_code, "2"
  end

  def test_missing_info
    tax = ActiveTax::Tax.new({
      city: "Seattle",
      zip: "98102",
      state: "WA"
    })

    assert_raises StandardError do
      tax.result_code
    end
  end
end
