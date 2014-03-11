# ActiveTax

A Ruby gem for retrieving local sales tax rates from various government APIs. Currently
only supports Washington State sales tax, but feel free to write your own state's implementations
and do pull requests.

## Installation

Add this line to your application's Gemfile:

    gem 'active_tax'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_tax

## Usage

```ruby

tax_rate = ActiveTax::Tax.rate({
  address: "6500 Linderson Way",
  city: "",
  zip: "98501",
  state: "WA"
})

puts tax_rate #=> 0.087
```

## Contributing

Contributions are very welcome!

1. Fork it
2. Commit your changes (`git commit -am 'Added some feature'`)
3. Push to the branch (`git push origin my-new-feature`)
4. Create new Pull Request

## License

MIT
