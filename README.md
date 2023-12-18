# heroicons-ruby

[![Gem Version](https://badge.fury.io/rb/heroicons-ruby.svg)](https://badge.fury.io/rb/heroicons-ruby)
[![Heroicons Version](https://img.shields.io/badge/heroicons-v2.1.0-8B5CF6)](https://heroicons.com)

A simple Heroicons helper for Ruby on Rails.

```sh
bundle add heroicons-ruby
```

## Usage

```erb
<!-- Render plain Heroicon SVG -->
<%= heroicon "arrow-right" %>

<!-- Use non-default variant -->
<%= heroicon "arrow-right", variant: :mini %>

<!-- Provide HTML attributes for the rendered SVG -->
<%= heroicon "arrow-right", class: "h-4 w-4", fill: "none" %>
```


## Configuration
Valid `variant` values are `%i[micro mini solid outline]`. The default variant is `solid` however that default can be changed using:

```ruby
# config/initializers/heroicons.rb
Heroicons.configure do |config|
  config.variant = :mini
end
```

If you would like to specify default HTML attributes (eg. `class="h-4 w-4"`) for a given `variant`, you can configure that like so:

```ruby
# config/initializers/heroicons.rb
Heroicons.configure do |config|
  config.attributes[:mini] = { class: "h-4 w-4" }
end
```

### Rationale

> Don't libraries already exist for this? Why make another?

The key differences between `heroicons-ruby` and others are:

- Can be used without Rails (no need to pull in entire Rails dependency if not needed)
- Renders exact Heroicons SVG identical to those found in [the official repo](https://github.com/tailwindlabs/heroicons/tree/master/optimized). No transformations / differences from the official SVGs to worry about.
  - This also makes it very easy to keep this library up to date. On each new Heroicons release, all that needs to be done is a copy-paste of the official icons to the `/icons` folder.
- Very thin API wrapper around `<svg>` making it easy and concise to configure HTML attributes.
  ```erb
  <%= heroicon "check", class: "h-4 w-4" %>
  ```
- This library is used in production in numerous applications and given that I use TailwindCSS in all my projects, I'm highly incentivized to keep things up to date here. I can also guarantee that semantic versioning will be followed to ensure a stable API.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/narciero/heroicons-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
