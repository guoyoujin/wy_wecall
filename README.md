# WyWecall

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/wy_wecall`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wy_wecall'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wy_wecall

## Usage

Ruby Common Program（irb）

First Step：
```
require 'wy_wecall'
```
Second Step：
```
$wecall_client = WyWecall::Client.new(
    app_key: 'app_key',
    app_secret: 'app_secret',
    app_type: 'app_type',
    base_url: 'https://b.163.com',
    debug_flag: true,
    algorithm: 'SHA256',
    connection_adapter: Faraday.default_adapter,
    headers: { 'Content-Type' => 'application/json' },
    timeout: 10,
    open_timeout: 10,
    api_path: '/open/api/wecall',
    api_version: 'v1'
)
```
Request Account info
```
$wecall_client.query_account
```
Return
```
boyd = {\"requestId\":\"7f1c70ba5db7413783\",\"code\":200,\"msg\":\"success\",\"data\":{\"status\":\"AVAILABLE\",\"updateTime\":1751448326000}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wy_wecall. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wy_wecall/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WyWecall project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wy_wecall/blob/master/CODE_OF_CONDUCT.md).
