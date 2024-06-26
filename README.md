[![Ruby](https://github.com/wemind-tech/create_or_update/actions/workflows/ruby.yml/badge.svg)](https://github.com/wemind-tech/create_or_update/actions/workflows/ruby.yml)

# CreateOrUpdate

This gem provides functionality to create or update resources with a simple method.

    $ john = User.create(first_name: 'john', last_name: 'doe')
    $ puts john 
    $ => #<User id: 1, first_name: 'john', last_name: 'doe', email: 'nil'>

    $ User.create_or_update(first_name: 'john', last_name: 'doe', email: 'john@doe.com')
    $ User.find(1)
    $ => #<User id: 1, first_name: 'john', last_name: 'doe', email: 'john@doe.com'>

    $ User.create_or_update(first_name: 'john', last_name: 'bar', email: 'john@bar.com')
    $ User.find(2)
    $ => #<User id: 2, first_name: 'john', last_name: 'bar', email: 'john@bar.com'>

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add create_or_update

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install create_or_update

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/create_or_update. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/create_or_update/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the CreateOrUpdate project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/create_or_update/blob/main/CODE_OF_CONDUCT.md).
