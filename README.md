# Ratonvirus::Resty

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/ratonvirus/resty`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ratonvirus-resty'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ratonvirus-resty

## Usage

### Rails Integration
When using rails you can use a generator to create an initializer to configure
this gem:

```bash
$ rails generate ratonvirus-resty:install
```

### How do I configure the API endpoints.

You can set defaults in the generated initializer:

    # config/initializers/ratonvirus-resty.rb
    GetAgApi.configure do |config|
      config.service_url = ENV.fetch('RESTY_SERVICE_URL', 'http://localhost:9000/scan')
      config.username = ENV.fetch('RESTY_USERNAME', nil) # optional
      config.password = ENV.fetch('RESTY_PASSWORD', nil) # optional
      config.proxy_url = ENV.fetch('PROXY_URL', nil) # optional
    end

These value are overridden by following environment variables:

* RESTY_SERVICE_URL
* RESTY_USERNAME
* RESTY_PASSWORD



## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ratonvirus-resty.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
