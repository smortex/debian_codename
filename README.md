# DebianCodename

A minimalist module for providing debian/ubuntu codename to version translation.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'debian_codename'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install debian_codename

## Usage

    require 'debian_codename'

    def my_method
      version = DebianCodename.fast_find('groovy')
      # '20.10'

      codename = DebianCodename.fast_find('20.10')
      # 'groovy'
    end

## Development

After checking out the repo, run `bin/setup` to install
dependencies.

Run `rake spec` to run the tests.

Run `bin/console` for an interactive prompt that will allow you to
experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

To create a new release, create a PR. Once merged to 'main', push an annotated git
tag with just a semver X.Y.Z string. Github actions does the rest.

