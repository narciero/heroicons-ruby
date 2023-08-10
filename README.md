# heroicons-ror

A simple Heroicons helper for Ruby on Rails.

This library is used in production in numerous applications and given that I use TailwindCSS in all my projects, I'm highly incentivized to keep things up to date here. I can also guarantee that semantic versioning will be followed to ensure a stable API.

## Usage

```erb
<%= heroicon "arrow-right", variant: :mini %>

<!-- You can provide any HTML attributes you want for the rendered SVG -->
<%= heroicon "arrow-right", variant: :mini, class: "h-4 w-4", fill: "none" %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/heroicons_rails.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
