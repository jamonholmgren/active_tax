# ActiveTax

A Ruby gem for retrieving local sales tax rates from various government APIs.
Currently only supports Washington State sales tax, but feel free to write your
own state's implementations and do pull requests.

## Installation

Add this line to your application's Gemfile:

    gem 'active_tax'

## Usage

```ruby
tax = ActiveTax::Tax.new({
  address: "6500 Linderson Way",
  city: "Tumwater",
  state: "WA", # must be two-letter state abbreviation
  zip: "98501",
})

# tax is a Struct with #rate, #location_code, and #result_code properties.

puts tax.rate #=> 0.087
puts tax.location_code #=> "3406"
puts tax.result_code #=> "0"
```

## Contributing

Contributions are very welcome!

1. Fork it
2. Commit your changes (`git commit -am 'Added some feature'`)
3. Push to the branch (`git push origin my-new-feature`)
4. Create new Pull Request

## License

MIT
